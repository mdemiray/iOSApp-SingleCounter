//
//  ContainerViewController.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-03-01.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //private var tempCounter = Counter()
    
    public var tempUserSettings = UserSettings()
    
//    public var TempUserSettings: UserSettings{
//        get{return tempUserSettings}
//    }
    
    
    
    
    
    
    public var SoundOnOff: Bool {
        get{return tempUserSettings.SoundOnOff}
        set{tempUserSettings.SoundOnOff = newValue}
    }
    
    public var BackgroundColor: UIColor{
        get{return tempUserSettings.BackgroundColor}
        set{tempUserSettings.BackgroundColor = newValue}
    }
    
    public var VibrationOnOff: Bool {
        get{return tempUserSettings.VibrationOnOff}
        set{tempUserSettings.VibrationOnOff = newValue}
    }
    
    
    public var Name: String {
        get{ return tempUserSettings.Name}
        set{tempUserSettings.Name = newValue}
    }
    
    
    public var incDecButtonConfigGetSet: Int {
        get{ return tempUserSettings.incDecButtonConfigGetSet}
        set{tempUserSettings.incDecButtonConfigGetSet = newValue}
    }
    
    
    
    
    
    public var UserLeftHanded: Bool {
        get{return tempUserSettings.UserLeftHanded}
        set{tempUserSettings.UserLeftHanded = newValue}
    }
    
    
    
    
    public var UpperLimit:Int{
        get{return tempUserSettings.UpperLimit}
        set{tempUserSettings.UpperLimit = newValue}
    }
    
    public var StepSize: Int
        {
        get{return tempUserSettings.StepSize}
        set{tempUserSettings.StepSize = newValue}
    }
    
    public var Counter: Int {
        get{return tempUserSettings.Counter}
        set{tempUserSettings.Counter = newValue}
    }
    
    public var ResetValue: Int{
        get{return tempUserSettings.ResetValue}
        set{tempUserSettings.ResetValue = newValue}
    }
    


    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
     
        
        if segue.identifier == "myEmbeddedSegue"
        {
            if segue.destination is SettingsTableViewController
            {
                // Pass current settings to the new controller
                let destinationViewController = segue.destination as? SettingsTableViewController
                destinationViewController?.Name = tempUserSettings.Name
                destinationViewController?.Counter = tempUserSettings.Counter
                destinationViewController?.ResetValue = tempUserSettings.ResetValue
                
                destinationViewController?.StepSize = tempUserSettings.StepSize
                destinationViewController?.UpperLimit = tempUserSettings.UpperLimit
                destinationViewController?.UserLeftHanded = tempUserSettings.UserLeftHanded
                destinationViewController?.IncDecButtonConfig = tempUserSettings.incDecButtonConfigGetSet
                
                destinationViewController?.VibrationOnOff = tempUserSettings.VibrationOnOff
                destinationViewController?.BackgroundColor = tempUserSettings.BackgroundColor
                destinationViewController?.SoundOnOff = tempUserSettings.SoundOnOff
            }
        }
        else if segue.identifier == "ShouldBeClosedSegue"
        {
            
            if segue.destination is SettingsTableViewController
            {
                // Pass current settings to the new controller
                let destinationViewController = segue.destination as? SettingsTableViewController
                destinationViewController?.Name = tempUserSettings.Name
                destinationViewController?.Counter = tempUserSettings.Counter
                destinationViewController?.ResetValue = tempUserSettings.ResetValue
                
                destinationViewController?.StepSize = tempUserSettings.StepSize
                destinationViewController?.UpperLimit = tempUserSettings.UpperLimit
                destinationViewController?.UserLeftHanded = tempUserSettings.UserLeftHanded
                destinationViewController?.IncDecButtonConfig = tempUserSettings.incDecButtonConfigGetSet
                
                destinationViewController?.VibrationOnOff = tempUserSettings.VibrationOnOff
                destinationViewController?.BackgroundColor = tempUserSettings.BackgroundColor
                destinationViewController?.SoundOnOff = tempUserSettings.SoundOnOff
                
                
                // +++++ set shouldBEClosed to true
                destinationViewController?.ShouldBeClosed = true
            }
            
          
            
            
        }

        
        
    }
    

}
