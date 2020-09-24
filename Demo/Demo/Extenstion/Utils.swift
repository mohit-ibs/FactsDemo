//
//  Utils.swift
//  LastFM
//
//  Created by Mohit Gupta on 12/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

class Utils {
    
    class func parseJSON(inputData: NSData) -> NSDictionary?{
        do {
            let dataDictionary: NSDictionary = try JSONSerialization.jsonObject(with: inputData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            return dataDictionary
        }catch {
            return nil
        }
    }
}
