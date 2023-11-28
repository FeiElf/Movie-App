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
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a/1)
    }
}
extension UIColor {
    static let mylightGray1 = UIColor(r: 217, g: 222, b: 217, a: 1)          // #d9ded9
    static let myGrayText1 = UIColor(r: 185, g: 188, b: 185, a: 1)      // #b9bcb9
    static let myGreen = UIColor(r: 52, g: 235, b: 155, a: 1)              // #0048b7
    static let myDarkGreen = UIColor(r: 30, g: 82, b: 51, a: 1)          //#1e5233
    static let myBlue = UIColor(r: 0, g: 72, b: 183, a: 1)
    static let myBackgroundColor = UIColor(r: 250, g: 250, b: 250, a: 1)// #fafafa
    static let myTransWhite = UIColor(r: 250, g: 250, b: 250, a: 0.5)
    static let myTransBlack = UIColor(r: 0, g: 0, b: 0, a: 0.3)
    static let myLightYellow = UIColor(r: 240, g: 222, b: 165, a: 1)
    static let myDarkYellow = UIColor(r: 173, g: 138, b: 23, a: 1)
    static let myPink = UIColor(r: 242, g: 136, b: 148, a: 1)    //#f28894
}

extension UIView {
    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
    //This function will add a layer on any `UIView` to make that `UIView` look darkened
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
     }
    
    
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
