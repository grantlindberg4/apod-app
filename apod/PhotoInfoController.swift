//
//  PhotoInfoController.swift
//  apod
//
//  Created by Lindberg on 4/10/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import UIKit
import Foundation

let API_KEY = "8lxcX2I3ErblI9o8cAuYDypoQPRafkLttcBqkO3O"
let appDelegate = UIApplication.shared.delegate as! AppDelegate

class PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        // Bad video date
//        let currDate = "2018-04-16"
        let query: [String: String] = [
            "api_key": API_KEY,
            "date": appDelegate.selectedDate!
        ]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
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
