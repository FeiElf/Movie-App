//
//  ViewController.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import UIKit
import SwiftUI
import Combine
import Foundation

class HomeViewController: UIViewController {
    
    private var usersSubscriper: AnyCancellable?
    var tableView = tableCustom()
    var mainCor: MainCoordinator
    
    let MovieListCellID = "MovieListCellID"
    var moviesData = [MovieViewModel]()
    var searchMovie = [MovieViewModel]()
    var genres = [Genre]()
    
    let clean = CleanData()
    
    init(coordinator: MainCoordinator) {
        self.mainCor = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.myBackgroundColor
        setUpTableViewDetails()
        setUpView()
        genresApiCall()
//        setUpTextFieldPublisher()
    }
    
    @objc func genresApiCall() {
        debugPrint("genre apiCall")
        usersSubscriper = callAPIPublisher(url: "https://api.themoviedb.org/3/genre/movie/list?language=en")
            .sink(receiveCompletion: { finished in
            switch finished {
            case .failure(let error) : debugPrint(error)
                self.callFailureAlert()
            case .finished: print("finished")
                }
            }, receiveValue: { (data: GenreStructure) in
                self.genres = data.genres
                self.movieApiCall()
            })
    }
    
    // API CALL
    @objc func movieApiCall() {
        debugPrint("movie apiCall")
        usersSubscriper = callAPIPublisher(url: "https://api.themoviedb.org/3/movie/popular?language=en-US")
            .sink(receiveCompletion: { finished in
            switch finished {
            case .failure(let error): debugPrint(error)
                self.callFailureAlert()
            case .finished: print("finished")
                }
            }, receiveValue: { (data: JSONStructure) in
               self.refactorData(data: data.results)
            })
    }
    
    func callAPIPublisher<T: Codable>(url: String) -> AnyPublisher<T, Error> {
        return DataManagerGenerics().apiCallGeneric(url: url)
    }
    
    func refactorData(data: [Movie]) {
        debugPrint("refactor data")
        Task {
            await clean.refactorAndInsertIntoViewModel(data: data, genres: genres).sink { [weak self] completion in
                switch completion {
                case .failure(.message(_)): self?.callFailureAlert()
                case .finished:  print("finished")
                }
            } receiveValue: { (data) in
//                            debugPrint(data)
                self.moviesData = data;
                self.searchMovie = self.moviesData
                DispatchQueue.main.async {
                    self.tableView.reloadData();
                    self.tableView.tableFooterView = UIView()
                }
            }
        }
    }
    
    func callFailureAlert() {
        Alert.show(title: "There was an issue", message: "Please try later", vc: self)
    }
    
    @objc func clearText() {}
    
    enum DataType  {
        case search
        case original
    }
    
//    func setUpTextFieldPublisher() {
//        generalTextField.textPublisher.sink { value in
//            let searchResults = self.moviesData.filter { $0.title!.contains(value) }
//            value.count < 1 ? self.update(type: .original, data: []) : self.update(type: .search, data: searchResults)
//        }.store(in: &cancellables)
//    }
//    
//    func update(type: DataType, data: [MovieViewModel]) {
//        switch type {
//        case .search:
//            DispatchQueue.main.async { self.moviesData = data; self.tableView.reloadData() }
//        case .original:
//            DispatchQueue.main.async { self.moviesData = self.searchMovie; self.tableView.reloadData() }
//        }
//    }
    
    lazy var SearchWhiteBackground: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 1
        label.clipsToBounds = true
        label.layer.borderWidth = 1
        let color = UIColor.gray
        label.layer.borderColor = color.cgColor
        label.layer.cornerRadius = 20
        return label
    }()
    
    let searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.zPosition = 2
        return imageView
    }()
    
    var cancellables = Set<AnyCancellable>()
    lazy var generalTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Search"
        field.backgroundColor = .clear
        field.autocapitalizationType = UITextAutocapitalizationType.none
        field.layer.zPosition = 3
//      field.delegate = self
        field.isUserInteractionEnabled = true
        field.textColor = UIColor.green
        field.font = UIFont(name: "Arial", size: 16)
        field.textAlignment = NSTextAlignment.left
        field.returnKeyType = .done
        field.keyboardType = .numberPad
        field.keyboardAppearance = .light
      return field
    }()
    
    lazy var xForsearchImage: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "clear"), for: .normal)
        button.tintColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.contentMode = .scaleAspectFit
        button.layer.zPosition = 2
        return button
    }()
    
    lazy var titleText: UILabel = {
        let title = UILabel()
        title.text = "Popular Right now"
        title.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.heavy)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.backgroundColor = UIColor.myGreen
        title.textColor = UIColor.myDarkGreen
        title.layer.zPosition = 1
        return title
    }()

}

struct PreviewViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            HomeViewController(coordinator: MainCoordinator())
        }
    }
}

