//
//  Constant.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import Foundation
import UIKit
//All Data Found check new value
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let MainStoryoard = "Main"


let kProjectName = "Project Name"


let APIURl = "https://retoolapi.dev"
let getAllUser = "/1lMpyy/data"

struct Alert {
    
    func setUpCustomAlertWithActionButton(message:String,isCancel:Bool,cancel cancelAction: @escaping((Bool) -> Void), ok okAction: @escaping((Bool) -> Void),viewController:UIViewController) {
        
        let alert = UIAlertController(title: kProjectName, message: message, preferredStyle: .alert)
        if isCancel {
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { result in
                cancelAction(true)
            }
            alert.addAction(cancelAction)
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { result in
                okAction(true)
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
   
}

struct BackgroundColor {
    
    enum ColorType: String {
       case white = "FFFFFF"
       case red = "FF0000"
       case blue = "0000FF"
       case green = "00FF00"
      
    }
    
    func setUpBackGroundColor(theamColor:Int) -> UIColor {
        switch theamColor {
        case 0 :
            return ColorPicker().hexStringToUIColor(hex: ColorType.white.rawValue)
        case 1:
            return ColorPicker().hexStringToUIColor(hex: ColorType.red.rawValue)
        case 2:
            return ColorPicker().hexStringToUIColor(hex: ColorType.blue.rawValue)
        case 3:
            return ColorPicker().hexStringToUIColor(hex: ColorType.green.rawValue)
        default:
            return ColorPicker().hexStringToUIColor(hex: ColorType.green.rawValue)
        }
    }
}

enum AlertMessage {
    case checkInterNetConnection,jsonIssue,emptyEmail,invalidEmail,emptyPassword
    func alertMessage() -> String {
        switch self {
        case .checkInterNetConnection:
            return "InterNet is not avialable, please check the internet connectivity"
        case .jsonIssue:
            return "data is not in formatted contact to admin panel"
        case .emptyEmail:
            return "Please provide Email Id"
        case .emptyPassword:
            return "Please provide password"
        case .invalidEmail:
            return "Please provide valied Email Id"
        }
    }
}
