//
//  SignUpViewModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 03/05/22.
//

import UIKit
import IQKeyboardManagerSwift

class SignUpViewModel: NSObject {
    var viewController:UIViewController?
    var arrAllData = [SignUpData]()
    var objpickerController = PickerController()
    var tableView:UITableView?
    
    func setUpHeaderView(viewHeader:HeaderView) {
        viewHeader.btnClickedEvent = {[weak self] result in
            if result == kLeftClicked {
                self?.dismissViewController()
            }
        }
        viewHeader.isRightAvailable = false
        viewHeader.lblTitle.text = "Sign Up"
    }
    
    func dismissViewController() {
        viewController?.dismiss(animated: true)
    }
    
    func setUpValue() {
        self.objpickerController.viewController = viewController!
        arrAllData.removeAll()
        arrAllData.append(SignUpData(strTitle: SignUpTitle.name.setSignUpTitle(), strDescription: "", isPicker: false))
        arrAllData.append(SignUpData(strTitle: SignUpTitle.emailid.setSignUpTitle(), strDescription: "", isPicker: false))
        arrAllData.append(SignUpData(strTitle: SignUpTitle.phoneNumber.setSignUpTitle(), strDescription: "", isPicker: false))
        arrAllData.append(SignUpData(strTitle: SignUpTitle.password.setSignUpTitle(), strDescription: "", isPicker: false))
        arrAllData.append(SignUpData(strTitle: SignUpTitle.reEnterPassword.setSignUpTitle(), strDescription: "", isPicker: false))
        arrAllData.append(SignUpData(strTitle: SignUpTitle.gender.setSignUpTitle(), strDescription: "", isPicker: true))
    }
    
    func setUpTitlelabelCell(cell:LabelTableViewCell, index:Int) {
        cell.lblTitle.tag = index
        let data:SignUpData = self.itemAtIndex(index: index)
        cell.lblTitle.text = data.strTitle
    }
    
    func setUpTextFieldCell(cell:TextFieldTableViewCell, index:Int) {
        let data:SignUpData = self.itemAtIndex(index: index)
        cell.txtDescription.text = data.strDescription
        if data.strTitle.contains(SignUpTitle.password.setSignUpTitle()) {
            cell.txtDescription.isSecureTextEntry = true
        } else {
            cell.txtDescription.isSecureTextEntry = false
        }
        if data.strTitle.contains(SignUpTitle.phoneNumber.setSignUpTitle()) {
            cell.txtDescription.keyboardType = .numberPad
        } else {
            cell.txtDescription.keyboardType = .default
        }
        cell.txtDescription.tag = index
        cell.textValue = {[weak self] (result,index) in
            self!.arrAllData[index].strDescription = result
        }
        cell.txtBegin = {[weak self] (result,index) in
            //textfied begin editing
            let data:SignUpData = self!.itemAtIndex(index: index)
            if data.strTitle.contains(SignUpTitle.gender.setSignUpTitle()) {
                IQKeyboardManager.shared.resignFirstResponder()
                self?.setUpPickerView(index: index)
            }
        }
        cell.eventSelected = {[weak self] (result,index) in
            //let _:SignUpData = self!.itemAtIndex(index: index)
            self?.setUpPickerView(index: index)
        }
    }
    
    func setUpPickerView(index:Int) {
        let data:SignUpData = itemAtIndex(index: index)
        if data.strTitle.lowercased().contains("date") {
            self.objpickerController.selectedDate = {[weak self] value in
               // self.arrAllData[index].strDescription = value
            }
            self.objpickerController.setUpDatePicker()
        } else {
            self.objpickerController.selectedValue = {[weak self] value in
                self!.arrAllData[index].strDescription = value
                self?.tableView?.reloadData()
            }
            self.objpickerController.setUpTextPicker(data: ["Male","Female","BiGender"])
        }
    }
    
    func setUpValidation() -> Bool{
        for value in arrAllData {
            if value.strDescription.isEmpty {
                Alert().setUpCustomAlertWithActionButton(message: "please enter".localized() + " " + value.strTitle.localized(), isCancel: false, cancel: { isFailed in
                }, ok: { isSuccess in
                }, viewController: viewController!)
                return false
            }
        }
        return true
    }
}

extension SignUpViewModel:CustomTableView {
    func numberofRows() -> Int {
        return arrAllData.count
    }
    func heightForRow() -> CGFloat {
        return screenWidth * 0.1
    }
    func itemAtIndex<T>(index: Int) -> T {
        return arrAllData[index] as! T
    }
}
