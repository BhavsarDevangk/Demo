//
//  ListViewModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import UIKit

class ListViewModel: NSObject {
    var viewController:UIViewController?
    var allData = [LoginUserList]()
    
}


extension ListUserViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objListViewModel.allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblDisplayData.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        let data = objListViewModel.allData[indexPath.row]
        cell.lblTitle.text = data.name
        return cell
    }
    
    
}

