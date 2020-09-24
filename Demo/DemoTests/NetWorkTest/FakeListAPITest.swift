//
//  FakeListAPITest.swift
//  DemoTests
//
//  Created by Mohit Gupta on 24/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import XCTest
@testable import Demo

class FakeListAPITest: XCTestCase {
    
    /// Fake HTTP interface for faking the network calls
    class FakeHTTPInterface: HttpInterface {
        private let data: Data?
        private let response: URLResponse?
        private let error: Error?
        /// Will use the callback based on these values
        init(data: Data?, response: URLResponse?, error: Error?) {
            self.data = data
            self.response = response
            self.error = error
        }
        func makeRequest(request: URLRequest, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
            callback(data, response, error)
        }
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
     func testGetAllFacts() {
        let json = MockDataAndJson.jsonStirngWithFactData().data(using: .utf8)
        
        let httpInterface = FakeHTTPInterface(data: json, response: nil, error: nil)
        let api = FactListAPI(httpInterface: httpInterface)
        let expectation = XCTestExpectation(description: "Make network request")
        // When
        api.getAllFacts(callback: { (album) in
            XCTAssertNotNil(album)
            XCTAssert(album.rows.count > 0)
            expectation.fulfill()
        }) { (error) in
            print(error)
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testGetBadAllFactsData() {
        let json = MockDataAndJson.invalidJson().data(using: .utf8)
        
        let httpInterface = FakeHTTPInterface(data: json, response: nil, error: nil)
        let api = FactListAPI(httpInterface: httpInterface)
        let expectation = XCTestExpectation(description: "Make network request")
        // When
        api.getAllFacts(callback: { (album) in
        }) { (error) in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
}
