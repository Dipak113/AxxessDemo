//
//  ImageViewExtension.swift
//  AxxessDemo
//
//  Created by Dhondge, Dipak on 8/04/20.
//  Copyright © 2020 Dhondge, Dipak. All rights reserved.
//

import UIKit
import Foundation

let imageCache = NSCache<AnyObject, AnyObject>()

var activityView = UIActivityIndicatorView()


extension UIImageView {
    
    func loadImageFromServer(url: String) {
        self.addSubview(activityView)
        activityView.startAnimating()
        activityView.center = self.center
        
        if let imageUrl = URL(string: url) {
            DispatchQueue.global().async { [weak self] in
                
                if let imageFromCache = imageCache.object(forKey: imageUrl as AnyObject) as? UIImage {
                    DispatchQueue.main.async {
                        self?.image = imageFromCache
                        activityView.stopAnimating()
                        activityView.removeFromSuperview()
                    }
                    return
                }
                
                if let data = try? Data(contentsOf: imageUrl) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                            imageCache.setObject(image, forKey: imageUrl as AnyObject)
                            activityView.stopAnimating()
                            activityView.removeFromSuperview()
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        activityView.stopAnimating()
                        activityView.removeFromSuperview()
                    }
                    
                }
            }
            
        } else {
            DispatchQueue.main.async {
                self.image = UIImage(named: Constants.ImageNames.defaultImage)
                activityView.stopAnimating()
                activityView.removeFromSuperview()
            }
            
        }
    }
}


