//
//  SecondViewController.swift
//  namucontera
//
//  Created by Mac on 19/10/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
   var roomarray = ["BEDROOM","KITCHEN","DINNING ROOM","LIVING ROOM","HALL"]
    var appliancearray = ["LIGHT 1","LIGHT 2","LIGHT 3","FAN","AC","TV"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableview1
        {
        let cell = tableView.cellForRow(at: indexPath)
        textfield1.text = cell?.textLabel?.text!
        tableview1.isHidden = true
        }
    else
        {
            let cell1 = tableView.cellForRow(at: indexPath)
            textfield2.text = cell1?.textLabel?.text!
            tableview2.isHidden = true
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableview1
        {
        return roomarray.count
        }
        else
        {
        return appliancearray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableview1
        {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = roomarray[indexPath.row]
    return cell
        }
        else
        {
            let cell1 = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell1.textLabel?.text = appliancearray[indexPath.row]
            return cell1
        }
    }
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview1.isHidden = true
        tableview2.isHidden = true
        
        
        view1.layer.cornerRadius = 10
        view1.layer.borderWidth = 1
        view1.layer.borderColor = UIColor.black.cgColor
        
        textfield1.layer.cornerRadius = 10
        textfield1.layer.borderWidth = 1
        textfield1.layer.borderColor = UIColor.gray.cgColor
        
        textfield2.layer.cornerRadius = 10
        textfield2.layer.borderWidth = 1
        textfield2.layer.borderColor = UIColor.gray.cgColor
        
        button1.layer.cornerRadius = 10
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.gray.cgColor
        
        button2.layer.cornerRadius = 10
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.gray.cgColor
        
        
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView == tableview1
        {
        textfield1.text = roomarray[indexPath.row]
        }
        else
        {
            textfield2.text = appliancearray[indexPath.row]
        }
    }
    
    @IBOutlet weak var pick: UIPickerView!
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var textfield2: UITextField!
    
    
    @IBOutlet weak var button2: UIButton!
    

    
    @IBOutlet weak var tableview2: UITableView!
    
    @IBOutlet weak var tableview1: UITableView!
    
    
    @IBAction func button1(_ sender: UIButton) {
     
       tableview1.isHidden = false
    
    }
    @IBAction func button2(_ sender: UIButton) {
        
        tableview2.isHidden = false
        
    }
   
    @IBOutlet weak var textfield3: UITextField!
    
    
    @IBAction func dateaction(_ sender: UIDatePicker) {
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let currentTime = timeFormatter.string(from: datepickout.date)
        textfield3.text = currentTime
        datepickout.isHidden = true
    }
    @IBOutlet weak var datepickout: UIDatePicker!
 
    
    
    @IBOutlet weak var day: UILabel!
    
    
    @IBAction func everday(_ sender: UIButton) {
        day.text = "Everyday"
    }
    
    
    @IBAction func sun(_ sender: UIButton) {
        day.text = "Sunday"
    }
    
    
    @IBAction func mon(_ sender: UIButton) {
        
        day.text = "Monday"
    }
    
    @IBAction func tue(_ sender: UIButton) {
        day.text = "Tuesday"
    }
    
    @IBAction func wed(_ sender: UIButton) {
        day.text = "Wednesday"
    }
    
    @IBAction func thur(_ sender: UIButton) {
        day.text = "Thursday"
    }
    
    @IBAction func fri(_ sender: UIButton) {
        day.text = "Friday"
    }
    
    
    @IBAction func sat(_ sender: UIButton) {
        day.text = String("Saturday")
        print(day.text as Any)
    }
    
    
    @IBOutlet weak var sheduletext: UITextField!
    
    @IBAction func insert(_ sender: UIButton) {
       
        
        
        
        
        let insert = "insert into Schedule(Schedule_Name , Room_Name , Appliance_Name ,Time ,Day)values('\(sheduletext.text!)','\(textfield1.text!)','\(textfield2.text!)','\(textfield3.text!)','\(day.text)')"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: insert)
        if isSuccess
        {
            print("Insert: Success......")
           // ClearData()
        }
        else
        {
            print("Failed")
        }
    }
    
}

