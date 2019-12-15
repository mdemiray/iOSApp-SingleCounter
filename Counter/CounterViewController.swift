//
//  ViewController.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-02-06.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import AudioToolbox
import DynamicButton
import GoogleMobileAds


func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}


class CounterViewController: UIViewController {
    
    
    //var sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "C", ofType: "m4a")!)
    //var audioPlayer = AVAudioPlayer()
    
    //private var isUserLeftHanded = false
    
    // restored variables
    
    var restoredCounterName = ""//ok
    var restoredCounterValue = 0//ok
    var restoredStepSize = 0// ok
    var restoredResetValue = 0//ok
    var restoredUpperLimit = 0//ok
    var restoredUserLeftHanded = false//ok
    var restoredIncDecButtonConfig = UserSettings.IncDecButtonConfigEnum.onlyDecButton//ok
    var restoredVibrationOnOff = false//ok
    var restoredBackgroundColor = UIColor.blue//ok
    var restoredSoundOnOff = false//ok
    

    
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    public var CounterValue: Int{
        get{return CounterManager.sharedManager.counter.counterGetSet}
        set{CounterManager.sharedManager.counter.counterGetSet = newValue}
    }
    
    public var StepSize: Int{
        get{return CounterManager.sharedManager.counter.IncDecStepSize}
        set{CounterManager.sharedManager.counter.IncDecStepSize = newValue}
    }
    
    public var ResetValue: Int {
        get{return CounterManager.sharedManager.counter.ResetValue}
        set{CounterManager.sharedManager.counter.ResetValue = newValue}
    }
    
    public var UpperLimit: Int{
        get{return CounterManager.sharedManager.counter.UpperLimit}
        set{ CounterManager.sharedManager.counter.UpperLimit = newValue}
    }
    
    
    
    public var SoundOnOff: Bool {
        get{return CounterManager.sharedManager.counter.SoundOnOff}
        set{CounterManager.sharedManager.counter.SoundOnOff = newValue}
    }
    
    public var UserLeftHanded: Bool {
        get{ return CounterManager.sharedManager.counter.UserLeftHanded}
        set{CounterManager.sharedManager.counter.UserLeftHanded = newValue}
    }
    
    
    public var IncDecButtonConfig: Int {
        get{return CounterManager.sharedManager.counter.IncDecButtonConfig}
        set{CounterManager.sharedManager.counter.IncDecButtonConfig = newValue }
    }
    
    public var Name: String{
        get{return CounterManager.sharedManager.counter.Name}
        set{CounterManager.sharedManager.counter.Name = newValue}
    }
    
    
    public var VibrationOnOff: Bool {
        get{return CounterManager.sharedManager.counter.VibrationOnOff}
        set{CounterManager.sharedManager.counter.VibrationOnOff = newValue}
    }
    
    
    public var BackgroundColor: UIColor{
        get{return CounterManager.sharedManager.counter.BackgroundColor}
        set{CounterManager.sharedManager.counter.BackgroundColor = newValue}
    }

    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = CounterManager.sharedManager.counter.BackgroundColor
        //self.navigationController?.navigationBar.backgroundColor = UIColor.red //counter.BackgroundColor
        //self.navigationController?.navigationBar.isOpaque = true
        self.navigationController?.navigationBar.barTintColor = CounterManager.sharedManager.counter.BackgroundColor
        
      
        
        updateVIEW()
        createDynamicButtons()
        
        
        
        createIncButton()
        createDecButton()
        createResetButton()
        
        addMobStuff()
        
        
    }
    
    
    
