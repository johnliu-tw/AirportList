//
//  AirportListTableDatailController.swift
//  Airport List
//
//  Created by JohnLiu on 2017/6/1.
//  Copyright © 2017年 劉奕為. All rights reserved.
//

import Foundation
import UIKit

class AirportListTableDetailController: UIViewController {
    @IBOutlet weak var cityCode: UINavigationItem!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var airportName: UILabel!
    @IBOutlet weak var Image: UIImageView!
    
    var detailInfo : [String:String]? {
        didSet{
            if self.isViewLoaded{
                self.updateData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityCode.title = detailInfo!["CityCode"]
        self.updateData()
    }
    
    func updateData() {
        self.airportName.text = detailInfo?["AirportName"]
        self.airportName.numberOfLines = 0;
        self.airportName.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.city.text = detailInfo?["CityName"]
        self.country.text = detailInfo?["CountryName"]
        self.Image.frame = CGRect(x: 7, y: 64, width: 360, height: 360)
        self.Image.image = UIImage(named:"Airports Data/"+detailInfo!["CityCode"]!+".jpg")
        print("Airports Data/"+detailInfo!["CityCode"]!+".jpg")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    

}
