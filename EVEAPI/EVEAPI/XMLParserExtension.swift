//
//  XMLParserExtension.swift
//  EVEAPI
//
//  Created by Artem Shimanski on 27.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

private class ASXMLElement: NSObject, XMLParserDelegate {
	weak var parent: XMLParserDelegate?
	var name: String?
	var children = [String:[ASXMLElement]]()
	var string = ""
	
	init(name:String?, attributes:[String:String]?, parser:XMLParser) {
		super.init()
		self.name = name
		parent = parser.delegate
		
		if attributes != nil {
			for (key, value) in attributes! {
				let child = ASXMLElement(name: key, attributes:nil, parser:parser)
				child.string = value
				addChild(child)
			}
		}
		parser.delegate = self
	}
	
	func addChild(_ child: ASXMLElement) -> Void {
		if children[child.name!]?.append(child) == nil {
			children[child.name!] = [child]
		}
	}
	
	var object:Any {
		get {
			
			if children.isEmpty {
				return string
			}
			else {
				var dictionary = [String: Any]()
				
				for (key, value) in children {
					if value.count == 1 {
						dictionary[key] = value[0].object
					}
					else if value.count > 1 {
						dictionary[key] = value.map{$0.object}
					}
				}
				
				return dictionary
			}
		}
	}
	
	//MARK: XMLParserDelegate
	public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
		addChild(ASXMLElement(name: elementName, attributes: attributeDict, parser: parser))
	}
	
	public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		parser.delegate = parent
	}
	
	public func parser(_ parser: XMLParser, foundCharacters string: String) {
		self.string += string
	}
	
	public func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
		if let s = String(data: CDATABlock, encoding:.utf8) {
			self.string += s
		}
	}
}

extension XMLParser {
	public class func xmlObject(data: Data) throws -> Any? {
		let parser = XMLParser(data:data)
		let root = ASXMLElement(name: nil, attributes: nil, parser: parser)
		parser.delegate = root
		if parser.parse() {
			return root.object
		}
		else if parser.parserError != nil {
			throw parser.parserError!
		}
		return nil
	}
}
