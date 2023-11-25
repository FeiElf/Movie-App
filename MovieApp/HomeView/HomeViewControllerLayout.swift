//
//  HomeViewControllerLayout.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import Foundation
import UIKit

extension HomeViewController {
    func setUpTableViewDetails() {
        tableView.delegate      =   self
        tableView.dataSource    =   self
//        tableView.register(FlightsListCell.self, forCellReuseIdentifier: FlightListCellID)
//        tableView.register(FlightListLargeCell.self, forCellReuseIdentifier: FlightListLargeCellID)
    }
    
    func setUpView(){
        view.addSubview(SearchWhiteBackground)
        self.SearchWhiteBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        self.SearchWhiteBackground.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.SearchWhiteBackground.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        self.SearchWhiteBackground.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(xForsearchImage)
        xForsearchImage.centerYAnchor.constraint(equalTo: SearchWhiteBackground.centerYAnchor, constant: 0).isActive = true
        xForsearchImage.rightAnchor.constraint(equalTo: SearchWhiteBackground.rightAnchor, constant: -10).isActive = true
        xForsearchImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        xForsearchImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
}
