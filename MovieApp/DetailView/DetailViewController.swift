//
//  DetailViewController.swift
//  MovieApp
//
//  Created by USM Admin on 28/11/2023.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class DetailViewController: UIViewController {
    
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
        view.backgroundColor = .white
        setUpNavigationBar()
        setUpData()
        setUpView()
    }
    
    func setUpData() {
        if movieData == nil {
            return
        }
        if let backdrop_image = movieData!.backdrop_image {
            backDropImage.image = UIImage(data: backdrop_image)
            backDropImage.addoverlay(color: .black, alpha: 0.5)
        }
        movieLargeTitle.text = movieData!.title
        movieTitle.text = movieData!.title
        if let poster_image = movieData!.poster_image {
            moviePosterImage.image = UIImage(data: poster_image)
            moviePosterImage.layer.cornerRadius = 30
            moviePosterImage.layer.maskedCorners = [.layerMaxXMinYCorner]
        }
        movieYear.text = movieData!.release_year
        var a: [UILabel] = []
        movieData!.genres?.forEach{ genre in
            let tv = UILabel()
            tv.text = genre
            tv.textAlignment = .left
            tv.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
            tv.textColor = UIColor.myGrayText1
            tv.clipsToBounds = true
            tv.layer.zPosition = 2
            a.append(tv)
        }
        tagsView.addArrangedViews(a)
        movieVote.text = "\(movieData!.vote_average)%"
        scoreSlider.progress = Float(movieData!.vote_average)/100
        overviewText.text = movieData!.overview
        viewFavsButton.addTarget(self, action: #selector(onFavButtonClicked), for: .touchUpInside)
        rateButtonYellow.addTarget(self, action: #selector(rateThisMovie), for: .touchUpInside)
        rateButtonBlack.addTarget(self, action: #selector(rateThisMovie), for: .touchUpInside)
        starButton.addTarget(self, action: #selector(addMovieToFavourite), for: .touchUpInside)
        
        rateButtonYellow.layer.cornerRadius = 10
        rateButtonYellow.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        rateButtonBlack.layer.cornerRadius = 10
        rateButtonBlack.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func setUpNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.backButtonTitle = "Back to Search"
        self.navigationController?.navigationBar.tintColor = .white
    }
    
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
    
    let movieLargeTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.heavy)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.textColor = .white
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
    
    let movieTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.heavy)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    let movieYear: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        label.textColor = UIColor.myGrayText1
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    let tagsView: HorizontalScrollView = {
        let tv = HorizontalScrollView(frame: .zero)
        tv.backgroundColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isUserInteractionEnabled = true
        tv.interItemSpacing = 10
        tv.showsHorizontalScrollIndicator = false
        tv.layer.zPosition = 2
        return tv
    }()
    
    let movieVote: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    let scoreText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        label.text = " user score"
        return label
    }()
    
    let scoreSlider: UIProgressView = {
        var slider = UIProgressView()
        slider.progress = 0.0
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.progressTintColor = .green
        return slider
    }()
    
    @objc func rateThisMovie(sender: UIButton!) {
        debugPrint("rate this movie")
    }
    
    lazy var rateButtonYellow: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .myDarkYellow
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Rate it myself >", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.masksToBounds = true
        button.layer.zPosition = 2
        return button
    }()
    
    lazy var rateButtonBlack: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitleColor(.myDarkYellow, for: .normal)
        button.setTitle("add personal rating", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.layer.masksToBounds = true
        button.layer.zPosition = 2
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        return button
    }()
    
    @objc func onFavButtonClicked() {
        debugPrint("fav clicked")
        self.mainCor.goToFavoritePage()
    }
    
    lazy var viewFavsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.zPosition = 2
        button.layer.cornerRadius = 30
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20)
        button.setTitle("View Favs", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .myLightYellow
        button.setTitleColor(.myDarkYellow, for: .normal)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        return button
    }()
    
    let overviewTitleText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        label.text = "Overview"
        return label
    }()
    
    let overviewText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        label.text = "movie overview"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
}

struct PreviewDViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            DetailViewController(coordinator: MainCoordinator(), movieDataId: 0)
        }
    }
}
