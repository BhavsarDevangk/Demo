//
//  LoginModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import Foundation

struct LoginUserList : Decodable {
    let id : Int?
    let name : String?
    let address : String?
    let emailId : String?
    let password : String?
    let profileImage : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address = "address"
        case emailId = "emailId"
        case password = "password"
        case profileImage = "profileImage"
    }
}
