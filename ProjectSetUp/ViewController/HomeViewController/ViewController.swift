//
//  ViewController.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    var objLoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = BackgroundColor().setUpBackGroundColor(theamColor: 0)
        self.objLoginViewModel.viewController = self
        objLoginViewModel.fetchAlluserData()
    }

    
    @IBAction func btnSubmitClicked(_ sender: Any) {
        if let email = txtEmailId.text {
            objLoginViewModel.strEmailId = email
        }
        if let password = txtPassword.text {
            objLoginViewModel.strPassword = password
        }
       let isSuccess = objLoginViewModel.setUpValidation()
        if isSuccess {
            let objData:ListUserViewController = UIStoryboard(name: MainStoryoard, bundle: nil).instantiateViewController(withIdentifier: "ListUserViewController") as! ListUserViewController
            objData.modalPresentationStyle = .overFullScreen
            objData.objListViewModel.allData = objLoginViewModel.allData
            self.present(objData, animated: true, completion: nil)
            
        }
    }
}

