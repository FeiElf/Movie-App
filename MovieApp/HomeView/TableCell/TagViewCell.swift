//
//  TagView.swift
//  MovieApp
//
//  Created by USM Admin on 27/11/2023.
//

import Foundation
import UIKit

class TagCell: UIView {
    
    public var text: String = "" {
        didSet {
            theLabel.text = text
        }
    }
    
    public var normalForegroundColor: UIColor = UIColor.myGrayText1
    public var normalBackgroundColor: UIColor = UIColor.mylightGray1
    
    private let theLabel: UILabel = {
        let v = UILabel()
        v.textAlignment = .center
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func commonInit() -> Void {
        backgroundColor = normalBackgroundColor
        theLabel.textColor = normalForegroundColor
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        theLabel.font = UIFont(name: "Arial", size: 15)
        addSubview(theLabel)
        let g = self
        NSLayoutConstraint.activate([
            theLabel.topAnchor.constraint(equalTo: g.topAnchor, constant: 2),
            theLabel.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 8),
            theLabel.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -8),
            theLabel.bottomAnchor.constraint(equalTo: g.bottomAnchor, constant: -2),
        ])
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

}
