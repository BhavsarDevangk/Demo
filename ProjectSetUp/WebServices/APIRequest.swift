//
//  APIRequest.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import Foundation
import Alamofire

class APIRequestCall: NSObject {
    
    func checkInterNetConnection() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    
    func getRequest<T:Decodable>(strEndPoint:String,success successData: @escaping ((T) -> Void),error errorData : @escaping ((String) -> Void)) {
        let apiURl = APIURl + strEndPoint
        if !checkInterNetConnection() {
            errorData(AlertMessage.checkInterNetConnection.alertMessage())
        }
        Alamofire.request(apiURl, method: .get).responseJSON { response in
            switch response.result
            {
            case .success(_):
                do {
                    let jsonData = try JSONDecoder().decode(T.self, from: response.data!)
                    successData(jsonData)
                }
                catch {
                    errorData(AlertMessage.jsonIssue.alertMessage())
                }
                break
            case .failure(let error):
                errorData(error.localizedDescription)
                break
               
            }
        }
    }
    
    func postRequest<T:Decodable>(strEndPoint:String,parameters:[String:Any],success successData: @escaping ((T) -> Void),error errorData : @escaping ((String) -> Void)) {
        let apiURl = APIURl + strEndPoint
        if !checkInterNetConnection() {
            errorData(AlertMessage.checkInterNetConnection.alertMessage())
        }
        Alamofire.request(apiURl, method: .post, parameters: parameters).responseJSON { response in
            switch response.result
            {
            case .success(_):
                do {
                    let jsonData = try JSONDecoder().decode(T.self, from: response.data!)
                    successData(jsonData)
                }
                catch {
                    errorData(AlertMessage.jsonIssue.alertMessage())
                }
                break
            case .failure(let error):
                errorData(error.localizedDescription)
                break
               
            }
        }
    }
}
