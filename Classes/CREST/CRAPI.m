//
//  CRAPI.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.11.15.
//
//

#import "CRAPI.h"
#import "NSDateFormatter+EVEOnlineAPI.h"
#import "NSURL+MD5.h"
#import "CRAPISerializer.h"

static NSPointerArray* gClients;

@interface CRAPI()
@property (nonatomic, strong, readwrite) NSString* clientID;
@property (nonatomic, strong, readwrite) NSString* secretKey;
@property (nonatomic, strong, readwrite) NSURL* callbackURL;
@property (nonatomic, strong, readwrite) CRToken* token;
@property (nonatomic, assign) BOOL publicAPI;

@property (nonatomic, strong) NSString* state;
@property (nonatomic, copy) void(^authenticationCompletionBlock) (CRToken* accessToken, NSError* error);
- (void) verifyAuthorizationCode:(NSString*) code;
- (void) verifyToken:(CRToken*) token;
- (void) refreshToken:(CRToken*) token;
- (void) GET:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock;
@end

@implementation CRAPI

+ (instancetype) apiWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy clientID:(NSString*) clientID secretKey:(NSString*) secretKey token:(CRToken*) token callbackURL:(NSURL*) callbackURL {
	return [[self alloc] initWithCachePolicy:cachePolicy clientID:clientID secretKey:secretKey token:token callbackURL:callbackURL];
}

+ (instancetype) publicApiWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy {
	return [[self alloc] initPublicAPIWithCachePolicy:cachePolicy];
}

+ (void) handleOpenURL:(NSURL*) url {
	NSURLComponents* components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
	NSString* code;
	NSString* state;
	if ([components.scheme isEqualToString:@"neocom"] && [components.host isEqualToString:@"sso"]) {
		
	}
	for (NSURLQueryItem* item in components.queryItems) {
		if ([item.name isEqualToString:@"code"])
			code = item.value;
		else if ([item.name isEqualToString:@"state"])
			state = item.value;
	}
	if (state && code) {
		for (CRAPI* api in [gClients allObjects]) {
			if ([api.state isEqualToString:state]) {
				[api verifyAuthorizationCode:code];
				break;
			}
		}
	}
}

- (instancetype) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy clientID:(NSString*) clientID secretKey:(NSString*) secretKey token:(CRToken*) token callbackURL:(NSURL*) callbackURL {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		gClients = [NSPointerArray weakObjectsPointerArray];
	});
	
	if (self = [super init]) {
		self.cachePolicy = cachePolicy;
		self.clientID = clientID;
		self.secretKey = secretKey;
		self.callbackURL = callbackURL;
		self.token = token;
		@synchronized(gClients) {
			[gClients addPointer:(__bridge void*) self];
		}
	}
	return self;
}

- (instancetype) initPublicAPIWithCachePolicy:(NSURLRequestCachePolicy)cachePolicy {
	if (self = [super init]) {
		self.cachePolicy = cachePolicy;
		self.publicAPI = YES;
	}
	return self;
}

- (EVEHTTPSessionManager*) sessionManager {
/*	if (self.publicAPI) {
		static AFHTTPRequestOperationManager* manager;
		if (!manager) {
			static dispatch_once_t onceToken;
			dispatch_once(&onceToken, ^{
				manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://public-crest.eveonline.com"]];
			});
		}
		return manager;
	}
	else {
		static AFHTTPRequestOperationManager* manager;
		if (!manager) {
			static dispatch_once_t onceToken;
			dispatch_once(&onceToken, ^{
				manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://crest-tq.eveonline.com"]];
			});
		}
		return manager;
	}*/
	
	static EVEHTTPSessionManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[EVEHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://crest-tq.eveonline.com"]];
		});
	}
	return manager;
}


- (void) dealloc {
	@synchronized(gClients) {
		NSInteger i = [[gClients allObjects] indexOfObject:self];
		if (i != NSNotFound)
			[gClients removePointerAtIndex:i];
	}
}

