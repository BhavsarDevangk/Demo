//
//  Extension.swift
//  ProjectSetUp
//
//  Created by PSSPL on 29/04/22.
//

import UIKit

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
extension Locale {
    static var preferredLanguageCode: String {
        let defaultLanguage = "en"
        let preferredLanguage = preferredLanguages.first ?? defaultLanguage
        return Locale(identifier: preferredLanguage).languageCode ?? defaultLanguage
    }

    static var preferredLanguageCodes: [String] {
        return Locale.preferredLanguages.compactMap({Locale(identifier: $0).languageCode})
    }
}
extension UIImageView {
    func downloaded(from url:URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
               let httpURLResponse = response as?HTTPURLResponse, httpURLResponse.statusCode == 200,
               let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
               let data = data, error == nil,
              let image = UIImage(data: data)
              else {return}
            DispatchQueue.main.async() {[weak self] in
                self?.image = image
                self?.contentMode = mode
            }
        }.resume()
    }
    func downloaded(from link: String,contentModel mode: ContentMode = .scaleAspectFill)  {
        guard let url = URL(string: link) else {return}
        downloaded(from: url, contentMode: contentMode)
    }
}
