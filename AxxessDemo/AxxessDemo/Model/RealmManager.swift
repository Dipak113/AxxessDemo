//
//  RealmManager.swift
//  AxxessDemo
//
//  Created by Dhondge, Dipak on 8/04/20.
//  Copyright © 2020 Dhondge, Dipak. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RealmManager {
    let realm = try! Realm()
    
    /// Function to store data in realm
    /// - Parameter json: json from api
    func storeDataInRealM(json: [[String: Any]]) {
        self.removeDataFromRealm()
        try! realm.write {
            for item in json {
                let listObject = ListObject()
                listObject.id = item[Constants.RealmConstants.id] as? String ?? Constants.Alerts.noData
                listObject.type = item[Constants.RealmConstants.type] as? String ?? Constants.Alerts.noData
                listObject.data = item[Constants.RealmConstants.data] as? String ?? Constants.Alerts.noData
                listObject.date = item[Constants.RealmConstants.date] as? String ?? Constants.Alerts.noData
                
                realm.add(listObject, update: .modified)
                
            }
        }
    }
    
    /// Function to clear realm data
    func removeDataFromRealm() {
        try? realm.write {
            realm.deleteAll()
        }
    }
    
    /// Function to fetch data from realm
     func fetchDataFromRealm() -> [ListObject] {
        let realm = try! Realm()
        let data = realm.objects(ListObject.self).sorted(byKeyPath: Constants.RealmConstants.type, ascending: true).toArray()
        
        return data
    }

}