//    override func encodeRestorableState(with coder: NSCoder) {
//        
//        
//        
//        // Encode 10 property of Counter
//        //coder.encode(restoredCounterName, forKey: "CounterName")
//        
////        coder.encode(counter.counterGetSet, forKey: "CounterValue")
////        coder.encode(counter.IncDecStepSize, forKey: "StepSize")
////        coder.encode(counter.ResetValue, forKey: "ResetValue")
////        coder.encode(counter.UpperLimit, forKey: "UpperLimit")
////        coder.encode(counter.UserLeftHanded, forKey: "UserLeftHanded")
////        coder.encode(counter.IncDecButtonConfig, forKey: "IncDecButtonConfig")
////        coder.encode(counter.VibrationOnOff, forKey: "VibrationOnOff")
////        coder.encode(counter.BackgroundColor, forKey: "BackgroundColor")
////        coder.encode(counter.SoundOnOff, forKey: "SoundOnOff")
//        
////        
//        super.encodeRestorableState(with: coder)
//        
//       
//        
//        
//    }
//    
//    
//    override func decodeRestorableState(with coder: NSCoder) {
//        
//        
//        // Decode 10 property of counter
//        //restoredCounterName = coder.decodeObject(forKey: "CounterName") as! String
////        restoredCounterValue = Int(coder.decodeCInt(forKey: "CounterValue"))
////        restoredStepSize = Int(coder.decodeCInt(forKey: "StepSize"))
////        restoredResetValue = Int(coder.decodeCInt(forKey: "ResetValue"))
////        restoredUpperLimit = Int(coder.decodeCInt(forKey: "UpperLimit"))
////        restoredUserLeftHanded = coder.decodeBool(forKey: "UserLeftHanded")
////        restoredIncDecButtonConfig = coder.decodeObject(forKey: "IncDecButtonConfig") as! UserSettings.IncDecButtonConfigEnum
////        restoredVibrationOnOff = coder.decodeBool(forKey: "VibrationOnOff")
////        restoredBackgroundColor = coder.decodeObject(forKey: "BackgroundColor") as! UIColor
////        restoredSoundOnOff = coder.decodeBool(forKey: "SoundOnOff")
//        
//        super.decodeRestorableState(with: coder)
//        
//
//        
//    }
//    
//    
//    override func applicationFinishedRestoringState() {
//        
//        counter.Name = restoredCounterName
////        counter.counterGetSet = restoredCounterValue
////        counter.IncDecStepSize = restoredStepSize
////        counter.ResetValue = restoredResetValue
////        counter.UpperLimit = restoredUpperLimit
////        counter.UserLeftHanded = restoredUserLeftHanded
////        counter.IncDecButtonConfig = restoredIncDecButtonConfig
////        counter.VibrationOnOff = restoredVibrationOnOff
////        counter.BackgroundColor = restoredBackgroundColor
////        counter.SoundOnOff = restoredSoundOnOff
//        
//    }
    
    
    
    private func addMobStuff()
    {
        
        
        //print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-4099788405286074/6407375548"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        // MARK: For test purposes
//        let request: GADRequest = GADRequest()
//        request.testDevices = ["51296f8a02a18cd4264de49fde27cfb1", kGADSimulatorID]
//        bannerView.load(request)
    }
    
    private func createDynamicButtons()
    {
        
        // SETTINGS
        //dynamicButtonSettings.setStyle(DynamicButtonStyle.hamburger, animated: true)
        
        
        // INCREMENT
        //dynamicButtonIncrement.setStyle(DynamicButtonStyle.circlePlus, animated: true)
        
        
        
        // DECREMENT
        //dynamicButtonDecrement.setStyle(DynamicButtonStyle.horizontalLine, animated: true)
        
        
        // RESET
        //dynamicButtonReset.setStyle(DynamicButtonStyle.reload, animated: true)
        
        
    }
    
    private func updateVIEW()
    {
        DisplayValue = CounterManager.sharedManager.counter.counterGetSet
        counterDisplay.backgroundColor = CounterManager.sharedManager.counter.BackgroundColor
        
        
        StepSizeDisplay = CounterManager.sharedManager.counter.IncDecStepSize
        NameOfTheCounter = CounterManager.sharedManager.counter.Name
        nameOfTheCounterLabel.textColor = UIColor.white
        
       
        
        
    }
    
    
    
    @IBAction func dynamicButtonResetAction(_ sender: DynamicButton) {
        
        
        //show the alert
        let alert = UIAlertController(title: "RESET Counter", message: "Do you want to RESET?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in
            
            // Update MODEL
            CounterManager.sharedManager.counter.resetCounterToValue(resetToValue: CounterManager.sharedManager.counter.ResetValue )
            
            
            // Update VIEW
            self.DisplayValue = CounterManager.sharedManager.counter.counterGetSet
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var dynamicButtonSettings: DynamicButton!
    

    @IBOutlet weak var dynamicButtonIncrement: DynamicButton!
    
    @IBOutlet weak var dynamicButtonDecrement: DynamicButton!
    
    @IBOutlet weak var dynamicButtonReset: DynamicButton!
    
    
    
    
 
    
    var decButtonYcoordinate = 0
    var decButtonXcoordinate = 0
    var widthOfTheDecButton = 0
    var heightOfTheDecButton = 0
    
    private func createDecButton()
    {
        
        
        if CounterManager.sharedManager.counter.IncDecButtonConfig == 2 || CounterManager.sharedManager.counter.IncDecButtonConfig == 3
        {
            
            // y-coordinate of the button is always fixed
            self.decButtonYcoordinate = Int(self.view.bounds.height * (0.5 + (1/16)))
            self.decButtonXcoordinate = Int(self.view.bounds.width * 0.3) // this will later be overriden
            
            
//            if counter.IncDecButtonConfig == .onlyDecButton
//            {
//                // single button, position in the middle of the screen
//                decButtonXcoordinate = Int(self.view.bounds.width * 0.3)
//                
//            }
//            else
            
            if CounterManager.sharedManager.counter.IncDecButtonConfig == 2 ||
                CounterManager.sharedManager.counter.IncDecButtonConfig == 3
            {
                // two button config.. Lets check whether left-handed or not.
                if UserLeftHanded
                {
                    decButtonXcoordinate = Int(self.view.bounds.width * (11/16))
                }
                else
                {
                    decButtonXcoordinate = Int(self.view.bounds.width * (1/8))
                }
            }
            
             widthOfTheDecButton = Int(self.view.bounds.width * (3/16))
             heightOfTheDecButton = widthOfTheDecButton
            
            
            
            //let button = UIButton(frame: CGRect(x: decButtonXcoordinate, y: decButtonYcoordinate, width: 100, height: 100 ))
            let button = DynamicButton(frame: CGRect(x: decButtonXcoordinate,
                                                     y: decButtonYcoordinate,
                                                     width: widthOfTheDecButton ,
                                                     height: heightOfTheDecButton )
            )
//            button.backgroundColor = UIColor.black
//            button.setTitle("-", for: .highlighted )
//            button.setTitle("-", for: .normal )
//            button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: UIControlState.highlighted)
//            button.setTitleColor(UIColor.white.withAlphaComponent(1.0), for: UIControlState.normal)
//            button.titleLabel?.font = UIFont(name: "System", size: 80.0)
            
            
            button.setStyle(DynamicButtonStyle.horizontalLine, animated: true)
            button.backgroundColor = CounterManager.sharedManager.counter.BackgroundColor
            button.strokeColor = UIColor.white
            
            button.addTarget(self, action: #selector(self.buttonDecClicked), for:  UIControlEvents.touchUpInside)
            
            
            
            
            
            
            //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
            self.view.addSubview(button)
            
        }
        
        
        
        
        
    }
    
    var incButtonYcoordinate = 0
    var incButtonXcoordinate = 0
    var widthOfTheIncButton = 0
    var heightOfTheIncButton = 0
    
    private func createIncButton()
    {
        
        if CounterManager.sharedManager.counter.IncDecButtonConfig == 2 ||
            CounterManager.sharedManager.counter.IncDecButtonConfig == 1
        {
            
            // y-coordinate of the button is always fixed
            self.incButtonYcoordinate = Int(self.view.bounds.height * 0.5)
            self.incButtonXcoordinate = Int(self.view.bounds.width * 0.3)
            
            
//            if counter.IncDecButtonConfig == .onlyIncButton
//            {
//                // single button, position in the middle of the screen
//                incButtonXcoordinate = Int(self.view.bounds.width * 0.3)
//            }
//            else
            
            
            if CounterManager.sharedManager.counter.IncDecButtonConfig == 2 ||
                CounterManager.sharedManager.counter.IncDecButtonConfig == 1
            {
                // two button config.. Lets check whether left-handed or not.
                if UserLeftHanded
                {
                    incButtonXcoordinate = Int(self.view.bounds.width * (1/8))
                    
                }
                else
                {
                    incButtonXcoordinate = Int(self.view.bounds.width * (4/8))
                }
                
            }
            
            
             widthOfTheIncButton = Int(self.view.bounds.width * (3/8))
             heightOfTheIncButton = widthOfTheIncButton
            
            
            //let button = UIButton(frame: CGRect(x: incButtonXcoordinate, y: incButtonYcoordinate, width: 100, height: 100 ))
            let button = DynamicButton(frame: CGRect(x: incButtonXcoordinate,
                                                     y: incButtonYcoordinate,
                                                     width: widthOfTheIncButton,
                                                     height: heightOfTheIncButton )
            )
//            button.backgroundColor = UIColor.black
//            button.setTitle("", for: .normal)
////            button.setTitle("+", for: .normal)
//            button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: UIControlState.highlighted)
//          button.setTitleColor(UIColor.white.withAlphaComponent(1.0), for: UIControlState.normal)
//            button.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 100.0)
            
            button.setStyle(DynamicButtonStyle.circlePlus, animated: true)
            button.backgroundColor = CounterManager.sharedManager.counter.BackgroundColor
            button.strokeColor = UIColor.white
            
            
            
            button.addTarget(self, action: #selector(self.buttonIncClicked), for:  UIControlEvents.touchUpInside)
            button.isUserInteractionEnabled = true
            
            
            
            
            
            //button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
            self.view.addSubview(button)
            
        }
        
        
        
        
    }
    
    private func createResetButton()
    {
        
        // y-coordinate of the button is always fixed
        let resetButtonYcoordinate = Int(self.view.bounds.height * (0.8))
        var resetButtonXcoordinate = Int(self.view.bounds.width * 0.4)
        let widthOfTheButton = Int(self.view.bounds.width * (3/32))
        let heightOfTheButton = widthOfTheButton
        
        
        if CounterManager.sharedManager.counter.IncDecButtonConfig == 2
        {
            if UserLeftHanded {
                resetButtonXcoordinate = Int((decButtonXcoordinate - incButtonXcoordinate - widthOfTheIncButton) / 2 + (incButtonXcoordinate + widthOfTheIncButton ))
                
                
            }
            else {
                resetButtonXcoordinate = Int((incButtonXcoordinate - decButtonXcoordinate - widthOfTheDecButton) / 2 + (decButtonXcoordinate + widthOfTheDecButton ))
                
            }
            
        } else if CounterManager.sharedManager.counter.IncDecButtonConfig == 3 ||
            CounterManager.sharedManager.counter.IncDecButtonConfig == 1
        {
            // in single button configuration, draw reset button just in the middle of x-axis
            resetButtonXcoordinate = Int(self.view.bounds.width * 0.5)
            
        }
        
        
        
        
        let button = DynamicButton(frame: CGRect(x: resetButtonXcoordinate,
                                                 y: resetButtonYcoordinate ,
                                                 width: widthOfTheButton,
                                                 height: heightOfTheButton )
            )
        
        
            button.setStyle(DynamicButtonStyle.reload , animated: true)
            button.backgroundColor = CounterManager.sharedManager.counter.BackgroundColor
            button.strokeColor = UIColor.white
            
            
            
            button.addTarget(self, action: #selector(self.buttonResetClicked), for:  UIControlEvents.touchUpInside)
            button.isUserInteractionEnabled = true
            
            self.view.addSubview(button)
    }
    
    @objc private func buttonResetClicked()
    {
        //show the alert
        let alert = UIAlertController(title: "RESET Counter", message: "Do you want to RESET?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in
            
            // Update MODEL
            CounterManager.sharedManager.counter.resetCounterToValue(resetToValue: CounterManager.sharedManager.counter.ResetValue )
            
            
            // Update VIEW
            self.DisplayValue = CounterManager.sharedManager.counter.counterGetSet
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
   
    @objc private func buttonDecClicked()
    {
        if CounterManager.sharedManager.counter.counterGetSet >= CounterManager.sharedManager.counter.IncDecStepSize
        {
            // Update MODEL
            CounterManager.sharedManager.counter.decrementCounter()
            
            //Update VIEW.. give the current value of the counter model to the display
            DisplayValue = CounterManager.sharedManager.counter.counterGetSet
            
            if CounterManager.sharedManager.counter.VibrationOnOff == false
            {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                
            }
            
            if CounterManager.sharedManager.counter.SoundOnOff == false
            {
                // 1104 iyi.
                AudioServicesPlaySystemSound(1104)
                
            }
            
            
            
            
        }
            
        else
        {
            // BEEP sound
            
            if CounterManager.sharedManager.counter.SoundOnOff == false
            {
                //1200 kotu,
                AudioServicesPlaySystemSound(1112)
                
            }
            
            
            // vibration
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            //show the alert
            let alert = UIAlertController(title: "Lower Limit Reached!", message: "You've reached the Lower Limit!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }

        
    }
    
    @objc private func buttonIncClicked()
    {
        if CounterManager.sharedManager.counter.counterGetSet <= CounterManager.sharedManager.counter.UpperLimit - CounterManager.sharedManager.counter.IncDecStepSize
        {
            // Update MODEL
            CounterManager.sharedManager.counter.incrementCounter()
            
            //Update VIEW.. give the current value of the counter model to the display
            DisplayValue = CounterManager.sharedManager.counter.counterGetSet
            
            //audioPlayer.play()
            
            
            if CounterManager.sharedManager.counter.VibrationOnOff == false
            {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                
            }
            
            if CounterManager.sharedManager.counter.SoundOnOff == false
            {
                AudioServicesPlaySystemSound(1105)
                
            }
            
           
            
            
        }
        else
        {
            // BEEP sound
            
            if CounterManager.sharedManager.counter.SoundOnOff == false
            {
                // 1112 is OK
                AudioServicesPlaySystemSound(1112)
                
            }
            
            
            //show the alert
            let alert = UIAlertController(title: "Upper Limit Reached!", message: "You've reached the Upper Limit!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

        
    }
    
    
    
    
    
    
    // MODEL
    //public var counter = Counter()
    
    
    @IBOutlet weak var nameOfTheCounterLabel: UILabel!
    
    private var NameOfTheCounter: String {
        get{ return nameOfTheCounterLabel.text! }
        set{nameOfTheCounterLabel.text = newValue}
    }
    
    
    @IBOutlet weak var counterDisplay: UILabel!
    
    private var  DisplayValue: Int
        {
        
        get
        {
            return Int(counterDisplay.text!)!
        }
        
        set{
            
            counterDisplay.text = String(newValue)
            
            
        }
    }
    
    
    
    @IBOutlet weak var stepSizeDisplay: UILabel!
    
    private var StepSizeDisplay: Int{
        
        get{
            return Int(stepSizeDisplay.text!)!
        }
        
        set{
            var stringValue = String(newValue)
            stringValue = "+".appending(stringValue)
            stepSizeDisplay.text = stringValue
        }
    }
    
    
    
    
    
//    @IBAction func buttonIncrement(_ sender: UIButton)
//    {
//        
//    
//        
//        
//        
//        if counter.counterGetSet <= counter.UpperLimit - counter.IncDecStepSize
//        {
//            // Update MODEL
//            counter.incrementCounter()
//            
//            //Update VIEW.. give the current value of the counter model to the display
//            DisplayValue = counter.counterGetSet
//            
//            //audioPlayer.play()
//        
//        }
//        else
//        {
//            // TODO: BEEP sound 
//            
//            //show the alert
//            let alert = UIAlertController(title: "Upper Limit Reached!", message: "You've reached the Upper Limit!", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//        
//    }
//
//    
//    @IBAction func buttonDecrement(_ sender: UIButton)
//    {
//        if counter.counterGetSet >= counter.IncDecStepSize
//        {
//            // Update MODEL
//            counter.decrementCounter()
//            
//            //Update VIEW.. give the current value of the counter model to the display
//            DisplayValue = counter.counterGetSet
//            
//        
//        
//        }
//            
//        else
//        {
//            // TODO: BEEP sound
//            
//            //show the alert
//            let alert = UIAlertController(title: "Lower Limit Reached!", message: "You've reached the Lower Limit!", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//            
//        }
//        
//    }
    
    
    
    
    
    @IBAction func buttonReset(_ sender: UIButton) {
        
        
        
        //show the alert
        let alert = UIAlertController(title: "RESET Counter", message: "Do you want to RESET?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in
        
            // Update MODEL
            CounterManager.sharedManager.counter.resetCounterToValue(resetToValue: CounterManager.sharedManager.counter.ResetValue )
            
            
            // Update VIEW
            self.DisplayValue = CounterManager.sharedManager.counter.counterGetSet
        
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
        

    }
    
    
    
    @IBOutlet weak var incButtonLeftMargin: NSLayoutConstraint!
    
    
    @IBOutlet weak var incButtonRightMargin: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var decButtonLeftMargin: NSLayoutConstraint!
    
    
    @IBOutlet weak var decButtonRightMargin: NSLayoutConstraint!
    
    
    //var positionOfIncButtonToRight = 0
    
    
    
    
    var positionOfIncButtonToRight: CGFloat = 0.0// = CGFloat(0)
    var positionOfIncButtonToLeft: CGFloat = 0.0//= CGFloat(0)
    var positionOfDecButtonToRight: CGFloat = 0.0// = CGFloat(0)
    var positionOfDecButtonToLeft: CGFloat = 0.0//= CGFloat(0)
    
    public var PositionOfIncButtonToTheRight: CGFloat {
        
        
        get{ return positionOfIncButtonToRight}
        set{ positionOfIncButtonToRight = newValue }
        
    }
    
    
    public var PositionOfIncButtonToTheLeft: CGFloat{
        get{ return positionOfIncButtonToLeft}
        set{positionOfIncButtonToLeft = newValue}
    }
    
    
    
    public var PositionOfDecButtonToTheRight: CGFloat {
        
        get{ return positionOfDecButtonToRight }
        set{ positionOfDecButtonToRight = newValue }
        
    }
    
    
    public var PositionOfDecButtonToTheLeft: CGFloat{
        get{ return positionOfDecButtonToLeft}
        set{positionOfDecButtonToLeft = newValue}
    }
    
    
    
    
    
    @IBAction func barButtonItemSettings(_ sender: Any)
    {
        
        
    }
    
    
    @IBOutlet weak var incrementButtonOutlet: UIButton!
    
    
    @IBOutlet weak var decrementButtonOutlet: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if (segue.identifier == "UserSettingsSegue" || segue.identifier == "UserSettingsSegue2")        {
            
            let vc = segue.destination as? ContainerViewController
            let a = segue.identifier
            
            if segue.destination is UserSettingsViewController
            {
                
                
                // Pass current settings to the new controller
                let destinationViewController = segue.destination as? UserSettingsViewController
                destinationViewController?.ResetValue = CounterManager.sharedManager.counter.ResetValue
                destinationViewController?.Counter = CounterManager.sharedManager.counter.counterGetSet
                destinationViewController?.StepSize = CounterManager.sharedManager.counter.IncDecStepSize
                destinationViewController?.UpperLimit = CounterManager.sharedManager.counter.UpperLimit
                destinationViewController?.UserLeftHanded = CounterManager.sharedManager.counter.UserLeftHanded
                destinationViewController?.IncDecButtonConfig = CounterManager.sharedManager.counter.IncDecButtonConfig
                destinationViewController?.Name = CounterManager.sharedManager.counter.Name
                destinationViewController?.VibrationOnOff = CounterManager.sharedManager.counter.VibrationOnOff
                destinationViewController?.BackgroundColor = CounterManager.sharedManager.counter.BackgroundColor
                destinationViewController?.SoundOnOff = CounterManager.sharedManager.counter.SoundOnOff
            }
            else if segue.destination is SettingsTableViewController{
                // Pass current settings to the new controller
                let destinationViewController = segue.destination as? SettingsTableViewController
                destinationViewController?.ResetValue = CounterManager.sharedManager.counter.ResetValue
                destinationViewController?.Counter = CounterManager.sharedManager.counter.counterGetSet
                destinationViewController?.StepSize = CounterManager.sharedManager.counter.IncDecStepSize
                destinationViewController?.UpperLimit = CounterManager.sharedManager.counter.UpperLimit
                destinationViewController?.UserLeftHanded = CounterManager.sharedManager.counter.UserLeftHanded
                destinationViewController?.IncDecButtonConfig = CounterManager.sharedManager.counter.IncDecButtonConfig
                destinationViewController?.Name = CounterManager.sharedManager.counter.Name
                destinationViewController?.VibrationOnOff = CounterManager.sharedManager.counter.VibrationOnOff
                destinationViewController?.BackgroundColor = CounterManager.sharedManager.counter.BackgroundColor
                destinationViewController?.SoundOnOff = CounterManager.sharedManager.counter.SoundOnOff
                
            }
            else if segue.destination is ContainerViewController
            {
                
//                // Pass current settings to the new controller
//                let destinationViewController = segue.destination as? ContainerViewController
//                destinationViewController?.tempUserSettings.Name = counter.Name
//                destinationViewController?.tempUserSettings.Counter = counter.counterGetSet
//                destinationViewController?.tempUserSettings.ResetValue = counter.ResetValue
//                
//                destinationViewController?.tempUserSettings.StepSize = counter.IncDecStepSize
//                destinationViewController?.tempUserSettings.UpperLimit = counter.UpperLimit
//                destinationViewController?.tempUserSettings.UserLeftHanded = counter.UserLeftHanded
//                destinationViewController?.tempUserSettings.incDecButtonConfigGetSet = counter.IncDecButtonConfig
//                
//                destinationViewController?.tempUserSettings.VibrationOnOff = counter.VibrationOnOff
//                destinationViewController?.tempUserSettings.BackgroundColor = counter.BackgroundColor
//                destinationViewController?.tempUserSettings.SoundOnOff = counter.SoundOnOff
                
                
                  
            }
        }
        
    }
    
    
    
    


}

