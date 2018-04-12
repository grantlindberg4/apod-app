//
//  URL+Helpers.swift
//  apod
//
//  Created by Lindberg on 4/10/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}