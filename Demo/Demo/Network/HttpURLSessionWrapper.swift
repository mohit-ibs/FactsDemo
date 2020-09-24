//
//  HttpURLSessionWrapper.swift
//  LastFM
//
//  Created by Mohit Gupta on 11/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

/// `URLSession` wrapper that conforms to `HttpInterface`
class HttpURLSessionWrapper: HttpInterface {
    /// Make a request as you would via `URLSession`. This will return
    /// immediately and send the response via the callback.
    func makeRequest(request: URLRequest, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: callback)
        task.resume()
    }
}


