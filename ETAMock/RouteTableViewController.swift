//
//  RouteTableViewController.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/23/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import UIKit
import Foundation

class RouteTableViewController: UITableViewController {
    
    var routeIds:[String] = []
    let urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/1/routes"

    override func viewWillAppear(_ animated: Bool) {
        //Fetch
        let jsonFetcher = JSONfetcher()
        let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
        let jsonString = jsonFetcher.callApi(url: url)
        
        //Parse
        let parser = customJSONparser()
        routeIds = parser.customParse(jsonString)
        
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
        return self.routeIds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routeCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.routeIds[indexPath.row]

        return cell
    }
}
