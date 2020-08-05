//
//  ViewController.swift
//  AxxessDemo
//
//  Created by Dhondge, Dipak on 8/04/20.
//  Copyright © 2020 Dhondge, Dipak. All rights reserved.
//

import UIKit
import SnapKit
class ListViewController: UIViewController {

    
    private var tableView: UITableView!
    private var listViewModel: ListViewModel = ListViewModel()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        listViewModel.listViewModelProtocol = self
        listViewModel.fetchListData()
        self.title = "List"
    }
    
    /// Function to perform detail view navigation
    /// - Parameter listObjcet: list object instance
    func navigateToDetailsViewController(listObjcet: ListObject) {
        let detailsViewController = DetailViewController()
        detailsViewController.listObject = listObjcet
        
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    /// Function to configure table view
    func configureTableView() {
        tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellIdentifier)
        view.addSubview(tableView)
        
        addTableViewConstraints()
    }
    
    /// Function to add table view constraints
    func addTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
          make.leading.equalToSuperview()
          make.top.equalToSuperview()
          make.trailing.equalToSuperview()
          make.bottom.equalToSuperview()
          }
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listObject = listViewModel.listObjects[indexPath.row]
        navigateToDetailsViewController(listObjcet: listObject)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return listViewModel.listObjects.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellIdentifier, for: indexPath) as! ListTableViewCell
           let listObject = listViewModel.listObjects[indexPath.row]
           
           cell.idLabel.text = Constants.ControllerStaticConstants.id + listObject.id
           cell.typeLabel.text = Constants.ControllerStaticConstants.type + listObject.type
           cell.dateLabel.text = Constants.ControllerStaticConstants.date + listObject.date
          
        if String(listObject.data).validateUrl(){
            cell.dataLabel.textColor = .blue
        }else {
            cell.dataLabel.textColor = .black
        }
        
        let strOFData = Constants.ControllerStaticConstants.data
          + String(listObject.data)
        
        cell.dataLabel.text = strOFData
        
           return cell
       }
    
    
    
}
extension String {
func validateUrl() -> Bool {
  let urlRegEx = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
    return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: self)
  }
}

extension ListViewController: ListViewModelProtocol {
    //this methods will get called when view model will get response
    func showNoDataMessage() {
        self.showAlert(withTitle: Constants.Alerts.alert, message: Constants.Alerts.noData)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

