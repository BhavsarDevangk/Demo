//
//  ListViewModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import UIKit

class ListViewModel: NSObject {
    var viewController:UIViewController?
    var allData = [LoginUserList]()
    
    func setUpHeaderView(viewHeader:HeaderView) {
        viewHeader.btnClickedEvent = {[weak self] result in
            if result == kLeftClicked {
                self?.dismissViewController()
            } else {
                
            }
        }
        viewHeader.isRightAvailable = false
//        viewHeader.leftImage = UIImage(named: "")
        viewHeader.lblTitle.text = "List"

    }
    
    func dismissViewController() {
        viewController?.dismiss(animated: true)
    }
}

extension ListViewModel:CustomTableView {

    func numberofRows() -> Int {
        return allData.count
    }
    func heightForRow() -> CGFloat {
        return screenWidth * 0.075
    }
    func itemAtIndex<T>(index: Int) -> T {
        let data = allData[index]
        return data as! T
    }
}



