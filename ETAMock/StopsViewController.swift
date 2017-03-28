//
//  StopsViewController.swift
//  ETAMock
//
//  Created by Brian Marshall on 3/27/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import UIKit

class StopsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var companyIndex:Int!
    var id:String!
    var direction:String!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentButton: UISegmentedControl!
    var stopNames:[String] = []
    var urlString:String = ""
    let urlStringSouth:String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        //Fetch
        urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(id!)/\(direction!)/weekday/1/stops"
        let jsonFetcher = JSONfetcher()
        let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
        let jsonString = jsonFetcher.callApi(url: url)

        //Parse
        let parser = customJSONparser(companyIndex: companyIndex)
        stopNames = parser.getDirectionOneStops(jsonString)

        //For Eastbound and Westbound routes
        if stopNames.isEmpty == true {
            direction = "eastbound"
            //Fetch
            urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(id!)/\(direction!)/weekday/1/stops"
            let jsonFetcher = JSONfetcher()
            let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
            let jsonString = jsonFetcher.callApi(url: url)

            //Parse
            let parser = customJSONparser(companyIndex: companyIndex)
            stopNames = parser.getDirectionOneStops(jsonString)

            //Assign Button Names
            segmentButton.setTitle("Eastbound", forSegmentAt: 0)
            segmentButton.setTitle("Westbound", forSegmentAt: 1)
        }

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.stopNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopsCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = self.stopNames[indexPath.row]
        
        return cell
    }

    @IBAction func directionButtonClick(_ sender: UISegmentedControl) {
        //When the button is pressed reload the view
        switch segmentButton.selectedSegmentIndex {
        case 0:
            urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(id!)/\(direction!)/weekday/1/stops"

            //Fetch
            let jsonFetcher = JSONfetcher()
            let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
            let jsonString = jsonFetcher.callApi(url: url)

            //Parse
            let parser = customJSONparser(companyIndex: companyIndex)
            stopNames = parser.getDirectionOneStops(jsonString)

            //Reload
            self.tableView.reloadData()
        case 1:
            if(direction == "northbound") {
                urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(id!)/southbound/weekday/1/stops"
            }
            if(direction == "southbound") {
                urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(id!)/northbound/weekday/1/stops"
            }
            if(direction == "eastbound") {
                urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(id!)/westbound/weekday/1/stops"
            }
            if(direction == "westbound") {
                urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/\(companyIndex!)/routes/\(id!)/eastbound/weekday/1/stops"
            }
            //Fetch
            let jsonFetcher = JSONfetcher()
            let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
            let jsonString = jsonFetcher.callApi(url: url)

            //Parse
            let parser = customJSONparser(companyIndex: companyIndex)
            stopNames = parser.getDirectionOneStops(jsonString)

            //Reload
            self.tableView.reloadData()
        default:
            break
        }
    }
}