- (void) authenticateWithCompletionBlock:(void(^)(CRToken* token, NSError* error)) completionBlock {
	self.authenticationCompletionBlock = completionBlock;
	if (self.token.refreshToken) {
		[self refreshToken:self.token];
	}
	else {
		self.state = [[NSUUID UUID] UUIDString];
		
		NSString* urlString = [NSString stringWithFormat:@"https://login-tq.eveonline.com/oauth/authorize/?response_type=code&redirect_uri=%@&client_id=%@&scope=characterFittingsRead+characterFittingsWrite&state=%@", self.callbackURL.absoluteString, self.clientID, self.state];
#if TARGET_OS_IOS
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
		__block id blockObserver;
		__block id strongSelf = self;
		id observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
			[[NSNotificationCenter defaultCenter] removeObserver:blockObserver];
			strongSelf = nil;
		}];
		blockObserver = observer;
#else
		[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]];
#endif
	}
}

- (void) loadFittingsWithCompletionBlock:(void(^)(NSArray<CRFitting*>* result, NSError* error)) completionBlock {
	[self GET:[NSString stringWithFormat:@"characters/%d/fittings/", self.token.characterID] parameters:nil responseClass:[CRFittingCollection class] completionBlock:^(id result, NSError *error) {
		completionBlock([result isKindOfClass:[CRFittingCollection class]] ? [(CRFittingCollection*) result items] : nil, error);
	} ];
}

- (void) postFitting:(CRFitting*) fitting withCompletionBlock:(void(^)(BOOL completed, NSError* error)) completionBlock {
	[self POST:[NSString stringWithFormat:@"characters/%d/fittings/", self.token.characterID] parameters:[fitting dictionary] responseClass:nil completionBlock:^(id result, NSError *error) {
		if ([result isKindOfClass:[NSDictionary class]]) {
			if (result[@"error_description"])
				error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:result[@"error_description"]}];
			else if (result[@"exceptionType"] && result[@"message"]) {
				NSInteger code = 0;
				if ([result[@"exceptionType"] isEqualToString:@"UnauthorizedError"])
					code = CRAPIErrorBadToken;
				error = [NSError errorWithDomain:CRAPIErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey:result[@"message"]}];
			}
		}
		
		completionBlock(error == nil, error);
	}];
/*
	__block __weak void (^weakPost)();
	__block BOOL retry = NO;
	void (^post)() = ^{
		AFHTTPRequestSerializer* requestSerializer = [AFJSONRequestSerializer serializer];
		[requestSerializer setValue:[NSString stringWithFormat:@"%@ %@", self.token.tokenType, self.token.accessToken] forHTTPHeaderField:@"Authorization"];
		[requestSerializer setValue:@"application/vnd.ccp.eve.Fitting-v1+json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
		self.httpRequestOperationManager.requestSerializer = requestSerializer;
		
		AFHTTPResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
		NSMutableIndexSet* acceptableStatusCodes = [responseSerializer.acceptableStatusCodes mutableCopy];
		[acceptableStatusCodes addIndex:401];
		responseSerializer.acceptableStatusCodes = acceptableStatusCodes;
		responseSerializer.acceptableContentTypes = nil;
		self.httpRequestOperationManager.responseSerializer = responseSerializer;
		NSString* urlString = [NSString stringWithFormat:@"characters/%d/fittings/", self.token.characterID];
		void (^strongPost)() = weakPost;
		[self.httpRequestOperationManager POST:[[NSURL URLWithString:urlString relativeToURL:self.httpRequestOperationManager.baseURL] absoluteString]
									parameters:[fitting dictionary]
									   success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
										   NSError* error;
										   if ([responseObject isKindOfClass:[NSDictionary class]]) {
											   if (responseObject[@"error_description"])
												   error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error_description"]}];
											   else if (responseObject[@"exceptionType"] && responseObject[@"message"]) {
												   NSInteger code = 0;
												   if ([responseObject[@"exceptionType"] isEqualToString:@"UnauthorizedError"])
													   code = CRAPIErrorBadToken;
												   error = [NSError errorWithDomain:CRAPIErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey:responseObject[@"message"]}];
											   }
										   }
										   if (!retry && error.code == CRAPIErrorBadToken) {
											   retry = YES;
											   [self authenticateWithCompletionBlock:^(CRToken *accessToken, NSError *error) {
												   if (accessToken)
													   strongPost();
												   else if (completionBlock)
													   completionBlock(NO, error);
											   }];
										   }
										   else if (completionBlock)
											   completionBlock(error == nil, error);
									   }
									   failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
										  if (completionBlock)
											  completionBlock(NO, error);
									   }];
	};
	weakPost = post;
	post();
 */
}

