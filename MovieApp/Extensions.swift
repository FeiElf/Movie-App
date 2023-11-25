//
//  Extensions.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import Foundation
import UIKit
import Combine

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
extension UIColor {
    static let myRed = UIColor(r: 212, g: 1, b: 25)               // #d40119
    static let myGray1 = UIColor(r: 114, g: 114, b: 114)          // #727272
    static let myBorder = UIColor(r: 224, g: 224, b: 224)         // #e0e0e0
    static let myGrayText1 = UIColor(r: 185, g: 188, b: 185)      // #b9bcb9
    static let myBlue = UIColor(r: 0, g: 72, b: 183)              // #0048b7
    static let myGrayText2 = UIColor(r: 118, g: 118, b: 118)      // #767676
    static let myBackgroundColor = UIColor(r: 250, g: 250, b: 250)// #fafafa
}


class Alert {
    class func show(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}

enum AsyncError: Error {
    case message(String)
}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}

struct Constraints {
    static let popularMovieURL = URL(string: "https://api.themoviedb.org/3/movie/popular")!


}
