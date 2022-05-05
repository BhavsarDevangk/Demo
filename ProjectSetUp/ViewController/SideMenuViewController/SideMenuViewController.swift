//
//  SideMenuViewController.swift
//  ProjectSetUp
//
//  Created by PSSPL on 04/05/22.
//

import UIKit

class SideMenuViewController: UIViewController {
    @IBOutlet weak var viewForLogo: UIView!
    @IBOutlet weak var tblSideMenu: UITableView!
    var objSideMenuViewModel = SideMenuViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    func configureData() {
        self.tblSideMenu.delegate = self
        self.tblSideMenu.dataSource = self
        self.tblSideMenu.tableFooterView = UIView()
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
extension SideMenuViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objSideMenuViewModel.numberofRows()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return objSideMenuViewModel.heightForRow()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblSideMenu.dequeueReusableCell(withIdentifier: "LabelTableViewCell") as! LabelTableViewCell
        cell.lblTitle.text = objSideMenuViewModel.itemAtIndex(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        objSideMenuViewModel.setupFrontViewController(index: indexPath.row)
    }
    
}
