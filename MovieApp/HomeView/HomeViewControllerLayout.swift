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
        tableView.register(MovieListCell.self, forCellReuseIdentifier: MovieListCellID)
    }
    
    func setUpView(){
        view.backgroundColor = UIColor.myGreen
        view.addSubview(SearchWhiteBackground)
        SearchWhiteBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        SearchWhiteBackground.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        SearchWhiteBackground.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        SearchWhiteBackground.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(searchImage)
        self.searchImage.centerYAnchor.constraint(equalTo: self.SearchWhiteBackground.centerYAnchor, constant: 0).isActive = true
        self.searchImage.leftAnchor.constraint(equalTo: self.SearchWhiteBackground.leftAnchor, constant: 20).isActive = true
        self.searchImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        self.searchImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(xForsearchImage)
        xForsearchImage.centerYAnchor.constraint(equalTo: SearchWhiteBackground.centerYAnchor, constant: 0).isActive = true
        xForsearchImage.rightAnchor.constraint(equalTo: SearchWhiteBackground.rightAnchor, constant: -10).isActive = true
        xForsearchImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        xForsearchImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(generalTextField)
        generalTextField.centerYAnchor.constraint(equalTo: self.SearchWhiteBackground.centerYAnchor, constant: 3).isActive = true
        generalTextField.leftAnchor.constraint(equalTo: self.searchImage.rightAnchor, constant: 20).isActive = true
        generalTextField.rightAnchor.constraint(equalTo: self.xForsearchImage.leftAnchor, constant: -10).isActive = true
        generalTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(titleText)
//        titleText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 3).isActive = true
        titleText.topAnchor.constraint(equalTo: SearchWhiteBackground.bottomAnchor, constant: 0).isActive = true
        titleText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        titleText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        titleText.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
