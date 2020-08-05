//
//  BusinessObjects.swift
//  AxxessDemo//  AxxessDemo
//
//  Created by Dhondge, Dipak on 8/04/20.
//  Copyright © 2020 Dhondge, Dipak. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ListObject: Object {
    
    @objc dynamic var id: String = Constants.Strings.emptyString
    @objc dynamic var type: String = Constants.Strings.emptyString
    @objc dynamic var date: String = Constants.Strings.emptyString
    @objc dynamic var data: String = Constants.Strings.emptyString
    
    override class func primaryKey() -> String? {
        return Constants.RealmConstants.id
    }
}

struct ListObject2:Decodable {
       static let id = "id"
       static let type = "type"
       static let data = "data"
       static let date = "date"
       static let image = "image"
}
