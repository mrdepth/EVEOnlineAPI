//
//  murmurhash3.h
//  Neocom
//
//  Created by Артем Шиманский on 21.01.14.
//  Copyright (c) 2014 Artem Shimanski. All rights reserved.
//

#ifndef Neocom_murmurhash3_h
#define Neocom_murmurhash3_h

#include <stdint.h>

uint32_t murmurHash3 (const void* key, int len, uint32_t seed);

#endif
