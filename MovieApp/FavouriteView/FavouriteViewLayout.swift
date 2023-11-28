//
//  FavouriteViewLayout.swift
//  MovieApp
//
//  Created by USM Admin on 28/11/2023.
//

import Foundation
import UIKit

extension FavouriteViewController {
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setUpView(){
        view.addSubview(topBarBackground)
        topBarBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topBarBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        topBarBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        topBarBackground.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(favouriteTitle)
        favouriteTitle.topAnchor.constraint(equalTo: topBarBackground.bottomAnchor, constant: 30).isActive = true
        favouriteTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        favouriteTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        favouriteTitle.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        if favouriteMovies.isEmpty {
            view.addSubview(faceImage)
            faceImage.topAnchor.constraint(equalTo: favouriteTitle.bottomAnchor, constant: 70).isActive = true
            faceImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
            faceImage.heightAnchor.constraint(equalToConstant: 220).isActive = true
            faceImage.widthAnchor.constraint(equalToConstant: 220).isActive = true
            
            view.addSubview(noFavouritesLabel)
            noFavouritesLabel.topAnchor.constraint(equalTo: faceImage.bottomAnchor, constant: 0).isActive = true
            noFavouritesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
            noFavouritesLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
            noFavouritesLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            view.addSubview(label)
            label.topAnchor.constraint(equalTo: noFavouritesLabel.bottomAnchor, constant: 20).isActive = true
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
            label.heightAnchor.constraint(equalToConstant: 80).isActive = true
                    
        }else {
            view.addSubview(collectionView)
            collectionView.topAnchor.constraint(equalTo: favouriteTitle.bottomAnchor, constant: 40).isActive = true
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
            collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }

        view.addSubview(searchForFavButton)
        searchForFavButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        searchForFavButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        searchForFavButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        searchForFavButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
}
