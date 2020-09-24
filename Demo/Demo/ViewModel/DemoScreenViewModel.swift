//
//  DemoScreenViewModel.swift
//  Demo
//
//  Created by Mohit Gupta on 24/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation


/// A view model for `AlbumScreenViewModel`. This contains the interaction
/// logic for the controller and sends `Albums to the
/// view-controller for presentation.

class DemoScreenViewModel {
    /// Set this property to receive state change events
    typealias successCallback = ((Facts) -> Void)
    typealias errorCallback = ((String) -> Void)
    private let api: FactAPI
    var factsData : Facts? = nil
    
    /// Create a AlbumScreenViewModel.
    ///
    /// - Parameter api: Used to interact with the network
    init(api: FactAPI = FactListAPI()) {
        self.api = api
    }
    
    /// Called when the view is on screen
    /// - Parameter searchText: Used to search string for album list
    /// - Parameter successCallback: Used to notify api call is succesfull
    /// - Parameter errorCallBack: Used to notify som error is occured
    func factsData(successCallback: @escaping successCallback, errorCallBack: @escaping errorCallback) {
        api.getAllFacts(callback: {[weak self] (facts) in
            self?.factsData = facts
            successCallback(facts)
        }) { (error) in
                errorCallBack(error)
        }
    }
}