- (void) deleteFittingWithID:(int64_t) fittingID completionBlock:(void(^)(BOOL completed, NSError* error)) completionBlock {
	[self DELETE:[NSString stringWithFormat:@"characters/%d/fittings/%qi/", self.token.characterID, fittingID] parameters:nil responseClass:nil completionBlock:^(id result, NSError *error) {
		if ([result isKindOfClass:[NSDictionary class]]) {
			if (result[@"error_description"])
				error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:result[@"error_description"]}];
			else if (result[@"exceptionType"] && result[@"message"]) {
				NSInteger code = 0;
				if ([result[@"exceptionType"] isEqualToString:@"UnauthorizedError"])
					code = CRAPIErrorBadToken;
				error = [NSError errorWithDomain:CRAPIErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey:result[@"message"]}];
			}
		}
		
		completionBlock(error == nil, error);
	}];
/*
	__block __weak void (^weakDelete)();
	__block BOOL retry = NO;
	void (^delete)() = ^{
		AFHTTPRequestSerializer* requestSerializer = [AFJSONRequestSerializer serializer];
		[requestSerializer setValue:[NSString stringWithFormat:@"%@ %@", self.token.tokenType, self.token.accessToken] forHTTPHeaderField:@"Authorization"];
		self.httpRequestOperationManager.requestSerializer = requestSerializer;
		
		AFHTTPResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
		NSMutableIndexSet* acceptableStatusCodes = [responseSerializer.acceptableStatusCodes mutableCopy];
		[acceptableStatusCodes addIndex:401];
		responseSerializer.acceptableStatusCodes = acceptableStatusCodes;
		responseSerializer.acceptableContentTypes = nil;
		self.httpRequestOperationManager.responseSerializer = responseSerializer;
		NSString* urlString = [NSString stringWithFormat:@"characters/%d/fittings/%qi/", self.token.characterID, fittingID];
		void (^strongDelete)() = weakDelete;
		[self.httpRequestOperationManager DELETE:[[NSURL URLWithString:urlString relativeToURL:self.httpRequestOperationManager.baseURL] absoluteString]
									parameters:nil
									   success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
										   NSError* error;
										   if ([responseObject isKindOfClass:[NSDictionary class]]) {
											   if (responseObject[@"error_description"])
												   error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error_description"]}];
											   else if (responseObject[@"exceptionType"] && responseObject[@"message"]) {
												   NSInteger code = 0;
												   if ([responseObject[@"exceptionType"] isEqualToString:@"UnauthorizedError"])
													   code = CRAPIErrorBadToken;
												   error = [NSError errorWithDomain:CRAPIErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey:responseObject[@"message"]}];
											   }
										   }
										   if (!retry && error.code == CRAPIErrorBadToken) {
											   retry = YES;
											   [self authenticateWithCompletionBlock:^(CRToken *accessToken, NSError *error) {
												   if (accessToken)
													   strongDelete();
												   else if (completionBlock)
													   completionBlock(NO, error);
											   }];
										   }
										   else if (completionBlock)
											   completionBlock(error == nil, error);
									   }
									   failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
										   if (completionBlock)
											   completionBlock(NO, error);
									   }];
	};
	weakDelete = delete;
	delete();
 */
}

- (void) loadKillMailWithID:(int64_t) killID hash:(NSString*) hash completionBlock:(void(^)(CRKillMail* killMail, NSError* error)) completionBlock {
	[self GET:[NSString stringWithFormat:@"killmails/%qi/%@/", killID, hash] parameters:nil responseClass:[CRKillMail class] completionBlock:^(id result, NSError *error) {
		completionBlock([result isKindOfClass:[CRKillMail class]] ? result : nil, error);
	} ];
}

- (void) loadSellOrdersWithTypeID:(int32_t) typeID regionID:(int32_t) regionID completionBlock:(void(^)(CRMarketOrderCollection* marketOrders, NSError* error)) completionBlock {
	[self GET:[NSString stringWithFormat:@"market/%d/orders/sell/?type=https://crest-tq.eveonline.com/inventory/types/%d/", regionID, typeID] parameters:nil responseClass:[CRMarketOrderCollection class] completionBlock:^(id result, NSError *error) {
		completionBlock([result isKindOfClass:[CRMarketOrderCollection class]] ? result : nil, error);
	} ];
}

