//
//  AirportListTableController.swift
//  Airport List
//
//  Created by JohnLiu on 2017/5/27.
//  Copyright © 2017年 劉奕為. All rights reserved.
//


import UIKit

class AirportListTableController: UITableViewController {
    
    var airportList: [[[String: String]]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let path = Bundle.main.path(forResource: "airports", ofType: "plist") {
        let arrayOfItems = NSArray(contentsOfFile: path) as! [[String:String]]
        for item in arrayOfItems {
            for num in 0...airportList.count{
                if num == airportList.count{
                    airportList.append([item])
                    break;
                }
                else if item["Country"] == airportList[num][0]["Country"]{
                    airportList[num].append(item)
                    break;
                }
            }
        }
            
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return airportList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportList[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return airportList[section][0]["Country"]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportListCell", for: indexPath) as! AirportListTableCellController
        
        cell.airportName.text = airportList[indexPath.section][indexPath.row]["Airport"]
        cell.city.text = airportList[indexPath.section][indexPath.row]["ServedCity"]
        cell.shortName.text = airportList[indexPath.section][indexPath.row]["IATA"]
        cell.shortName.textColor = UIColor.gray
        cell.city.textColor = UIColor.gray
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AirportDetailInfo" {
            guard let cell = sender as? UITableViewCell else {
                fatalError("Mis-configured storyboard! The sender should be a cell.")
            }
            self.prepareOpenAiportDetailInfo(for: segue, sender: cell)
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
    
    
    func prepareOpenAiportDetailInfo(for segue: UIStoryboardSegue, sender: UITableViewCell) {
        
        let AirportListTableDetailController = segue.destination as! AirportListTableDetailController
        let senderIndexPath = self.tableView.indexPath(for: sender)!
        
        var dictemp : [String: String] = [:]
        dictemp["AirportName"] = airportList[senderIndexPath.section][senderIndexPath.row]["Airport"]
        dictemp["CountryName"] = airportList[senderIndexPath.section][senderIndexPath.row]["Country"]
        dictemp["CityName"] = airportList[senderIndexPath.section][senderIndexPath.row]["ServedCity"]
        dictemp["CityCode"] = airportList[senderIndexPath.section][senderIndexPath.row]["IATA"]
        
        AirportListTableDetailController.detailInfo = dictemp
    }
    
}
