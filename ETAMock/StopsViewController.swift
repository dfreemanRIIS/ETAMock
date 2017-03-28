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
        let parser = customJSONparser(companyIndex: 1)
        stopNames = parser.getDirectionOneStops(jsonString)
        
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
            //Fetch
            let jsonFetcher = JSONfetcher()
            let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
            let jsonString = jsonFetcher.callApi(url: url)

            //Parse
            let parser = customJSONparser(companyIndex: 1)
            stopNames = parser.getDirectionOneStops(jsonString)

            //Reload
            self.tableView.reloadData()
        case 1:
            //Fetch
            let jsonFetcher = JSONfetcher()
            let url = jsonFetcher.getSourceUrl(apiUrl: urlStringSouth)
            let jsonString = jsonFetcher.callApi(url: url)

            //Parse
            let parser = customJSONparser(companyIndex: 1)
            stopNames = parser.getDirectionOneStops(jsonString)

            //Reload
            self.tableView.reloadData()
        default:
            break
        }
    }
}
