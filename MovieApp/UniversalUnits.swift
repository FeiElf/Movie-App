//
//  UniversalUnits.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import Foundation
import UIKit

class tableCustom: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setUpTable()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpTable()
    }
    func setUpTable() {
        layer.zPosition = 1
        backgroundColor = UIColor.myBackgroundColor
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = UITableViewCell.SeparatorStyle.none
        showsVerticalScrollIndicator = false
        }
}
