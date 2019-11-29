//
//  ThirdViewController.swift
//  namucontera
//
//  Created by Mac on 19/10/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    var WeakDataArray = [String]()
    var WeakArrayAddData = [String]()
    var evday:Int!
    var mnday:Int!
    
    var sname:String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        ScheduleNameU.text = sname
        
        
        
        
        Updateoutlet.layer.borderWidth = 1
        DeleteU.layer.borderWidth = 1
        
        
        DateorTime.isHidden = true
        
        //Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var DeleteU: UIButton!
    @IBAction func DeleteAction(_ sender: UIButton)
    {
    let delete = "delete from Schedule where Schedule_Name = '\(ScheduleNameU.text!)'"
    let isSuccess = DBWrapper.sharedObj.executeQuery(query: delete)
    if isSuccess
    {
    print("Delete: Success......")
    //ClearData()
    }
    else
    {
    print("Failed")
    }
    
    }
    
    @IBOutlet weak var ScheduleNameU: UITextField!
    @IBOutlet weak var ScheduleTimeU: UITextField!
   
    
    @IBAction func Scheduletime(_ sender: UITextField) {
     //   if DateorTime.isHidden == true
       // {
          //  DateorTime.isHidden = false
        //}
        //else
        //{
            DateorTime.isHidden = true
        //}
    }
    @IBOutlet weak var DateorTime: UIDatePicker!
    @IBAction func DateORTime(_ sender: UIDatePicker)
    {
    
    let timeFormatter = DateFormatter()
    timeFormatter.timeStyle = DateFormatter.Style.short
    let currentTime = timeFormatter.string(from: DateorTime.date)
    ScheduleTimeU.text = currentTime
    DateorTime.isHidden = true
    }
    @IBAction func EverydayAction(_ sender: UIButton)
    {
    day.text = "everday"
    }
    @IBOutlet weak var EverydayU: UIButton!
    @IBOutlet weak var MondayU: UIButton!
    @IBOutlet weak var tuesdayU: UIButton!
    @IBOutlet weak var WednesdayU: UIButton!
    @IBOutlet weak var ThursdayU: UIButton!
    @IBOutlet weak var FridayU: UIButton!
    @IBOutlet weak var saturdayU: UIButton!
    @IBOutlet weak var SundayU: UIButton!
    @IBAction func MondayAction(_ sender: UIButton)
    {
        
       day.text = "Monday"
    
    }
    @IBAction func TuesdayAction(_ sender: UIButton)
    {
     day.text = "Tuesday"
    }
    @IBAction func WednesdayAction(_ sender: UIButton)
    {
     day.text = "Wednesday"
    }
    @IBAction func ThursdayAction(_ sender: UIButton)
    {
     day.text = "Thursday"
    }
    @IBAction func FridayAction(_ sender: UIButton)
    {
   
     day.text = "Friday"
    }
    @IBAction func SaturdayAction(_ sender: UIButton)
    {
     day.text = "Saturday"
    }
    @IBAction func SundayAction(_ sender: UIButton)
    {
         day.text = "Sunday"
    
    }
    @IBOutlet weak var Updateoutlet: UIButton!
    @IBAction func UpdateAction(_ sender: UIButton)
    {
    
    let update = "update Schedule set Time ='\(ScheduleTimeU.text!)' where Schedule_Name = '\(ScheduleNameU.text!)'"
    let isSuccess = DBWrapper.sharedObj.executeQuery(query: update)
    if isSuccess
    {
    print("Update: Success *******")
    //    ClearData()
    }
    else
    {
    print("Failed")
    }
    }
    
    
    
    
    @IBOutlet weak var day: UILabel!
    
    
    
   
}
