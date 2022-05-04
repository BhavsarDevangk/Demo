//
//  SocialLoginViewModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 03/05/22.
//

import UIKit
import FacebookCore
import FacebookLogin
import LocalAuthentication

class SocialLoginViewModel: NSObject {
    var viewController:UIViewController?
    var context = LAContext()
    func setUpHeaderView(viewHeader:HeaderView) {
        viewHeader.btnClickedEvent = {[weak self] result in
            if result == kLeftClicked {
                self?.dismissViewController()
            }
        }
        viewHeader.isRightAvailable = false
        viewHeader.lblTitle.text = "Social Login"
    }
    
    
    func dismissViewController() {
        viewController?.dismiss(animated: true)
    }
    
    func setupBioMatrixLogin() {
        context.localizedCancelTitle = "Enter Username/Password"

        // First check if we have the needed hardware support.
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {

            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

                if success {

                    // Move to the main thread because a state update triggers UI changes.
                    DispatchQueue.main.async { [unowned self] in
                        print("Login Success")
                        self.dismissViewController()
                    }

                } else {
                    print(error?.localizedDescription ?? "Failed to authenticate")

                    // Fall back to a asking for username and password.
                    // ...
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")

            // Fall back to a asking for username and password.
            // ...
        }
    }
    func fetchUserProfile()
    {
        let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        
        graphRequest.start { connection, result, error in
            if error != nil {
                
            } else {
                let data = result as! [String:Any]
                if let userName = data["id"]
                {
                    print("username = \(userName)")
                }
            }
        }
        //Setup code as per the key
        //           graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
        //
        //               if ((error) != nil)
        //               {
        //                   print("Error took place: \(error)")
        //               }
        //               else
        //               {
        //                   print("Print entire fetched result: \(result)")
        //
        //                   let id : NSString = result.valueForKey("id") as! String
        //                   print("User ID is: \(id)")
        //
        //                   if let userName = result.valueForKey("name") as? String
        //                   {
        //                       self.userFullName.text = userName
        //                   }
        //
        //                   if let profilePictureObj = result.valueForKey("picture") as? NSDictionary
        //                   {
        //                       let data = profilePictureObj.valueForKey("data") as! NSDictionary
        //                       let pictureUrlString  = data.valueForKey("url") as! String
        //                       let pictureUrl = NSURL(string: pictureUrlString)
        //
        //                       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        //
        //                           let imageData = NSData(contentsOfURL: pictureUrl!)
        //
        //                           dispatch_async(dispatch_get_main_queue()) {
        //                               if let imageData = imageData
        //                               {
        //                                   let userProfileImage = UIImage(data: imageData)
        //                                   self.userProfileImage.image = userProfileImage
        //                                   self.userProfileImage.contentMode = UIViewContentMode.ScaleAspectFit
        //                               }
        //                           }
        //                       }
        //                   }
        //               }
        //           })
    }
    
}
