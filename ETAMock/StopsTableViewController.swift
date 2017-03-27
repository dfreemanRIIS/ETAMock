//
//  StopsTableViewController.swift
//  ETAMock
//
//  Created by Brian Marshall on 3/27/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import UIKit
import Foundation

class StopsTableViewController: UITableViewController {

    var stopNames:[String] = []
    let urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/3/routes/87/northbound/weekday/1/stops"

    override func viewWillAppear(_ animated: Bool) {
        //Fetch
        let jsonFetcher = JSONfetcher()
        let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
        let jsonString = jsonFetcher.callApi(url: url)
        print(jsonString)

        //Parse
        let parser = customJSONparser()
        stopNames = parser.getDirectionOneStops(jsonString)
        print(stopNames)

        //Reload
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.stopNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.stopNames[indexPath.row]

        return cell
    }
}
