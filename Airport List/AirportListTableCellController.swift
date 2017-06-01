//
//  AirportListTableCellController.swift
//  Airport List
//
//  Created by JohnLiu on 2017/5/28.
//  Copyright © 2017年 劉奕為. All rights reserved.
//


import UIKit

class AirportListTableCellController: UITableViewCell {
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var airportName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
