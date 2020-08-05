//
//  ListViewModel.swift
//  AxxessDemo
//
//  Created by Dipak Dhondge on 05/08/20.
//  Copyright © 2020 Dipak Dhondge. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

protocol ListViewModelProtocol {
    //View model and controller communicator
    func reloadTableView()
    func showNoDataMessage()
}

class ListViewModel: NSObject {
    
    var listObjects: [ListObject] = []
    var listViewModelProtocol: ListViewModelProtocol?
    
    /// Function to call fetch api from model file
    func fetchListData() {
        ServerManager.sharedInstance.getListFromServer() { (success, error) in
            DispatchQueue.main.async {
                self.listObjects = RealmManager().fetchDataFromRealm()
                if self.listObjects.count > 0 {
                    self.listViewModelProtocol?.reloadTableView()
                } else {
                    self.listViewModelProtocol?.showNoDataMessage()
                }
            }
        }
    }
}

extension Results {
    func toArray() -> [Element] {
        return compactMap {
            $0
        }
    }
}
