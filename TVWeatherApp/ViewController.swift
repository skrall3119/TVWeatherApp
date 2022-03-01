//
//  ViewController.swift
//  TVWeatherApp
//
//  Created by Alex Janci on 3/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currTemp: UILabel!
    @IBOutlet weak var currSum: UILabel!
    @IBOutlet weak var currDew: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date.now.formatted(date: .abbreviated, time: .omitted)
        dateLabel.text = currentDate
        
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.1916,88.3501"){
            if let data = NSData(contentsOf: url as URL){
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
                    let newDict = parsed
                    
                    print(newDict["currently"]!["summary"] as Any)
                    print(newDict["currently"]!["temperature"] as Any)
                    print(newDict["currently"]!["dewPoint"] as Any)
                    
                    self.currTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                    self.currSum.text = "\(newDict["currently"]!["summary"]!!)"
                    self.currDew.text = "\(newDict["currently"]!["dewPoint"]!!)"
                }
                catch let error as NSError{
                    print(error)
                }
            }
        }
    }


}