- (void) loadBuyOrdersWithTypeID:(int32_t) typeID regionID:(int32_t) regionID completionBlock:(void(^)(CRMarketOrderCollection* marketOrders, NSError* error)) completionBlock {
	[self GET:[NSString stringWithFormat:@"market/%d/orders/buy/?type=https://crest-tq.eveonline.com/inventory/types/%d/", regionID, typeID] parameters:nil responseClass:[CRMarketOrderCollection class] completionBlock:^(id result, NSError *error) {
		completionBlock([result isKindOfClass:[CRMarketOrderCollection class]] ? result : nil, error);
	} ];
}

- (void) loadIncursionsWithCompletionBlock:(void(^)(CRIncursionCollection* incursions, NSError* error)) completionBlock {
	[self GET:@"incursions/" parameters:nil responseClass:[CRIncursionCollection class] completionBlock:^(id result, NSError *error) {
		completionBlock([result isKindOfClass:[CRIncursionCollection class]] ? result : nil, error);
	} ];
}

- (void) loadSolarSystemWithSolarSystemID:(int32_t) solarSystemID completionBlock:(void(^)(CRSolarSystem* solarSystem, NSError* error)) completionBlock {
	[self GET:[NSString stringWithFormat:@"solarsystems/%d/", solarSystemID] parameters:nil responseClass:[CRSolarSystem class] completionBlock:^(id result, NSError *error) {
		completionBlock([result isKindOfClass:[CRSolarSystem class]] ? result : nil, error);
	} ];
}

- (void) loadMarketHistoryWithTypeID:(int32_t) typeID regionID:(int32_t) regionID completionBlock:(void(^)(CRMarketHistoryCollection* marketHistory, NSError* error)) completionBlock {
	[self GET:[NSString stringWithFormat:@"market/%d/types/history/?type=https://crest-tq.eveonline.com/inventory/types/%d/", regionID, typeID] parameters:nil responseClass:[CRMarketHistoryCollection class] completionBlock:^(id result, NSError *error) {
		completionBlock([result isKindOfClass:[CRMarketHistoryCollection class]] ? result : nil, error);
	} ];
}



#pragma mark - Private

- (void) verifyAuthorizationCode:(NSString*) code {
	NSString* basicAuth = [NSString stringWithFormat:@"%@:%@", self.clientID, self.secretKey];

	AFHTTPRequestSerializer* requestSerializer = [AFJSONRequestSerializer serializer];
	[requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", [[basicAuth dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0]] forHTTPHeaderField:@"Authorization"];
	self.sessionManager.requestSerializer = requestSerializer;
	
	AFHTTPResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
	NSMutableIndexSet* acceptableStatusCodes = [responseSerializer.acceptableStatusCodes mutableCopy];
	[acceptableStatusCodes addIndex:400];
	responseSerializer.acceptableStatusCodes = acceptableStatusCodes;
	
	[self.sessionManager POST:@"https://login-tq.eveonline.com/oauth/token" parameters:@{@"grant_type":@"authorization_code", @"code":code} responseSerializer:responseSerializer completionBlock:^(id responseObject, NSError *error) {
		if (error) {
			if (self.authenticationCompletionBlock) {
				self.authenticationCompletionBlock(nil, error);
				self.authenticationCompletionBlock = nil;
			}
		}
		else {
			NSError* error;
			CRToken* token = [CRToken new];
			if ([responseObject isKindOfClass:[NSDictionary class]]) {
				if (responseObject[@"error_description"]) {
					error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error_description"]}];
				}
				else {
					token.accessToken = responseObject[@"access_token"];
					token.refreshToken = responseObject[@"refresh_token"];
					token.tokenType = responseObject[@"token_type"];
					token.expiresOn = [NSDate dateWithTimeIntervalSinceNow:[responseObject[@"expires_in"] doubleValue]];
				}
			}
			if (!error & (!token.accessToken || !token.tokenType || !token.refreshToken))
				error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"Invalid server response", nil)}];
			if (error) {
				if (self.authenticationCompletionBlock) {
					self.authenticationCompletionBlock(nil, error);
					self.authenticationCompletionBlock = nil;
				}
			}
			else
				[self verifyToken:token];
		}
	}];
}

