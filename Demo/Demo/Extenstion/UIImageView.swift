//
//  UIImageView.swift
//  LastFM
//
//  Created by Mohit Gupta on 24/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation
import UIKit

protocol Cachable {}

private  let imageCache = NSCache<NSString, UIImage>()

extension UIImageView: Cachable {}

extension Cachable where Self: UIImageView {
    
    typealias SuccessCompletion = (Bool) -> ()
    
    //This function is used to download image asynchronously and maintain cache
    func loadImageUsingCacheWithURLString(_ URLString: String, placeHolder: UIImage?, completion: @escaping SuccessCompletion) {
        
        self.image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            DispatchQueue.main.async {
                self.image = cachedImage
                completion(true)
            }
            return
        }
        self.image = placeHolder
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: {[weak self] (data, response, error) in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                if httpResponse.statusCode == 200 {
                    
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            DispatchQueue.main.async {
                                self?.image = downloadedImage
                                completion(true)
                            }
                        }
                    }
                } else {
                    self?.image = placeHolder
                }
            }).resume()
        } else {
            self.image = placeHolder
        }
    }
}
