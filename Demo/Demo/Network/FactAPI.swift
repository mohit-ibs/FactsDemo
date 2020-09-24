//
//  FactAPI.swift
//  Demo
//
//  Created by Mohit Gupta on 24/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

protocol FactAPI {
    /// A callback for retrieving a fact data
    typealias FactsCallback = ((Facts) -> Void)
    /// A error callback
    typealias errorCallback = ((String) -> Void)
    /// Get Fact data from server
    func getAllFacts(callback: @escaping FactsCallback, errorCallBack: @escaping errorCallback)
}
