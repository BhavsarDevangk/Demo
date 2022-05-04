//
//  ViewController.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var navigationData: UINavigationItem!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtEmailId: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnPreferLan: UIButton!
    var objLoginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = BackgroundColor().setUpBackGroundColor(theamColor: 0)
        self.objLoginViewModel.viewController = self
        objLoginViewModel.fetchAlluserData()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeLanguage), name: Notification.Name(kLCLLanguageChangeNotification), object: nil)
    }
    
    @objc func changeLanguage() {
        navigationData.title = LoginTitle.login.selecetdTitle()
        btnPreferLan.setTitle(LoginTitle.preferLangauge.selecetdTitle(), for: .normal)
        btnSubmit.setTitle(LoginTitle.submit.selecetdTitle(), for: .normal)
        txtEmailId.placeholder = LoginTitle.email.selecetdTitle()
        txtPassword.placeholder = LoginTitle.passsword.selecetdTitle()
    }
    @IBAction func btnPreferLanguageClicked(_ sender: Any) {
        objLoginViewModel.selectionLaguage()
    }
    @IBAction func btnSubmitClicked(_ sender: Any) {
        // Define the menu
        let objHomeViewController:HomeViewController = UIStoryboard(name: MainStoryoard, bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        if let email = txtEmailId.text {
//            objLoginViewModel.strEmailId = email
//        }
//        if let password = txtPassword.text {
//            objLoginViewModel.strPassword = password
//        }
//       let isSuccess = objLoginViewModel.setUpValidation()
//        if isSuccess {
//            let objData:ListUserViewController = UIStoryboard(name: MainStoryoard, bundle: nil).instantiateViewController(withIdentifier: "ListUserViewController") as! ListUserViewController
//            objData.modalPresentationStyle = .overFullScreen
//            objData.objListViewModel.allData = objLoginViewModel.allData
//            self.present(objData, animated: true, completion: nil)
//
//        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        let objSignUpViewController:SignUpViewController = UIStoryboard(name: MainStoryoard, bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        objSignUpViewController.modalPresentationStyle = .overFullScreen
        self.present(objSignUpViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        let objSocialViewController:SocialViewController = UIStoryboard(name: MainStoryoard, bundle: nil).instantiateViewController(withIdentifier: "SocialViewController") as! SocialViewController
        objSocialViewController.modalPresentationStyle = .overFullScreen
        self.present(objSocialViewController, animated: true, completion: nil)
    }
}
