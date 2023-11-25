//
//  Coordinator.swift
//  FlightAppRebuiltWithCombine
//
//  Created by Matthew Corry on 8/3/2023.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
//    var navigationController: UINavigationController? { get set }
    var navigationController: UINavigationController { get }
    func eventOccured(type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
