//
//  CollectionCell.swift
//  MovieApp
//
//  Created by USM Admin on 29/11/2023.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    
    var data: MovieViewModel! {
        didSet {
            if let posterImage = data.poster_image {
                moviePosterImage.image = UIImage(data: posterImage)
                moviePosterImage.layer.cornerRadius = 30
                moviePosterImage.layer.maskedCorners = [.layerMaxXMinYCorner]
            }
            if(data.isFavourite){
                starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            }else {
                starButton.setImage(UIImage(systemName: "star"), for: .normal)
            }
            rateScore.text = String(data.score)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.contentView.isUserInteractionEnabled = true
        backgroundColor = .blue
        addSubview(moviePosterImage)
        addSubview(starButton)
        addSubview(ratingText)
        addSubview(rateScore)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        moviePosterImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        moviePosterImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        moviePosterImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        moviePosterImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        starButton.topAnchor.constraint(equalTo: moviePosterImage.bottomAnchor, constant: -30).isActive = true
        starButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        starButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        starButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        ratingText.topAnchor.constraint(equalTo: starButton.bottomAnchor, constant: 5).isActive = true
        ratingText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        ratingText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20).isActive = true
        ratingText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        rateScore.topAnchor.constraint(equalTo: ratingText.bottomAnchor, constant: 5).isActive = true
        rateScore.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        rateScore.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20).isActive = true
        rateScore.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
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
        imageView.layer.cornerRadius = 20
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
    
    let ratingText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.myDarkGreen
        label.clipsToBounds = true
        label.sizeToFit()
        label.text = "My Rating"
        return label
    }()
    
    let rateScore: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.clipsToBounds = true
        label.sizeToFit()
        label.text = "0"
        return label
    }()
}
