//
//  ListUserViewController.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import UIKit

class ListUserViewController: UIViewController {

    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var tblDisplayData: UITableView!
    var objListViewModel = ListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    func configureData() {
        tblDisplayData.delegate = self
        tblDisplayData.dataSource = self
        tblDisplayData.tableFooterView = UIView()
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
