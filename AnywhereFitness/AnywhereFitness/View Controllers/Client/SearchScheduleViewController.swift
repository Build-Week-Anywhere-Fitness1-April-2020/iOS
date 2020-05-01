//
//  SearchScheduleViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class SearchScheduleViewController: UIViewController {

    // MARK: - Properties
      var course: CourseRepresentation?

    // MARK: - IBOutlets
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var scheduleTableView: UITableView!
    @IBOutlet weak var classNameLabel: UILabel!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        updateViews()
    }

    func updateViews() {
        guard let course = course else { return }
        classNameLabel.text = course.name
        if course.classType == 0 {
            backgroundView.setBackground(toImageNamed: "YogaImage")
        } else if course.classType == 1 {
            backgroundView.setBackground(toImageNamed: "WeightliftingImage")
        } else if course.classType == 2 {
            backgroundView.setBackground(toImageNamed: "BoxingImage")
        } else if course.classType == 3 {
            backgroundView.setBackground(toImageNamed: "PilatesImage")
        } else {
            backgroundView.setBackground()
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchSegue4" {
            guard let searchReserveVC = segue.destination as? SearchReserveViewController,
                let index = scheduleTableView.indexPathForSelectedRow?.row else { return }
            searchReserveVC.course = course
            searchReserveVC.day = course?.days[index]
        }
    }
}

extension SearchScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        course?.days.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath)

        guard let course = course else { return UITableViewCell() }
        cell.textLabel?.text = "\(course.days[indexPath.row])"
        cell.detailTextLabel?.text = course.time

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SearchSegue4", sender: self)
    }
}
