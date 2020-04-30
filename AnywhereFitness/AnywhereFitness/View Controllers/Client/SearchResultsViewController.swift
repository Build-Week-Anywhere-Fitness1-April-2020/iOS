//
//  SearchResultsViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {

    // MARK: - Properties
    var courses: [CourseRepresentation]?
    let courseController = CourseController.shared
    var formatter: NumberFormatter =  {
        let formatter = NumberFormatter()
        formatter.alwaysShowsDecimalSeparator = true
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencyGroupingSeparator = ","
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    // MARK: - IBOutlets
    @IBOutlet weak var searchResultsTableView: UITableView!
    @IBOutlet var backgroundView: UIView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTableView.dataSource = self
        searchResultsTableView.delegate = self
        searchResultsTableView.reloadData()
        backgroundView.setBackground()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchSegue2" {
            guard let searchDetailVC = segue.destination as? SearchDetail1ViewController,
                let index = searchResultsTableView.indexPathForSelectedRow?.row,
                let course = courses?[index] else { return }
            
            searchDetailVC.course = course
        }
    }
}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)

        guard let course = courses?[indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.text = "\(course.name)"
        cell.detailTextLabel?.text = formatter.string(from: NSNumber(value: course.cost))

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SearchSegue2", sender: self)
    }
}
