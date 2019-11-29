//
//  FirstViewController.swift
//  namucontera
//
//  Created by Mac on 19/10/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var shedulearray = [String]()
    var Arrayday = [String]()
    var Arraytime = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shedulearray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         //let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        //cell.textLabel?.text = shedulearray[indexPath.row]

        
        let cell = tableview1.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewTableViewCell
       cell.label1?.text! = shedulearray[indexPath.row]
        cell.label2?.text = Arrayday[indexPath.row]
        cell.label3?.text = Arraytime[indexPath.row]
    return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableview1.cellForRow(at: indexPath) as! NewTableViewCell
   
    let update = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    update.sname = cell.label1.text!
    
    navigationController?.pushViewController(update, animated: true)
    }
   
    
    @IBOutlet weak var tableview1: UITableView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let select = "select * from Schedule "
        DBWrapper.sharedObj.slectALLTask(query: select)
        if DBWrapper.sharedObj.scheduleArrayData.count > 0 &&
            //DBWrapper.sharedObj.RoomScheduleArray.count > 0 &&
            DBWrapper.sharedObj.DayScheduleArray.count > 0 &&
            DBWrapper.sharedObj.TimeScheduleArray.count > 0
            //DBWrapper.sharedObj.ApplianceScehduleArray.count > 0
        {
            shedulearray = DBWrapper.sharedObj.scheduleArrayData
            Arrayday = DBWrapper.sharedObj.DayScheduleArray
            Arraytime = DBWrapper.sharedObj.TimeScheduleArray
        }
        else
        {
            print("Not found")
        }
        
        self.tableview1.reloadData()
   
    
        

        
    button1.layer.cornerRadius = 25
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.black.cgColor
        
        
        
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        let select = "select * from Schedule "
        DBWrapper.sharedObj.slectALLTask(query: select)
        if DBWrapper.sharedObj.scheduleArrayData.count > 0 &&
            //DBWrapper.sharedObj.RoomScheduleArray.count > 0 &&
            DBWrapper.sharedObj.DayScheduleArray.count > 0 &&
            DBWrapper.sharedObj.TimeScheduleArray.count > 0
            //DBWrapper.sharedObj.ApplianceScehduleArray.count > 0
        {
            shedulearray = DBWrapper.sharedObj.scheduleArrayData
            Arrayday = DBWrapper.sharedObj.DayScheduleArray
            Arraytime = DBWrapper.sharedObj.TimeScheduleArray
        }
        else
        {
            print("Not found")
        }
        
        self.tableview1.reloadData()
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
    
        
        let next  = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(next, animated: true)
        
        
    }
    
    
    @IBOutlet weak var button1: UIButton!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

