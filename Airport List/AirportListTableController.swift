//
//  AirportListTableController.swift
//  Airport List
//
//  Created by JohnLiu on 2017/5/27.
//  Copyright © 2017年 劉奕為. All rights reserved.
//


import UIKit

class AirportListTableController: UITableViewController {
    @IBOutlet weak var AirportName: UILabel!
    
    @IBOutlet weak var shrotName: UILabel!
    
    @IBOutlet weak var city: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myTableView = UITableView()
        myTableView.register(
            UITableViewCell.self, forCellReuseIdentifier: "AirportListCell")
        myTableView.delegate = self
        myTableView.dataSource = self
        
        if let path = Bundle.main.path(forResource: "airports", ofType: "plist") {
            if let arrayOfItems = NSArray(contentsOfFile: path) {
                print(arrayOfItems)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
