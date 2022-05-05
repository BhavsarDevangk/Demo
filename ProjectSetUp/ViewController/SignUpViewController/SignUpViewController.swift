//
//  SignUpViewController.swift
//  ProjectSetUp
//
//  Created by PSSPL on 03/05/22.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var viewHeader: HeaderView!
    @IBOutlet weak var tblUserData: UITableView!
    var objSignUpViewModel = SignUpViewModel()
    @IBOutlet weak var btnSubmit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureData()
    }
    func configureData() {
        objSignUpViewModel.viewController = self
        objSignUpViewModel.tableView = tblUserData
        objSignUpViewModel.setUpHeaderView(viewHeader: viewHeader)
        objSignUpViewModel.setUpValue()
        tblUserData.delegate = self
        tblUserData.dataSource = self
    }
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
       let isvalied = objSignUpViewModel.setUpValidation()
        if isvalied {
            self.dismiss(animated: true)
        }
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
extension SignUpViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return objSignUpViewModel.arrAllData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return objSignUpViewModel.heightForRow()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.row == 0 {
            let cell = tblUserData.dequeueReusableCell(withIdentifier: "LabelTableViewCell") as! LabelTableViewCell
            objSignUpViewModel.setUpTitlelabelCell(cell: cell, index: indexPath.section)
            return cell
        } else {
            let cell = tblUserData.dequeueReusableCell(withIdentifier: "TextFieldTableViewCell") as! TextFieldTableViewCell
            objSignUpViewModel.setUpTextFieldCell(cell: cell, index: indexPath.section)
            return cell
        }
        
    }
}
