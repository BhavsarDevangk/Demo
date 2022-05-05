//
//  LoginViewModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import UIKit

class LoginViewModel: NSObject {
   
    var viewController:UIViewController?
    var strEmailId:String = ""
    var strPassword:String = ""
    var allData = [LoginUserList]()
    
    static func instantiateViewController(_ bundle: Bundle?) -> ViewController {
        let vc = ViewController()
        return vc
    }
    
    func fetchAlluserData() {
        guard let selfViewController = viewController else {
            return
        }
        MBProgressHubDisplay.objShared.setupProgressHUB(view: selfViewController.view)
        DispatchQueue.global(qos: .userInitiated).async {
            APIRequestCall().getRequest(strEndPoint: getAllUser) { (lu:[LoginUserList]) in
                self.allData = lu
                MBProgressHubDisplay.objShared.dismissProgressHUB(view: selfViewController.view)
            } error: { message in
                MBProgressHubDisplay.objShared.dismissProgressHUB(view: selfViewController.view)
                Alert().setUpCustomAlertWithActionButton(message: message, isCancel: false, cancel: { isFailed in
                }, ok: { isSuccess in
                }, viewController: selfViewController)
            }
        }
    }
    
    func selectionLaguage() {
        let objData:ListUserViewController = UIStoryboard(name: MainStoryoard, bundle: nil).instantiateViewController(withIdentifier: "ListUserViewController") as! ListUserViewController
        objData.modalPresentationStyle = .overFullScreen
        objData.isFromLanguageSelection = true
        viewController!.present(objData, animated: true, completion: nil)
    }
    
    func setUpValidation() -> Bool {
        guard let selfViewController = viewController else {
            return false
        }
        var strMessage:String = ""
        if self.strEmailId.count <= 0  {
            strMessage = AlertMessage.emptyEmail.alertMessage()
        } else  if self.strPassword.count <= 0 {
            strMessage = AlertMessage.emptyPassword.alertMessage()
        } else if  !self.strEmailId.isValidEmail {
            strMessage = AlertMessage.invalidEmail.alertMessage()
        }
        if strMessage.count > 0 {
            Alert().setUpCustomAlertWithActionButton(message: strMessage, isCancel: false, cancel: { result in
            }, ok: { result in
            }, viewController: selfViewController)
            return false
        } else {
            return true
        }
    }
    
    
}
