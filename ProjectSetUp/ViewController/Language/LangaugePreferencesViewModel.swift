//
//  LangaugePreferencesViewModel.swift
//  ProjectSetUp
//
//  Created by PSSPL on 02/05/22.
//

import UIKit
import Localize_Swift
class LangaugePreferencesViewModel: NSObject {
    var arrAllLangaues = [String]()
    var viewController:UIViewController?
    func setUpAllData() {
        let availableLanguages = Bundle.main.localizations
        arrAllLangaues = availableLanguages//Locale.preferredLanguages
        let indexOfBase = arrAllLangaues.firstIndex(of: "Base")
        arrAllLangaues.remove(at: indexOfBase!)
    }
    func setUpSelectedLangague(index:Int) {
        let selectedLanguage = arrAllLangaues[index]
        UserDefaults.standard.set(selectedLanguage, forKey: kLCLCurrentLanguageKey)
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: Notification.Name(rawValue: kLCLLanguageChangeNotification), object: nil)
        viewController?.dismiss(animated: true)
    }
    
    func setUpCellData(cell:ListTableViewCell , index:Int) {
        let value:String = self.itemAtIndex(index: index)
        let country = NSLocale(localeIdentifier: value).displayName(forKey: .identifier, value: value)
        var strCountryName:String = value
        guard let countryName = country else {
            return
        }
        strCountryName = countryName
        cell.lblTitle.text = "\(strCountryName)"
    }
    
    
}
extension LangaugePreferencesViewModel:CustomTableView {
   
    func numberofRows() -> Int {
        return arrAllLangaues.count
    }
    func heightForRow() -> CGFloat {
        return screenWidth * 0.075
    }
    func itemAtIndex<T>(index: Int) -> T {
        let data = arrAllLangaues[index]
        return data as! T
    }
}
