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
    var course: CourseRepresentation?
    var courses: [CourseRepresentation]?
    let courseController = CourseController()
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchResultsTableView: UITableView!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTableView.dataSource = self
        searchResultsTableView.delegate = self
        searchResultsTableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)

        guard let course = courses?[indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.text = "\(course.name)"
        cell.detailTextLabel?.text = "$\(course.cost)"

        return cell
    }

}
