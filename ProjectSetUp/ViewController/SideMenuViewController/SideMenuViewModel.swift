//
//  SideMenuViewModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 04/05/22.
//

import UIKit

class SideMenuViewModel: NSObject {
    var arrAllData = [String]()
    
    func setupFrontViewController(index:Int){
        //
    }
}
extension SideMenuViewModel:CustomTableView {
    func numberofRows() -> Int {
        return arrAllData.count
    }
    
    func itemAtIndex<T>(index: Int) -> T {
        return arrAllData[index] as! T
    }
    
    func heightForRow() -> CGFloat {
        return screenWidth * 0.07
    }
    
}
