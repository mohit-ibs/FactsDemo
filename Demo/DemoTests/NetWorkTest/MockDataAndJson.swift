//
//  MockDataAndJson.swift
//  DemoTests
//
//  Created by Mohit Gupta on 24/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation
@testable import Demo

class MockDataAndJson {
    class func jsonStirngWithFactData() -> String {
        return "{\"title\":\"About Canada\",\"rows\":[{\"title\":\"Beavers\",\"description\":\"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony\",\"imageHref\":\"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg\"},{\"title\":\"Flag\",\"description\":null,\"imageHref\":\"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png\"},{\"title\":\"Transportation\",\"description\":\"It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.\",\"imageHref\":\"http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg\"},{\"title\":\"Hockey Night in Canada\",\"description\":\"These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.\",\"imageHref\":\"http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg\"}]}\r\n"
    }
    
    class func invalidJson() -> String {
        return "{\"data\":{}}\r\n"
    }
    
    class func getFactObject() -> Facts? {
        let jsonData = MockDataAndJson.jsonStirngWithFactData().data(using: .utf8)
        // Parse the JSON
        do {
            let fact = try JSONDecoder().decode(Facts.self, from: jsonData!)
            return fact
            
        } catch {
            return nil
        }
    }
    
}
