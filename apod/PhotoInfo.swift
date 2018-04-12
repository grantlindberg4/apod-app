//
//  PhotoInfo.swift
//  apod
//
//  Created by Lindberg on 4/10/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    var media_type: String?
    
    enum Keys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
        case media_type
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: Keys.self)
        self.title = try valueContainer.decode(String.self, forKey: Keys.title)
        self.description = try valueContainer.decode(String.self, forKey: Keys.description)
        self.url = try valueContainer.decode(URL.self, forKey: Keys.url)
        self.copyright = try valueContainer.decode(String.self, forKey: Keys.copyright)
        self.media_type = try valueContainer.decode(String.self, forKey: Keys.media_type)
    }
}
