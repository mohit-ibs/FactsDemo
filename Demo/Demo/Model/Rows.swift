//
//  Rows.swift
//  Demo
//
//  Created by Mohit Gupta on 23/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

// MARK: - Facts
struct Facts: Codable {
    let title: String
    let rows: [Row]
}

// MARK: - Row
struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