- (void) verifyToken:(CRToken*) token {
	AFHTTPRequestSerializer* requestSerializer = [AFHTTPRequestSerializer serializer];
	[requestSerializer setValue:[NSString stringWithFormat:@"%@ %@", token.tokenType, token.accessToken] forHTTPHeaderField:@"Authorization"];
	self.sessionManager.requestSerializer = requestSerializer;
	
	AFHTTPResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
	NSMutableIndexSet* acceptableStatusCodes = [responseSerializer.acceptableStatusCodes mutableCopy];
	[acceptableStatusCodes addIndex:400];
	responseSerializer.acceptableStatusCodes = acceptableStatusCodes;
	
	[self.sessionManager GET:@"https://login-tq.eveonline.com/oauth/verify" parameters:nil responseSerializer:responseSerializer completionBlock:^(id responseObject, NSError *error) {
		if (error) {
			if (self.authenticationCompletionBlock) {
				self.authenticationCompletionBlock(nil, error);
				self.authenticationCompletionBlock = nil;
			}
		}
		else {
			NSError* error;
			if ([responseObject isKindOfClass:[NSDictionary class]]) {
				if (responseObject[@"error_description"]) {
					error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error_description"]}];
				}
				else {
					token.characterID = [responseObject[@"CharacterID"] intValue];
					token.characterName = responseObject[@"CharacterName"];
					NSDate* expiresOn = [[NSDateFormatter crestDateFormatter] dateFromString:responseObject[@"ExpiresOn"]];
					if (expiresOn)
						token.expiresOn = expiresOn;
				}
			}
			
			if (!token.characterID && !error)
				error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"Invalid server response", nil)}];
			if (!error)
				self.token = token;
			
			if (self.authenticationCompletionBlock) {
				self.authenticationCompletionBlock(error ? nil : token, error);
				self.authenticationCompletionBlock = nil;
			}
		}
	}];
}

- (void) refreshToken:(CRToken*) token {
	NSString* basicAuth = [NSString stringWithFormat:@"%@:%@", self.clientID, self.secretKey];
	
	AFHTTPRequestSerializer* requestSerializer = [AFHTTPRequestSerializer serializer];
	[requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", [[basicAuth dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0]] forHTTPHeaderField:@"Authorization"];
	self.sessionManager.requestSerializer = requestSerializer;
	
	AFHTTPResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
	NSMutableIndexSet* acceptableStatusCodes = [responseSerializer.acceptableStatusCodes mutableCopy];
	[acceptableStatusCodes addIndex:400];
	responseSerializer.acceptableStatusCodes = acceptableStatusCodes;
	
	[self.sessionManager POST:@"https://login-tq.eveonline.com/oauth/token" parameters:@{@"grant_type":@"refresh_token", @"refresh_token":token.refreshToken} responseSerializer:responseSerializer completionBlock:^(id responseObject, NSError *error) {
		if (error) {
			if (self.authenticationCompletionBlock) {
				self.authenticationCompletionBlock(nil, error);
				self.authenticationCompletionBlock = nil;
			}
		}
		else {
			NSError* error;
			CRToken* token = [CRToken new];
			if ([responseObject isKindOfClass:[NSDictionary class]]) {
				if (responseObject[@"error_description"]) {
					error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:responseObject[@"error_description"]}];
				}
				else {
					token.accessToken = responseObject[@"access_token"];
					token.refreshToken = responseObject[@"refresh_token"];
					token.tokenType = responseObject[@"token_type"];
					token.expiresOn = [NSDate dateWithTimeIntervalSinceNow:[responseObject[@"expires_in"] doubleValue]];
				}
			}
			if (!error & (!token.accessToken || !token.tokenType || !token.refreshToken))
				error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"Invalid server response", nil)}];
			if (error) {
				if (self.authenticationCompletionBlock) {
					self.authenticationCompletionBlock(nil, error);
					self.authenticationCompletionBlock = nil;
				}
			}
			else
				[self verifyToken:token];		}
	}];
}

