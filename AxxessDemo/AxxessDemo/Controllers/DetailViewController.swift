//
//  DetailViewController.swift
//  AxxessDemo
//
//  Created by Dhondge, Dipak on 8/04/20.
//  Copyright © 2020 Dhondge, Dipak. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var listObject = ListObject()
    
    let imageView: UIImageView = {
       let theImageView = UIImageView()
        theImageView.image = UIImage(named: Constants.ImageNames.defaultImage)
       theImageView.translatesAutoresizingMaskIntoConstraints = false
        
       return theImageView
    }()
    
     let textView:UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.font = UIFont.systemFont(ofSize: 18)
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailView()
        self.title = "Detail View"
    }
    
    /// Function to setup Detail View Controller
    func setupDetailView() {
        view.backgroundColor = .white
        
        if listObject.type == Constants.RealmConstants.image {
            view.addSubview(imageView)
            imageView.loadImageFromServer(url: listObject.data)
            setImageViewConstraints()
        } else {
            view.addSubview(textView)
            textView.text = String(listObject.data.filter { !" \n".contains($0) })
            setTextViewConstraints()
        }
    }
    
    /// Function to add image view constraints
    func setImageViewConstraints() {
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
    }
    
    /// Function to add text view constraints
    func setTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
