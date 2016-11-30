//
//  EVEImage.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 30.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit

class EVEImage: NSObject {

	public class func imageURL(characterID: Int, dimension: Int) -> URL {
		let dimensions = [32, 64, 128, 256, 512, 1024]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		return URL(string: "https://imageserver.eveonline.com/Character/\(characterID)_\(bestDimension).jpg")!
	}
	
	public class func imageURL(corporationID: Int, dimension: Int) -> URL {
		let dimensions = [32, 64, 128, 256]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		return URL(string: "https://imageserver.eveonline.com/Corporation/\(corporationID)_\(bestDimension).jpg")!
	}
	
	public class func imageURL(allianceID: Int, dimension: Int) -> URL {
		let dimensions = [32, 64, 128]
		var bestDimension = dimensions.last!
		for d in dimensions {
			if d >= dimension {
				bestDimension = d
				break
			}
		}
		return URL(string: "https://imageserver.eveonline.com/Alliance/\(allianceID)_\(bestDimension).jpg")!
	}
}
