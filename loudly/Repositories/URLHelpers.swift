//
//  URL+Helpers.swift
//  loudly
//
//  Created by Maahd Shahzad on 10/24/20.
//  Copyright © 2020 Maahd Shahzad. All rights reserved.
//

import Foundation

// URL helper method to add parameters
extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
