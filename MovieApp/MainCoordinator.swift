//
//  MainCoordinator.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {

    var navigationController = UINavigationController()
    
    func eventOccured(type: Event) {
    }
    
    func start() {
        print("start")
        let vc = HomeViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
  
    func goToDetailPage(movieDataId: Int) {
        print("goToSecondPage")
        let vc = DetailViewController(coordinator: self, movieDataId: movieDataId)
        navigationController.pushViewController(vc, animated: true)
    }
   
  
    func goToHomePage() {
        print("goToFirstPage")
        navigationController.popToRootViewController(animated: true)
    }
    
    func navigateBack() {
        print("Back")
        navigationController.popViewController(animated: true)
    }
    
    func goToRatedPage(movieDataId: Int) {
        print("goToRatedPage")
        let vc = RatedViewController(coordinator: self, movieDataId: movieDataId)
        navigationController.pushViewController(vc, animated: true)
    }
   
    func goToFavoritePage() {
        print("goToThirdPage")
        let vc = FavouriteViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
     
}
