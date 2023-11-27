//
//  MovieCell.swift
//  MovieApp
//
//  Created by USM Admin on 23/11/2023.
//

import Foundation
import UIKit

class MovieListCell: UITableViewCell {
    var movieListTable: HomeViewController?
    
    var data: MovieViewModel! {
        didSet {
            if let posterImage = data.poster_image {
                moviePosterImage.image = UIImage(data: posterImage)
            }
            movieTitle.text = data.title
            movieYear.text = data.release_year
            movieVote.text = "\(data.vote_average)%"
            if let genres = data.genres {
                var a: [TagCell] = []
                genres.forEach { genre in
                    let tv = TagCell()
                    tv.text = genre
                    tv.layer.zPosition = 3
                    a.append(tv)
                }
                tagsView.addArrangedViews(a)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        addSubview(moviePosterImage)
        addSubview(whiteBackgroundLabel)
        addSubview(movieTitle)
        addSubview(movieYear)
        addSubview(movieVote)
        addSubview(scoreText)
        addSubview(tagsView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        whiteBackgroundLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        whiteBackgroundLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        whiteBackgroundLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        whiteBackgroundLabel.heightAnchor.constraint(equalToConstant: 145).isActive = true
        
        moviePosterImage.topAnchor.constraint(equalTo: whiteBackgroundLabel.topAnchor, constant: 5).isActive = true
        moviePosterImage.leftAnchor.constraint(equalTo: whiteBackgroundLabel.leftAnchor, constant: 0).isActive = true
        moviePosterImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        moviePosterImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
      
        movieTitle.topAnchor.constraint(equalTo: whiteBackgroundLabel.topAnchor, constant: 5).isActive = true
        movieTitle.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 10).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: whiteBackgroundLabel.rightAnchor, constant: 10).isActive = true
        movieTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 5).isActive = true
        movieYear.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 10).isActive = true
        movieYear.rightAnchor.constraint(equalTo: whiteBackgroundLabel.rightAnchor, constant: 10).isActive = true
        movieTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        movieVote.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 5).isActive = true
        movieVote.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 10).isActive = true
        movieVote.widthAnchor.constraint(equalToConstant: 40).isActive = true
        movieVote.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        scoreText.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 5).isActive = true
        scoreText.leftAnchor.constraint(equalTo: movieVote.rightAnchor, constant: 10).isActive = true
        scoreText.rightAnchor.constraint(equalTo: whiteBackgroundLabel.rightAnchor, constant: 10).isActive = true
        scoreText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        tagsView.topAnchor.constraint(equalToSystemSpacingBelow: movieVote.bottomAnchor, multiplier: 5).isActive = true
        tagsView.leftAnchor.constraint(equalTo: moviePosterImage.rightAnchor, constant: 0).isActive = true
        tagsView.rightAnchor.constraint(equalTo: whiteBackgroundLabel.rightAnchor, constant: 0).isActive = true
        tagsView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    var whiteBackgroundLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.white
        label.layer.zPosition = 1
        label.clipsToBounds = true
        return label
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
        return imageView
    }()
    
    let movieTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.heavy)
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
    
    let movieVote: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.layer.zPosition = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
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
    
}
