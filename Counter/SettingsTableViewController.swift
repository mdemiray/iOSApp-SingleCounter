//
//  SettingsTableViewController.swift
//  
//
//  Created by Muharrem Demiray on 2017-02-28.
//
//

import UIKit

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ShouldBeClosed == true
        {
            performSegue(withIdentifier: "BackToCounterSegue2", sender: nil)
        }
        
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.navigationBar.backgroundColor = userSettings.BackgroundColor

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        //super.viewDidLoad()
        updateCurrentVIEW()
        
        textFieldCounterValueOutlet.keyboardType = .numberPad
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ShouldBeClosed == true
        {
            performSegue(withIdentifier: "BackToCounterSegue2", sender: nil)
        }
        
    }
    
//    override func willMove(toParentViewController parent: UIViewController?) {
//        
//        let destinationViewController = parent as? CounterViewController
//        //
//        // if user did not change the Counter value, then do not change it.
//        if self.userSettings.Counter != 0
//        {
//            destinationViewController?.counter.counterGetSet = self.userSettings.Counter
//        }
//        
//        destinationViewController?.counter.ResetValue = self.userSettings.ResetValue
//        destinationViewController?.counter.IncDecStepSize = self.userSettings.StepSize
//        destinationViewController?.counter.UpperLimit = self.userSettings.UpperLimit
//        
//        
//        // Interchange the locations of the buttons
//        //            destinationViewController?.PositionOfIncButtonToTheRight = CGFloat( 206)
//        //            destinationViewController?.PositionOfIncButtonToTheLeft = CGFloat( 42)
//        
//        
//        destinationViewController?.UserLeftHanded = self.userSettings.UserLeftHanded
//        destinationViewController?.IncDecButtonConfig = self.userSettings.incDecButtonConfigGetSet
//        destinationViewController?.Name = self.userSettings.Name
//        destinationViewController?.VibrationOnOff = self.userSettings.VibrationOnOff
//        destinationViewController?.BackgroundColor = self.userSettings.BackgroundColor
//        destinationViewController?.SoundOnOff = self.SoundOnOff
//    }
    
    
//    override func didMove(toParentViewController parent: UIViewController?) {
//        
//        //let destinationViewController = segue.destination as? CounterViewController
//        
//        let destinationViewController = parent as? CounterViewController
//        //
//        // if user did not change the Counter value, then do not change it.
//        if self.userSettings.Counter != 0
//        {
//            destinationViewController?.counter.counterGetSet = self.userSettings.Counter
//        }
//        
//        destinationViewController?.counter.ResetValue = self.userSettings.ResetValue
//        destinationViewController?.counter.IncDecStepSize = self.userSettings.StepSize
//        destinationViewController?.counter.UpperLimit = self.userSettings.UpperLimit
//        
//        
//        // Interchange the locations of the buttons
//        //            destinationViewController?.PositionOfIncButtonToTheRight = CGFloat( 206)
//        //            destinationViewController?.PositionOfIncButtonToTheLeft = CGFloat( 42)
//        
//        
//        destinationViewController?.UserLeftHanded = self.userSettings.UserLeftHanded
//        destinationViewController?.IncDecButtonConfig = self.userSettings.incDecButtonConfigGetSet
//        destinationViewController?.Name = self.userSettings.Name
//        destinationViewController?.VibrationOnOff = self.userSettings.VibrationOnOff
//        destinationViewController?.BackgroundColor = self.userSettings.BackgroundColor
//        destinationViewController?.SoundOnOff = self.SoundOnOff
//    }
    
    
    private func updateCurrentVIEW()
    {
        //self.navigationController?.isToolbarHidden = false
        //self.navigationController?.navigationBar.isHidden = false
        
        self.textFieldCounterNameOutlet.text = userSettings.Name
        self.textFieldCounterValueOutlet.text = String(userSettings.Counter)
        self.textFieldStepSizeOutlet.text = String(userSettings.StepSize)
        self.textFieldResetValueOutlet.text = String(userSettings.ResetValue)
        self.textFieldUpperLimitOutlet.text = String(userSettings.UpperLimit)
        //dynamicButtonSettingsOutlet.setStyle(DynamicButtonStyle.circleClose, animated: true)
        backgroundColorButtonOutlet.backgroundColor = self.BackgroundColor
        
        
        if userSettings.VibrationOnOff == true
        {
            self.vibrationOnOffOutlet.setOn(false, animated: true)
        }
        else
        {
            self.vibrationOnOffOutlet.setOn(true, animated: true)
        }
        
        
        // TODO:  Update new views
        
        if userSettings.UserLeftHanded
        {
            self.leftHandedSwitchOutlet.setOn(true, animated: true)
            
        }
        else
        {
            self.leftHandedSwitchOutlet.setOn(false, animated: true)
            
        }
        
        
        if userSettings.SoundOnOff
        {
            self.soundsOnOffSwitchOutlet.setOn(false, animated: true)
        }
        else
        {
            self.soundsOnOffSwitchOutlet.setOn(true, animated: true)
        }
        
        
        if userSettings.incDecButtonConfigGetSet == 2
        {
            //            self.counterConfigSegmentOutlet.setEnabled(false, forSegmentAt: 0)
            //            self.counterConfigSegmentOutlet.setEnabled(true, forSegmentAt: 1)
            //            self.counterConfigSegmentOutlet.setEnabled(false, forSegmentAt: 2)
            
            self.counterConfigSegmentOutlet.selectedSegmentIndex = 1
        }
        else if userSettings.incDecButtonConfigGetSet == 1
        {
            
            
            self.counterConfigSegmentOutlet.selectedSegmentIndex = 0
        }
        else if userSettings.incDecButtonConfigGetSet == 3
        {
            self.counterConfigSegmentOutlet.selectedSegmentIndex = 2
        }
        
        
        
    }


   private var shouldBeClosed = false
    
    public var ShouldBeClosed: Bool{
        get{return shouldBeClosed}
        set{shouldBeClosed = newValue}
    }
    
    
   
    var ResetValue: Int{
        get{return userSettings.ResetValue}
        set{userSettings.ResetValue = newValue
        
        }
    }
    
    var StepSize: Int{
        get{ return userSettings.StepSize }
        set{userSettings.StepSize = newValue}
    }
    
    var Counter: Int{
        get{ return userSettings.Counter}
        set{userSettings.Counter = newValue}
    }
    
    
    var UpperLimit: Int{
        get{return userSettings.UpperLimit}
        set{ userSettings.UpperLimit = newValue}
    }
    
    
    var UserLeftHanded: Bool {
        get{return userSettings.UserLeftHanded}
        set{userSettings.UserLeftHanded = newValue}
    }
    
    var IncDecButtonConfig: Int {
        get{return userSettings.incDecButtonConfigGetSet}
        set{userSettings.incDecButtonConfigGetSet = newValue}
    }
    
    var Name: String{
        get{return userSettings.Name}
        set{userSettings.Name = newValue}
    }
    
    var VibrationOnOff: Bool {
        get{return userSettings.VibrationOnOff}
        set{ userSettings.VibrationOnOff = newValue}
    }
    
    var BackgroundColor: UIColor{
        get{return userSettings.BackgroundColor}
        set{userSettings.BackgroundColor = newValue}
    }
    
    var SoundOnOff: Bool {
        get{return userSettings.SoundOnOff}
        set{userSettings.SoundOnOff = newValue}
    }
    
    // MARK: MODEL
    var userSettings = UserSettings()
    
    
    
    @IBOutlet weak var textFieldCounterNameOutlet: UITextField!
    
    
    @IBOutlet weak var textFieldCounterValueOutlet: UITextField!
    
    
    
    @IBOutlet weak var textFieldStepSizeOutlet: UITextField!
    
    
    @IBOutlet weak var textFieldResetValueOutlet: UITextField!
    
    @IBOutlet weak var textFieldUpperLimitOutlet: UITextField!
    
    
    @IBAction func textFieldCounterNameAction(_ sender: UITextField) {
        
        if let inputText = sender.text
        {
            self.userSettings.Name = inputText
        }
    }
    
    @IBAction func textFieldResetValueAction(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.ResetValue = inputText
        }
    }
    
    
    
    @IBAction func textFieldStepSizeAction(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.StepSize = inputText
        }
    }
    
    
    @IBAction func textFieldUpperLimitaction(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.UpperLimit = inputText
        }
    }
    
    
    @IBAction func textFieldCounterAction(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.Counter = inputText
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func soundsOnOffSwitchAction(_ sender: UISwitch) {
        
        if sender.isOn
        {
            self.SoundOnOff = false
        }
        else
        {
            self.SoundOnOff = true
        }
    }
    
    
    
    @IBAction func vibrationOnOffSwitchAction(_ sender: UISwitch) {
        
        if sender.isOn
        {
            self.VibrationOnOff = false
        }
        else
        {
            self.VibrationOnOff = true
        }
    }
    
    
    
    @IBAction func leftHandedSwitchAction(_ sender: UISwitch) {
        
        if    sender.isOn
        {
            UserLeftHanded = true
        }
        else
        {
            UserLeftHanded = false
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func counterConfigSegmentAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0: userSettings.incDecButtonConfigGetSet = 1
        case 1: userSettings.incDecButtonConfigGetSet = 2
        case 2: userSettings.incDecButtonConfigGetSet = 3
        default: break
        }
        
    }
    
    
    @IBOutlet weak var vibrationOnOffOutlet: UISwitch!
    
    
    @IBOutlet weak var soundsOnOffSwitchOutlet: UISwitch!
    
    
    @IBOutlet weak var leftHandedSwitchOutlet: UISwitch!
    
    
    @IBOutlet weak var counterConfigSegmentOutlet: UISegmentedControl!
    
    
    @IBOutlet weak var backgroundColorButtonOutlet: UIButton!
    
    @IBAction func supportPageButton(_ sender: UIButton) {
        
        //UIApplication.sharedApplication.openURL(NSURL(string: "http://www.google.com"))
        //UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
        
        if let url = NSURL(string: "http://muharremdemiray.blogspot.com")
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
    @IBAction func rateButton(_ sender: UIButton) {
        // find and copy here iTunes URL of your own app.
        if let url = NSURL(string: "https://appsto.re/ca/YtJHC.i")
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func feedbackBUtton(_ sender: UIButton) {
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "BackToCounterSegue2"
        {
            
            let destinationViewController = segue.destination as? CounterViewController
            
            if destinationViewController != nil
            {
                //
                // if user did not change the Counter value, then do not change it.
                if self.userSettings.Counter != 0
                {
                    CounterManager.sharedManager.counter.counterGetSet = self.userSettings.Counter
                }
                
                destinationViewController?.ResetValue = self.userSettings.ResetValue
                destinationViewController?.StepSize = self.userSettings.StepSize
                destinationViewController?.UpperLimit = self.userSettings.UpperLimit
                
                
                // Interchange the locations of the buttons
                //            destinationViewController?.PositionOfIncButtonToTheRight = CGFloat( 206)
                //            destinationViewController?.PositionOfIncButtonToTheLeft = CGFloat( 42)
                
                
                destinationViewController?.UserLeftHanded = self.userSettings.UserLeftHanded
                destinationViewController?.IncDecButtonConfig = self.userSettings.incDecButtonConfigGetSet
                destinationViewController?.Name = self.userSettings.Name
                destinationViewController?.VibrationOnOff = self.userSettings.VibrationOnOff
                destinationViewController?.BackgroundColor = self.userSettings.BackgroundColor
                destinationViewController?.SoundOnOff = self.SoundOnOff

                
            }
            
            
        }
        else if segue.identifier == "SetBackgroundColorSegue"
            
        {
            if let destination = segue.destination as? BackgroundColorViewController
            {
                destination.Color = self.userSettings.BackgroundColor
                
                //send other settings to the other MVC so that we can load it back
                destination.Name = self.Name
                destination.Counter = self.Counter
                destination.StepSize = self.StepSize
                destination.ResetValue = self.ResetValue
                destination.UpperLimit = self.UpperLimit
                destination.UserLeftHanded = self.UserLeftHanded
                destination.SoundOnOff = self.SoundOnOff
                destination.VibrationOnOff = self.VibrationOnOff
                destination.incDecButtonConfigGetSet = self.IncDecButtonConfig
                
            }
            
            
        }

    }
    

}
