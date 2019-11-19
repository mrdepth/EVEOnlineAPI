//
//  EVEAPITests.swift
//  EVEAPITests
//
//  Created by Artem Shimanski on 11/19/19.
//  Copyright © 2019 Artem Shimanski. All rights reserved.
//

import XCTest
@testable import EVEAPI
import Alamofire

struct HTTPBinResponse: Decodable {
    let headers: [String: String]
    let origin: String
    let url: String
    let data: String?
    let form: [String: String]?
    let args: [String: String]
}


class EVEAPITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testImageSize() {
        XCTAssertEqual(ESI.Image.Size(CGSize(width: 32, height: 32)), .size32)
        XCTAssertEqual(ESI.Image.Size(CGSize(width: 64, height: 32)), .size64)
        XCTAssertEqual(ESI.Image.Size(CGSize(width: 128, height: 64)), .size128)
        XCTAssertEqual(ESI.Image.Size(CGSize(width: 255, height: 255)), .size256)
        XCTAssertEqual(ESI.Image.Size(CGSize(width: 500, height: 500)), .size512)
        XCTAssertEqual(ESI.Image.Size(CGSize(width: 2000, height: 2000)), .size1024)
    }
    
    func testDecodable() {
        var session: Session! = Session()
        let end = expectation(description: "wait")
        let r = session.publisher("https://httpbin.org/get").responseDecodable(of: HTTPBinResponse.self).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }) { (value) in
            end.fulfill()
        }
        
        wait(for: [end], timeout: 5)
        session = nil
        r.cancel()
    }
    
    func testImage() {
        let esi = ESI()
        let end = expectation(description: "wait")
        let r = esi.image.character(1338057886, size: .size1024).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }) { (image) in
            end.fulfill()
        }
        
        wait(for: [end], timeout: 5)
        r.cancel()
    }
    
    func testServerStatus() {
        let esi = ESI()
        let end = expectation(description: "wait")
        let r = esi.status.retrieveTheUptimeAndPlayerCounts().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }) { (result) in
            end.fulfill()
        }
        
        wait(for: [end], timeout: 5)
        r.cancel()
    }
}
