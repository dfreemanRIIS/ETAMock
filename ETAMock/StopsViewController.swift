//
//  StopsViewController.swift
//  ETAMock
//
//  Created by Brian Marshall on 3/27/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import UIKit

class StopsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentButton: UISegmentedControl!
    var stopNames:[String] = []
    let urlString = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/3/routes/87/northbound/weekday/1/stops"
    let urlStringSouth = "http://ec2-204-236-211-33.compute-1.amazonaws.com:8080/companies/3/routes/87/southbound/weekday/1/stops"
    
    override func viewWillAppear(_ animated: Bool) {
        //Fetch
        let jsonFetcher = JSONfetcher()
        let url = jsonFetcher.getSourceUrl(apiUrl: urlString)
        let jsonString = jsonFetcher.callApi(url: url)
        
        //Parse
        let parser = customJSONparser()
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
        switch segmentButton.selectedSegmentIndex {
        case 0:
            print("northbound")
        case 1:
            print("southbound")
        default:
            break
        }
    }
}
