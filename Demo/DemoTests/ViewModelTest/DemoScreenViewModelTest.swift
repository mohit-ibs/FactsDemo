//
//  DemoScreenViewModelTest.swift
//  DemoTests
//
//  Created by Mohit Gupta on 24/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import XCTest
@testable import Demo


class DemoScreenViewModelTest: XCTestCase {

    /// A fake API that will return data as needed without any actual networking
    class FakeAPI : FactAPI {
        
        private let fact: Facts?
        /**
         * Create a FakeAPI
         *
         * - Parameter story: The story that should be returned immediately
         * when requested via `getAllAlbums`
         * - Parameter loadForever: Set this if you want the API to never send
         * back data
         */
        init(fact: Facts? = nil) {
            self.fact = fact
        }
        func getAllFacts(callback: @escaping FactsCallback, errorCallBack: @escaping errorCallback) {
            guard let factData = fact else {
                errorCallBack("No data found")
                return
            }
            
            callback(factData)
        }
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
        let facts = MockDataAndJson.getFactObject()
        let viewModel = DemoScreenViewModel(api: FakeAPI(fact: facts))
        viewModel.factsData(successCallback: { (facts) in
            XCTAssertNotNil(facts)
        }) { (error) in
            XCTAssertNotNil(error)
        }
    }
    
    func testGetAllFactsWithError() {
           let viewModel = DemoScreenViewModel(api: FakeAPI(fact: nil))
           viewModel.factsData(successCallback: { (facts) in
               XCTAssertNil(facts)
           }) { (error) in
               XCTAssertNotNil(error)
           }
       }

}
