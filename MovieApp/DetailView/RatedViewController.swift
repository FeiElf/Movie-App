//
//  RatedViewController.swift
//  MovieApp
//
//  Created by USM Admin on 28/11/2023.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class RatedViewController: UIViewController {
    
    var mainCor: MainCoordinator
    var movieDataId: Int
    var movieData: MovieViewModel? = nil
    
    init(coordinator: MainCoordinator, movieDataId: Int) {
        self.mainCor = coordinator
        self.movieDataId = movieDataId
        super.init(nibName: nil, bundle: nil)
        self.movieData = moviesDataCopy[movieDataId]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .myGreen
        setUpNavigationBar()
        setUpData()
        setUpView()
    }
    
    func setUpNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.backButtonTitle = "Back to Search"
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func setUpData() {
        if movieData == nil {
            return
        }
        if let backdrop_image = movieData!.backdrop_image {
            backDropImage.image = UIImage(data: backdrop_image)
            backDropImage.addoverlay(color: .black, alpha: 0.5)
        }
        if let poster_image = movieData!.poster_image {
            moviePosterImage.image = UIImage(data: poster_image)
            moviePosterImage.layer.cornerRadius = 30
            moviePosterImage.layer.maskedCorners = [.layerMaxXMinYCorner]
        }
        movieLargeTitle.text = movieData!.title
        goToFavButton.addTarget(self, action: #selector(onFavButtonClicked), for: .touchUpInside)
        clearRateButtonBlack.addTarget(self, action: #selector(clearMovieRate), for: .touchUpInside)
        starButton.addTarget(self, action: #selector(addMovieToFavourite), for: .touchUpInside)
        if(moviesDataCopy[movieDataId].isFavourite){
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else {
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        clearRateButtonGreen.layer.cornerRadius = 10
        clearRateButtonGreen.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        clearRateButtonBlack.layer.cornerRadius = 10
        clearRateButtonBlack.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.white]
        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.white]
        let attributedString1 = NSMutableAttributedString(string:"You've rated this  ", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:"\(movieData!.score)", attributes:attrs2)
        attributedString1.append(attributedString2)
        clearRateButtonGreen.attributedText = attributedString1
    }
    
    func setUpView() {
        view.addSubview(backDropImage)
        backDropImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backDropImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        backDropImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        backDropImage.heightAnchor.constraint(equalToConstant: 450).isActive = true
        
        view.addSubview(movieLargeTitle)
        movieLargeTitle.topAnchor.constraint(equalTo: self.backDropImage.topAnchor, constant: 100).isActive = true
        movieLargeTitle.leftAnchor.constraint(equalTo: self.backDropImage.leftAnchor, constant: 30).isActive = true
        movieLargeTitle.rightAnchor.constraint(equalTo: self.backDropImage.rightAnchor, constant: 0).isActive = true
        movieLargeTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(rateText)
        rateText.topAnchor.constraint(equalTo: movieLargeTitle.bottomAnchor, constant: 0).isActive = true
        rateText.leftAnchor.constraint(equalTo: self.backDropImage.leftAnchor, constant: 30).isActive = true
        rateText.rightAnchor.constraint(equalTo: self.backDropImage.rightAnchor, constant: 0).isActive = true
        rateText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(moviePosterImage)
        moviePosterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:0).isActive = true
        moviePosterImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        moviePosterImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        moviePosterImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(starButton)
        starButton.bottomAnchor.constraint(equalTo: moviePosterImage.topAnchor, constant: 10).isActive = true
        starButton.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: -10).isActive = true
        starButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        starButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(clearRateButtonGreen)
        clearRateButtonGreen.topAnchor.constraint(equalTo: moviePosterImage.bottomAnchor, constant: 20).isActive = true
        clearRateButtonGreen.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:0).isActive = true
        clearRateButtonGreen.widthAnchor.constraint(equalToConstant: 150).isActive = true
        clearRateButtonGreen.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(clearRateButtonBlack)
        clearRateButtonBlack.topAnchor.constraint(equalTo: clearRateButtonGreen.bottomAnchor, constant: 0).isActive = true
        clearRateButtonBlack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:0).isActive = true
        clearRateButtonBlack.widthAnchor.constraint(equalToConstant: 150).isActive = true
        clearRateButtonBlack.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        view.addSubview(goToFavButton)
        goToFavButton.topAnchor.constraint(equalTo: clearRateButtonBlack.bottomAnchor, constant: 20).isActive = true
        goToFavButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        goToFavButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        goToFavButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func onFavButtonClicked() {
        debugPrint("fav clicked")
        self.mainCor.goToFavoritePage()
    }
    
    @objc func clearMovieRate() {
        debugPrint("clear clicked")
        moviesDataCopy[movieDataId].score = 0
        mainCor.navigateBack()
    }
    
    @objc func addMovieToFavourite() {
        debugPrint("add movie to favourite")
        if(moviesDataCopy[movieDataId].isFavourite){
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            moviesDataCopy[movieDataId].isFavourite = false
        }else {
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            moviesDataCopy[movieDataId].isFavourite = true
        }
    }
    
    let movieLargeTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.heavy)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.textColor = .white
        title.layer.zPosition = 2
        return title
    }()
    
    let rateText: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.textColor = .white
        title.text = "You rated this"
        title.layer.zPosition = 2
        return title
    }()
    
    let moviePosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        let image = UIImage(systemName: "photo.artframe")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 2
        imageView.tintColor = UIColor.myBlue
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    let backDropImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        let image = UIImage(systemName: "photo.artframe")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition = 1
        imageView.tintColor = UIColor.myBlue
        return imageView
    }()
    
    lazy var starButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        button.layer.zPosition = 2
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var clearRateButtonGreen: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .myDarkGreen
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.white]
        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.white]
        let attributedString1 = NSMutableAttributedString(string:"You've rated this  ", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:"0", attributes:attrs2)
        attributedString1.append(attributedString2)
        label.attributedText = attributedString1
        label.textAlignment = .center
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.zPosition = 2
        return label
    }()
    
    lazy var clearRateButtonBlack: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitleColor(.green, for: .normal)
        button.setTitle("click to reset", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.layer.masksToBounds = true
        button.layer.zPosition = 2
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        return button
    }()
    
    lazy var goToFavButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.zPosition = 2
        button.layer.cornerRadius = 30
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20)
        button.setTitle("Go to favourites", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        return button
    }()
    
    
}
