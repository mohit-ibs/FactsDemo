//
//  FactListAPI.swift
//  Demo
//
//  Created by Mohit Gupta on 24/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

class FactListAPI : FactAPI {    
    private let httpInterface: HttpInterface

    /// Create a FactListAPI.
    ///
    /// - Parameter httpInterface: The interface used to make network requests.
    init(httpInterface: HttpInterface = HttpURLSessionWrapper()) {
        self.httpInterface = httpInterface
    }

    /// API call for getting data from server
    ///
    /// - Parameter FactsCallback: callback event to notify view controller
    /// - Parameter errorCallBack:  callback event to notify view controller some error is occured
    func getAllFacts(callback: @escaping FactsCallback, errorCallBack: @escaping errorCallback) {
        
        // Setup the request with URL
        let urlString = APICallIdentifier.baseURL + APICallIdentifier.methodName
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async { errorCallBack(ErrorString.urlIsNotCorrect)}
            return
        }
        
        let request = URLRequest(url: url)

        
        httpInterface.makeRequest(request: request) { (data, response, error) in
            // Ensure the request succeeded
            let responseStrInISOLatin = String(data: data!, encoding: String.Encoding.isoLatin1)
            
            guard let jsonData = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                DispatchQueue.main.async { errorCallBack(ErrorString.dataNotFound)}
                return
            }
            
            // Parse the JSON
            do {
                let facts = try JSONDecoder().decode(Facts.self, from: jsonData)
                DispatchQueue.main.async { callback(facts) }
            } catch {
                DispatchQueue.main.async { errorCallBack(ErrorString.dataNotFound)}
            }
        }
    }
    
}
