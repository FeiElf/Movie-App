//
//  FavouriteViewController.swift
//  MovieApp
//
//  Created by USM Admin on 28/11/2023.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class FavouriteViewController: UIViewController {
    
    var mainCor: MainCoordinator
    var favouriteMovies: [MovieViewModel] = [] {
        didSet {
            if favouriteMovies.isEmpty {
                topBarBackground.backgroundColor = .myPink
                favouriteTitle.textColor = .myPink
                searchForFavButton.setTitle("Search for a favourite", for: .normal)
            }else {
                topBarBackground.backgroundColor = .myGreen
                favouriteTitle.textColor = .myDarkGreen
                searchForFavButton.setTitle("Search for More", for: .normal)
            }
        }
    }
    
    let cellId = "cell id"
    
    init(coordinator: MainCoordinator) {
        self.mainCor = coordinator
        super.init(nibName: nil, bundle: nil)
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
        setUpCollectionView()
    }
    
    func setUpNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.backButtonTitle = "Back"
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc
    func goToHomePage() {
        mainCor.goToHomePage()
    }
    
    func setUpData() {
        favouriteMovies = moviesDataCopy.filter({$0.isFavourite})
        searchForFavButton.addTarget(self, action: #selector(goToHomePage), for: .touchUpInside)
    }
    
    lazy var topBarBackground: UILabel = {
        let label = UILabel()
        label.backgroundColor = .myPink
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 0
        label.clipsToBounds = true
        return label
    }()
    
    let favouriteTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.heavy)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.textColor = .myPink
        title.layer.zPosition = 2
        title.text = "My favourites"
        return title
    }()
    
    let faceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        let image = UIImage(named: "sad")
        image?.withTintColor(.myPink)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition = 1
        imageView.tintColor = UIColor.myPink
        return imageView
    }()
    
    let noFavouritesLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 21, weight: UIFont.Weight.heavy)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.textColor = .black
        title.layer.zPosition = 2
        title.text = "You have no favourites"
        return title
    }()
    
    let label: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.textColor = .mylightGray1
        title.layer.zPosition = 2
        title.text = "Tap the star to favourite a movie"
        let fullString = NSMutableAttributedString(string: "Tap the star to favourite a movie\n")
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(systemName: "star")
        image1Attachment.image = image1Attachment.image?.withTintColor(UIColor(.yellow))
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        title.attributedText = fullString
        title.numberOfLines = 0
        title.layer.borderWidth = 1
        title.layer.borderColor = UIColor.myGrayText1.cgColor
        title.layer.cornerRadius = 10
        return title
    }()
    
    lazy var searchForFavButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.zPosition = 2
        button.layer.cornerRadius = 25
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20)
        button.setTitle("Search for a favourite", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.backgroundColor = .myGrayText1
        button.setTitleColor(.black, for: .normal)
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        return button
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layer.zPosition = 2
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
}
