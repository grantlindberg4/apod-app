//
//  ViewController.swift
//  apod
//
//  Created by Lindberg on 3/29/18.
//  Copyright © 2018 Lindberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        self.renderPhotoInfoToScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI(with photoInfo: PhotoInfo) {
        guard let url = photoInfo.url.withHTTPS() else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.imageView.image = image
                    self.descriptionLabel.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    }
                    else {
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        })
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        task.resume()
    }
    
    func renderPhotoInfoToScreen() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
            else {
                let alert = UIAlertController(title: "Failed to retrieve information",
                                              message: "There may be no data, the data was not serialized, or the selected date's media type may be a video",
                                              preferredStyle: .alert)
                let confirm = UIAlertAction(title: "Confirm", style: .default)
                alert.addAction(confirm)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func unwindFromDateViewController(unwindSegue: UIStoryboardSegue) {
        self.renderPhotoInfoToScreen()
    }
}

