//
//  SignUpModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 03/05/22.
//

import Foundation
struct SignUpData {
    var strTitle:String
    var strDescription:String
    var isPicker:Bool
}

enum SignUpTitle {
    case name,emailid,phoneNumber,password,reEnterPassword,gender
    func setSignUpTitle() -> String {
        switch self {
        case .name:
            return "Name".localized()
        case .emailid:
            return "Email".localized()
        case .phoneNumber:
            return "PhoneNumber".localized()
        case .password:
            return "Password".localized()
        case .reEnterPassword:
            return "ReEnter Password".localized()
        case .gender:
            return "Gender".localized()
        }
    }
}