- (void) dataTaskWithHTTPMethod:(NSString *)method URLString:(NSString *)URLString parameters:(id)parameters responseClass:(Class) responseClass completionBlock:(void (^)(id responseObject, NSError* error))completionBlock {
	AFHTTPRequestSerializer* requestSerializer = [AFHTTPRequestSerializer serializer];
	if (!self.publicAPI)
		[requestSerializer setValue:[NSString stringWithFormat:@"%@ %@", self.token.tokenType, self.token.accessToken] forHTTPHeaderField:@"Authorization"];
	requestSerializer.cachePolicy = self.cachePolicy;
	[requestSerializer setValue:[responseClass contentType] forHTTPHeaderField:@"Accept"];
	
	AFHTTPResponseSerializer* responseSerializer;
	if (responseClass) {
		responseSerializer = [CRAPISerializer serializerWithRootClass:responseClass];
		responseSerializer.acceptableContentTypes = [NSSet setWithObject:[responseClass contentType]];
	}
	else
		responseSerializer = [AFJSONResponseSerializer serializer];
	
	self.sessionManager.requestSerializer = requestSerializer;
	
	void (^send)(void (^handler)(id, NSError*)) = ^(void (^handler)(id, NSError*)) {
		AFHTTPRequestSerializer* requestSerializer = [AFHTTPRequestSerializer serializer];
		if (!self.publicAPI)
			[requestSerializer setValue:[NSString stringWithFormat:@"%@ %@", self.token.tokenType, self.token.accessToken] forHTTPHeaderField:@"Authorization"];
		requestSerializer.cachePolicy = self.cachePolicy;
		[requestSerializer setValue:[responseClass contentType] forHTTPHeaderField:@"Accept"];
		
		if ([method isEqualToString:@"POST"])
			[self.sessionManager POST:URLString parameters:parameters responseSerializer:responseSerializer completionBlock:handler];
		else if ([method isEqualToString:@"DELETE"])
			[self.sessionManager DELETE:URLString parameters:parameters responseSerializer:responseSerializer completionBlock:handler];
		else
			[self.sessionManager GET:URLString parameters:parameters responseSerializer:responseSerializer completionBlock:handler];
	};
	
	void (^handler)(id, NSError*) = ^(id responseObject, NSError *error) {
		if (!self.publicAPI && (error.code == CRAPIErrorBadToken)) {
			[self authenticateWithCompletionBlock:^(CRToken *accessToken, NSError *error) {
				if (accessToken) {
					self.sessionManager.requestSerializer = requestSerializer;
					send(completionBlock);
				}
				else {
					if (completionBlock)
						completionBlock(responseObject, error);
				}
			}];
		}
		else {
			if (completionBlock)
				completionBlock(responseObject, error);
		}
	};

	send(handler);
}

- (void) POST:(NSString*) URLString parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock {
	[self dataTaskWithHTTPMethod:@"POST" URLString:URLString parameters:parameters responseClass:responseClass completionBlock:completionBlock];
}

- (void) DELETE:(NSString*) URLString parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock {
	[self dataTaskWithHTTPMethod:@"DELETE" URLString:URLString parameters:parameters responseClass:responseClass completionBlock:completionBlock];
}

