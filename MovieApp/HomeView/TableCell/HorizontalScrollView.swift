//
//  TagsView.swift
//  MovieApp
//
//  Created by USM Admin on 27/11/2023.
//

import Foundation
import UIKit

//class TagsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//    
//    private let cellId = "tag"
//    
//    var theTags: [String] = []{
//        didSet {
//            collectionView?.reloadData()
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView?.backgroundColor = .white
//        collectionView?.register(MyTagsView.self, forCellWithReuseIdentifier: cellId)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyTagsView
//        cell.theTags = theTags
//        return cell
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSizeMake(view.frame.width, 20)
//    }
//}

//class MyTagsView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//    private let tagCellId = "tag Cell"
//    
//    var theTags: [String] = []{
//        didSet {
//            collectionView.reloadData()
//        }
//    }
//    
////    let appCollectionView: UICollectionView = {
////        let layout = UICollectionViewFlowLayout()
////        layout.scrollDirection = .horizontal
////        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
////        
////        collectionView.translatesAutoresizingMaskIntoConstraints = false
////        return collectionView
////    }()
//    
//    override func viewDidLoad() {
//        setUpView()
//    }
//    
//    func setUpView() {
////        addSubview(appCollectionView)
////        
////        appCollectionView.dataSource = self
////        appCollectionView.delegate = self
//        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.register(TagCell.self, forCellWithReuseIdentifier: tagCellId)
//        
////        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
////        
////        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
//    }
//    
//        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagCellId, for: indexPath) as! TagCell
//            cell.text = theTags[indexPath.row]
//            return cell
//        }
//    
//        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return theTags.count
//        }
//    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSizeMake(view.frame.width, 40)
//        }
//    
//    
////    var theTags: [String] = [] {
////        didSet {
////            // clear existing (in case we're setting the tags multiple times)
////            vStack.arrangedSubviews.forEach { v in
////                v.removeFromSuperview()
////            }
////            tagViews = []
////            var totalWidth: CGFloat = 0
////            // create individual tag views and get the total width
////            theTags.forEach { str in
////                let t = MyTagView()
////                t.text = str
////                let sz = t.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
////                totalWidth += sz.width
////                tagViews.append(t)
////            }
//// 
////            let rowWidth: CGFloat = totalWidth / CGFloat(numRows)
////            var iTag: Int = 0
////            while iTag < tagViews.count {
////                // create a new "row" horizontal stack view
////                let v = UIStackView()
////                v.spacing = 8
////                vStack.addArrangedSubview(v)
////                var cw: CGFloat = 0
////                // add tag views
////                while cw < rowWidth, iTag < tagViews.count {
////                    let t = tagViews[iTag]
////                    let sz = t.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
////                    v.addArrangedSubview(t)
////                    cw += sz.width
////                    iTag += 1
////                }
////            }
////        }
////    }
//    
//    
//
////    func commonInit() -> Void {
////        let scrollView = UIScrollView()
////        scrollView.translatesAutoresizingMaskIntoConstraints = false
////        scrollView.addSubview(vStack)
////        addSubview(scrollView)
////        let g = self
////        let cg = scrollView.contentLayoutGuide
////        NSLayoutConstraint.activate([
////            scrollView.topAnchor.constraint(equalTo: g.topAnchor, constant: 0.0),
////            scrollView.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 0.0),
////            scrollView.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: 0.0),
////            scrollView.bottomAnchor.constraint(equalTo: g.bottomAnchor, constant: 0.0),
////            
////            vStack.topAnchor.constraint(equalTo: cg.topAnchor, constant: 8.0),
////            vStack.leadingAnchor.constraint(equalTo: cg.leadingAnchor, constant: 8.0),
////            vStack.trailingAnchor.constraint(equalTo: cg.trailingAnchor, constant: -8.0),
////            vStack.bottomAnchor.constraint(equalTo: cg.bottomAnchor, constant: -8.0),
////            
////            scrollView.heightAnchor.constraint(equalTo: vStack.heightAnchor, constant: 16.0),
////        ])
////    }
//    
//}
