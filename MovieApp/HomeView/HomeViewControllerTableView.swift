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
        var info = moviesData[indexPath.row]
//         if info.newDate == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieListCell
                cell.selectionStyle = .none
                cell.backgroundColor = UIColor.myBackgroundColor
                return cell
//          } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: FlightListCellID, for: indexPath) as! FlightsListCell
//                cell.flightListTable = self
//                cell.data = info
//                cell.selectionStyle = .none
//                cell.backgroundColor = UIColor.myBackgroundColor
//                return cell
//        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainCor.goToSecondPage()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var newDate = moviesData[indexPath.row].newDate
//        if newDate == true { return 209 } else { return 157.5 }
        return 200
    }
}
