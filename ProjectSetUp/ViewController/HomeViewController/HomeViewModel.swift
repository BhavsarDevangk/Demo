//
//  HomeViewModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 04/05/22.
//

import UIKit

class HomeViewModel: NSObject {
    var viewController:UIViewController?
    func setUpHeaderView(viewHeader:HeaderView) {
        viewHeader.btnClickedEvent = {[weak self] result in
            if result == kLeftClicked {
                self?.setUpSideMenuClicked()
            }
        }
        viewHeader.isRightAvailable = false
        viewHeader.lblTitle.text = "Sign Up"
    }
    func setUpSideMenuClicked() {
        
    }
}
