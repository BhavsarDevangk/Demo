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
    
    
    func fetchAlluserData() {
        guard let selfViewController = viewController else {
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            APIRequestCall().getRequest(strEndPoint: getAllUser) { (lu:[LoginUserList]) in
                self.allData = lu
                print("All Data = \(self.allData[0].emailId ?? "")")
            } error: { message in
                Alert().setUpCustomAlertWithActionButton(message: message, isCancel: false, cancel: { isFailed in
                }, ok: { isSuccess in
                }, viewController: selfViewController)
            }
        }
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
