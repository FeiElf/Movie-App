//
//  RateModalViewController.swift
//  MovieApp
//
//  Created by USM Admin on 28/11/2023.
//

import Foundation
import UIKit
import SwiftUI
import Combine

final class RateModalViewController: UIViewController {
    
    var mainCor: MainCoordinator
    var movieDataId: Int
    
    init(coordinator: MainCoordinator, movieDataId: Int) {
        self.mainCor = coordinator
        self.movieDataId = movieDataId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let myView = UIView()
        myView.backgroundColor = .myGreen
        myView.layer.cornerRadius = 30
        myView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.view = myView
        setUpView()
        setUpTextFieldPublisher()
    }
    
    @objc
    private func labelDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func saveDidTap() {
        moviesDataCopy[movieDataId].score = Int(rateTextField.text ?? "0") ?? 0
        debugPrint("save score \(moviesDataCopy[movieDataId].score)")
        dismiss(animated: true, completion: nil)
        mainCor.goToRatedPage(movieDataId: movieDataId)
    }
    
    func setUpView() {
        view.addSubview(setRateTitle)
        setRateTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        setRateTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        setRateTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        setRateTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(whiteBackgroundLabel)
        whiteBackgroundLabel.topAnchor.constraint(equalTo: setRateTitle.bottomAnchor, constant: 0).isActive = true
        whiteBackgroundLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        whiteBackgroundLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        whiteBackgroundLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(rateTextField)
        rateTextField.topAnchor.constraint(equalTo: whiteBackgroundLabel.topAnchor, constant: 70).isActive = true
        rateTextField.leftAnchor.constraint(equalTo: whiteBackgroundLabel.leftAnchor, constant: 40).isActive = true
        rateTextField.rightAnchor.constraint(equalTo: whiteBackgroundLabel.rightAnchor, constant: -40).isActive = true
        rateTextField.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(cancelButton)
        cancelButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelDidTap)))
        cancelButton.topAnchor.constraint(equalTo: rateTextField.bottomAnchor, constant: 40).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: whiteBackgroundLabel.centerXAnchor).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(saveButton)
        saveButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(saveDidTap)))
        saveButton.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 20).isActive = true
        saveButton.leftAnchor.constraint(equalTo: whiteBackgroundLabel.leftAnchor, constant: 40).isActive = true
        saveButton.rightAnchor.constraint(equalTo: whiteBackgroundLabel.rightAnchor, constant: -40).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setUpTextFieldPublisher() {
        rateTextField.textPublisher.sink { value in
            debugPrint(value)
            if let x = value.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
                if value.count > 1 {
                    self.rateTextField.text = String(value.last ?? "0")
                }
            }else {
                self.rateTextField.text = "0"
            }
        }.store(in: &cancellables)
    }
    
    var cancellables = Set<AnyCancellable>()
    
    let cancelButton: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cancel"
        label.textColor = .black
        label.isUserInteractionEnabled = true
        label.layer.zPosition = 2
        return label
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .myGreen
        button.setTitleColor(.myDarkGreen, for: .normal)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.masksToBounds = true
        button.layer.zPosition = 2
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 20
        return button
    }()
    
    let setRateTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.heavy)
        title.backgroundColor = .myGreen
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.textColor = .myDarkGreen
        title.layer.zPosition = 2
        title.text = "set your personal star rating"
        title.layer.cornerRadius = 30
        title.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return title
    }()
    
    let whiteBackgroundLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.white
        label.layer.zPosition = 1
        label.clipsToBounds = true
        return label
    }()
    
    lazy var rateTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.text = "0"
        field.backgroundColor = .clear
        field.autocapitalizationType = UITextAutocapitalizationType.none
        field.layer.zPosition = 3
        field.isUserInteractionEnabled = true
        field.textColor = UIColor.black
        field.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.heavy)
        field.textAlignment = .center
        field.returnKeyType = .done
        field.keyboardType = .numberPad
        field.keyboardAppearance = .light
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.myGrayText1.cgColor
        field.layer.cornerRadius = 10
      return field
    }()
    
}

