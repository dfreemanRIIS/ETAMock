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
    var ids:[String] = []
    var companyIndex = -1
    var urlString:String = ""

    override func viewWillAppear(_ animated: Bool) {
        //Fetch
        urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex)/routes"
        let jsonFetcher = JSONfetcher()
        let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
        let jsonString = jsonFetcher.callApi(url: url)
        print(jsonString)
        
        //Parse
        let parser = customJSONparser(companyIndex:companyIndex)
        routeIds = parser.customParse(jsonString)
        ids = parser.getIds(jsonString)
        
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStopsSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! StopsViewController
                controller.companyIndex = self.companyIndex
                controller.id = ids[indexPath.row]
                controller.direction = "northbound"
            }
        }
    }
}
