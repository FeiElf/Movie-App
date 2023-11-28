//
//  DetailViewControllerLayout.swift
//  MovieApp
//
//  Created by USM Admin on 28/11/2023.
//

import Foundation
import UIKit

extension DetailViewController {
    
    func setUpView(){
        view.addSubview(backDropImage)
        backDropImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backDropImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        backDropImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        backDropImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        view.addSubview(movieLargeTitle)
        movieLargeTitle.centerYAnchor.constraint(equalTo: self.backDropImage.centerYAnchor, constant: 0).isActive = true
        movieLargeTitle.leftAnchor.constraint(equalTo: self.backDropImage.leftAnchor, constant: 20).isActive = true
        movieLargeTitle.rightAnchor.constraint(equalTo: self.backDropImage.rightAnchor, constant: 0).isActive = true
        movieLargeTitle.heightAnchor.constraint(equalToConstant: 100).isActive = true

        view.addSubview(moviePosterImage)
        moviePosterImage.topAnchor.constraint(equalTo: backDropImage.bottomAnchor, constant: -35).isActive = true
        moviePosterImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        moviePosterImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        moviePosterImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(starButton)
        starButton.bottomAnchor.constraint(equalTo: moviePosterImage.topAnchor, constant: 10).isActive = true
        starButton.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: -10).isActive = true
        starButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        starButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
      
        view.addSubview(movieTitle)
        movieTitle.topAnchor.constraint(equalTo: backDropImage.bottomAnchor, constant: 10).isActive = true
        movieTitle.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 10).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        movieTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(movieYear)
        movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 5).isActive = true
        movieYear.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 10).isActive = true
        movieYear.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        movieYear.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(tagsView)
        tagsView.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 5).isActive = true
        tagsView.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 10).isActive = true
        tagsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        tagsView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(movieVote)
        movieVote.topAnchor.constraint(equalTo: tagsView.bottomAnchor, constant: 0).isActive = true
        movieVote.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 10).isActive = true
        movieVote.widthAnchor.constraint(equalToConstant: 40).isActive = true
        movieVote.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(scoreText)
        scoreText.centerYAnchor.constraint(equalTo: movieVote.centerYAnchor, constant: 0).isActive = true
        scoreText.leftAnchor.constraint(equalTo: movieVote.rightAnchor, constant: 10).isActive = true
        scoreText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        scoreText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(scoreSlider)
        scoreSlider.topAnchor.constraint(equalTo: movieVote.bottomAnchor, constant: 0).isActive = true
        scoreSlider.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 10).isActive = true
        scoreSlider.widthAnchor.constraint(equalToConstant: 150).isActive = true
        scoreSlider.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        view.addSubview(rateButtonYellow)
        rateButtonYellow.topAnchor.constraint(equalTo: moviePosterImage.bottomAnchor, constant: 20).isActive = true
        rateButtonYellow.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        rateButtonYellow.widthAnchor.constraint(equalToConstant: 150).isActive = true
        rateButtonYellow.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(rateButtonBlack)
        rateButtonBlack.topAnchor.constraint(equalTo: rateButtonYellow.bottomAnchor, constant: 0).isActive = true
        rateButtonBlack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        rateButtonBlack.widthAnchor.constraint(equalToConstant: 150).isActive = true
        rateButtonBlack.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(viewFavsButton)
        viewFavsButton.topAnchor.constraint(equalTo: moviePosterImage.bottomAnchor, constant: 20).isActive = true
        viewFavsButton.leftAnchor.constraint(equalTo: rateButtonYellow.rightAnchor, constant: 30).isActive = true
        viewFavsButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        viewFavsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(overviewTitleText)
        overviewTitleText.topAnchor.constraint(equalTo: viewFavsButton.bottomAnchor, constant: 25).isActive = true
        overviewTitleText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        overviewTitleText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        overviewTitleText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(overviewText)
        overviewText.topAnchor.constraint(equalTo: overviewTitleText.bottomAnchor, constant: 10).isActive = true
        overviewText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        overviewText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
}
