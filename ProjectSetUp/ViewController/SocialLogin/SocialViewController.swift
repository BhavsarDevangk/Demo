//
//  SocialViewController.swift
//  ProjectSetUp
//
//  Created by PSSPL on 03/05/22.
//

import UIKit

class SocialViewController: UIViewController {
 var objSocialViewModel = SocialLoginViewModel()
    @IBOutlet weak var viewHeader: HeaderView!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        objSocialViewModel.viewController = self
        objSocialViewModel.setUpHeaderView(viewHeader: viewHeader)
    }
    
    @IBAction func btnFacebookloginClicked(_ sender: Any) {
        objSocialViewModel.fetchUserProfile()
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
