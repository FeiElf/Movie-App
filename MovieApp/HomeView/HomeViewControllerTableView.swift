//
//  HomeViewControllerTableView.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = moviesData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCellID, for: indexPath) as! MovieListCell
        cell.movieListTable = self
        cell.data = info
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.myBackgroundColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainCor.goToDetailPage(movieDataId: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
