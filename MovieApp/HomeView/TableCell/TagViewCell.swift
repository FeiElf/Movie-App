//
//  TagView.swift
//  MovieApp
//
//  Created by USM Admin on 27/11/2023.
//

import Foundation
import UIKit

class MyTagView: UIView {
    
    public var text: String = "" {
        didSet {
            theLabel.text = text
        }
    }
    
    public var normalForegroundColor: UIColor = .darkGray
    public var normalBackgroundColor: UIColor = .lightGray
    
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
        addSubview(theLabel)
        let g = self
        NSLayoutConstraint.activate([
            theLabel.topAnchor.constraint(equalTo: g.topAnchor, constant: 4.0),
            theLabel.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 8.0),
            theLabel.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -8.0),
            theLabel.bottomAnchor.constraint(equalTo: g.bottomAnchor, constant: -4.0),
            theLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 40.0),
        ])
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = normalForegroundColor.cgColor
        
    }

}
