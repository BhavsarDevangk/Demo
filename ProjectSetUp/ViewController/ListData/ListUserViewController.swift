//
//  ListUserViewController.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import UIKit

class ListUserViewController: UIViewController {

    @IBOutlet weak var viewHeader: HeaderView!
    @IBOutlet weak var tblDisplayData: UITableView!
    var objListViewModel = ListViewModel()
    var objLangaugePreferencesViewModel = LangaugePreferencesViewModel()
    var isFromLanguageSelection:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    override func viewDidAppear(_ animated: Bool) {
        objListViewModel.setUpHeaderView(viewHeader: viewHeader)
    }
    func configureData() {
        objLangaugePreferencesViewModel.viewController = self
        objListViewModel.viewController = self
        if isFromLanguageSelection {
            objLangaugePreferencesViewModel.setUpAllData()
        }
        tblDisplayData.delegate = self
        tblDisplayData.dataSource = self
        tblDisplayData.tableFooterView = UIView()
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ListUserViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFromLanguageSelection {
            return objLangaugePreferencesViewModel.numberofRows()
        } else {
            return objListViewModel.numberofRows()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return objListViewModel.heightForRow()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblDisplayData.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        if isFromLanguageSelection {
            objLangaugePreferencesViewModel.setUpCellData(cell: cell, index: indexPath.row)
//            let data:String = self.objLangaugePreferencesViewModel.itemAtIndex(index: indexPath.row)
//            cell.lblTitle.text = data
        } else {
            let data:LoginUserList = self.objListViewModel.itemAtIndex(index: indexPath.row)
            cell.lblTitle.text = data.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFromLanguageSelection {
            objLangaugePreferencesViewModel.setUpSelectedLangague(index: indexPath.row)
        }
    }
}