- (void) GET:(NSString*) URLString parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock {
	[self dataTaskWithHTTPMethod:@"GET" URLString:URLString parameters:parameters responseClass:responseClass completionBlock:completionBlock];
	
/*
	NSString* urlString = method;

	static NSMutableDictionary* dispatchGroups = nil;
	if (!dispatchGroups) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			dispatchGroups = [NSMutableDictionary new];
		});
	}

	BOOL load = NO;
	dispatch_group_t dispatchGroup;
	@synchronized(dispatchGroups) {
		dispatchGroup = dispatchGroups[urlString];
		if (!dispatchGroup) {
			dispatchGroups[urlString] = dispatchGroup = dispatch_group_create();
			dispatch_set_finalizer_f(dispatchGroup, (dispatch_function_t) &CFRelease);
			dispatch_group_enter(dispatchGroup);
			load = YES;
		}
	}
	
	if (completionBlock) {
		dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
			NSDictionary* context = (__bridge NSDictionary*) dispatch_get_context(dispatchGroup);
			completionBlock(context[@"result"], context[@"error"]);
		});
	}

	__block __weak void (^weakGet)();
	__block BOOL retry = NO;
	void (^get)() = ^{
		AFHTTPRequestSerializer* serializer = [AFHTTPRequestSerializer serializer];
		if (!self.publicAPI)
			[serializer setValue:[NSString stringWithFormat:@"%@ %@", self.token.tokenType, self.token.accessToken] forHTTPHeaderField:@"Authorization"];
		
		serializer.cachePolicy = self.cachePolicy;
		[serializer setValue:[responseClass contentType] forHTTPHeaderField:@"Accept"];
		
		static NSMutableDictionary* operations = nil;
		if (!operations) {
			static dispatch_once_t onceToken;
			dispatch_once(&onceToken, ^{
				operations = [NSMutableDictionary new];
			});
		}
		
		NSURLRequest* request = [serializer requestWithMethod:@"GET"
													URLString:[[NSURL URLWithString:urlString relativeToURL:self.httpRequestOperationManager.baseURL] absoluteString]
												   parameters:parameters
														error:nil];
		
		
		if (load) {
			void (^strongGet)() = weakGet;

			AFHTTPRequestOperation *operation =
			[self.httpRequestOperationManager HTTPRequestOperationWithRequest:[request copy]
																	  success:^void(AFHTTPRequestOperation * operation, id result) {
																		  if (result)
																			  dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"result":result});
																		  
																		  NSMutableDictionary* headers = [[operation.response allHeaderFields] mutableCopy];
																		  
																		  NSString* md5 = [operation.request.URL md5];
																		  NSString* etag = headers[@"Etag"];
																		  if (!etag || ![md5 isEqualToString:etag]) {
																			  
																			  NSString* date = [[NSDateFormatter rfc822DateFormatter] stringFromDate:[NSDate date]];
																			  NSString* expired = [[NSDateFormatter rfc822DateFormatter] stringFromDate:[NSDate dateWithTimeIntervalSinceNow:60 * 60]];
																			  
																			  if (date && expired) {
																				  headers[@"Date"] = date;
																				  headers[@"Expires"] = expired;
																				  headers[@"Etag"] = md5;
																				  [headers removeObjectForKey:@"Vary"];
																				  NSHTTPURLResponse* response = [[NSHTTPURLResponse alloc] initWithURL:operation.response.URL statusCode:operation.response.statusCode HTTPVersion:@"HTTP/1.1" headerFields:headers];
																				  NSCachedURLResponse* cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:operation.responseData userInfo:nil storagePolicy:NSURLCacheStorageAllowed];
																				  [[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse forRequest:operation.request];
																			  }
																		  }
																		  
																		  dispatch_group_leave(dispatchGroup);
																		  @synchronized(dispatchGroups) {
																			  [dispatchGroups removeObjectForKey:urlString];
																		  }
																		  @synchronized(operations) {
																			  [operations removeObjectForKey:request];
																		  }
																	  }
																	  failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
																		  if (!self.publicAPI && (!retry && error.code == CRAPIErrorBadToken)) {
																			  retry = YES;
																			  [self authenticateWithCompletionBlock:^(CRToken *accessToken, NSError *error) {
																				  if (accessToken)
																					  strongGet();
																				  else {
																					  dispatch_group_leave(dispatchGroup);
																					  @synchronized(dispatchGroups) {
																						  [dispatchGroups removeObjectForKey:urlString];
																					  }
																				  }
																			  }];
																		  }
																		  else {
																			  if (error)
																				  dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"error":error});
																			  dispatch_group_leave(dispatchGroup);
																			  @synchronized(dispatchGroups) {
																				  [dispatchGroups removeObjectForKey:urlString];
																			  }
																		  }
																		  @synchronized(operations) {
																			  [operations removeObjectForKey:request];
																		  }
																	  }];
			@synchronized(operations) {
				operations[request] = operation;
			}
			operation.responseSerializer = [CRAPISerializer serializerWithRootClass:responseClass];
			operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:[responseClass contentType]];
			[operation setCacheResponseBlock:^NSCachedURLResponse* (NSURLConnection* connection, NSCachedURLResponse* response) {
				return nil;
			}];
			[self.httpRequestOperationManager.operationQueue addOperation:operation];
		}
		else {
		}
	};
	weakGet = get;
	if (!self.publicAPI && (!self.token || [self.token isExpired])) {
		[self authenticateWithCompletionBlock:^(CRToken *accessToken, NSError *error) {
			if (error) {
				if (completionBlock)
					completionBlock(nil, error);
			}
			else
				get();
		}];
	}
	else
		get();
 */
}

@end
