//
//  MainCoordinator.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {
//    var navigationController: UINavigationController?

    var navigationController = UINavigationController()
    
    func eventOccured(type: Event) {
    }
    
    func start() {
        print("start")
        let vc = HomeViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
  
    func goToSecondPage() {
        print("goToSecondPage")
//        let vc = ViewController2()
//        vc.mainCor = self
//        navigationController.pushViewController(vc, animated: true)
//        let vc = ViewController2(coordinator: self)
//        navigationController.pushViewController(vc, animated: true)
    }
   
  
    func goToFirstPage() {
        print("goToFirstPage")
//        let vc = HomeViewController(coordinator: self)
////        navigationController.pushViewController(vc, animated: true)
//        navigationController.viewControllers = [vc]
    }
   
    func goToThirdPage() {
        print("goToThirdPage")
//        let vc = ViewController3(coordinator: self)
//        navigationController.pushViewController(vc, animated: true)
    }
    
//
//    func goToFourthPage() {
//        print("goToFourthPage")
//        let vc = ViewController4(coordinator: self, color: UIColor.yellow)
//        navigationController.pushViewController(vc, animated: true)
//    }
     
}
