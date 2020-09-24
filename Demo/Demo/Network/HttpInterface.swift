//
//  HttpInterface.swift
//  LastFM
//
//  Created by Mohit Gupta on 23/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

/// A protocol for making network requests
protocol HttpInterface {
    /// Make a network request asynchronously
    func makeRequest(request: URLRequest, callback: @escaping (Data?, URLResponse?, Error?) -> Void)
}
