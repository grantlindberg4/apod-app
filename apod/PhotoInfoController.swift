//
//  PhotoInfoController.swift
//  apod
//
//  Created by Lindberg on 4/10/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import Foundation

class PhotoInfoController {
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currDate = dateFormatter.string(from: Date.init())
        let query: [String: String] = [
            "api_key": "DEMO_KEY",
            "date": currDate
        ]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            }
            else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
}
