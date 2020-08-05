//
//  ServerManager.swift
//  AxxessDemo
//
//  Created by Dhondge, Dipak on 8/04/20.
//  Copyright © 2020 Dhondge, Dipak. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import UIKit

class ServerManager: NSObject {
    
    static let sharedInstance = ServerManager()
    
    
    /// Function to get List from server
    /// - Parameters:Nil
    ///   - handler: handler to provide results back to view model
    //create the url with URL
    
    func getListFromServer(handler:@escaping (Bool?, Error?)->Void) {
         //create the url with URL
        let url2 = URL(string: "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json")
        
        //create AF request to send data to the server and JSON response back
        AF.request(url2!, method: .get)
        .responseJSON { response in
            if response.data != nil {
                let json = try! JSONSerialization.jsonObject(with: response.data!, options: [])
            RealmManager().storeDataInRealM(json: (json as? [[String: Any]])!)
            handler(true,nil)
            }
        }
    }
}
