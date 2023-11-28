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
    }
}
