//
//  UserSettingsViewController.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-02-07.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import UIKit
import Foundation
import DynamicButton
import MessageUI
class UserSettingsViewController: UIViewController, UITextFieldDelegate, MFMailComposeViewControllerDelegate {

    
    var ResetValue: Int{
        get{return userSettings.ResetValue}
        set{userSettings.ResetValue = newValue}
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
    
    
    
    // MARK: VIEW
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCurrentVIEW()
        
        textFieldCounterValue.keyboardType = .numberPad
        //self.navigationController?.navigationBar.tintColor = userSettings.BackgroundColor
        //self.navigationController?.navigationBar.barTintColor = userSettings.BackgroundColor
        self.navigationController?.navigationBar.backgroundColor = userSettings.BackgroundColor
        //textFieldCounterValue.enablesReturnKeyAutomatically = true
    }
    
    private func updateCurrentVIEW()
    {
        self.textFieldCounterNameValue.text = userSettings.Name
        self.textFieldCounterValue.text = String(userSettings.Counter)
        self.textFieldStepSizeValue.text = String(userSettings.StepSize)
        self.textFieldResetValueValue.text = String(userSettings.ResetValue)
        self.textFieldUpperLimitValue.text = String(userSettings.UpperLimit)
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
    
    
    @IBOutlet weak var textFieldCounterNameValue: UITextField!{
        didSet{
            textFieldCounterNameValue.delegate = self
            
        }
        
    }
    
    
    @IBOutlet weak var backgroundColorButtonOutlet: UIButton!
    
    
    
    @IBOutlet weak var textFieldCounterValue: UITextField!{
        didSet{
            textFieldCounterValue.delegate = self      // hey textfield, I (as UserSettingsViewController) am your delegate. I inherit from UITextFieldDelegate
            
        }
    }
    
    
    @IBOutlet weak var textFieldStepSizeValue: UITextField!{
        didSet{
            textFieldStepSizeValue.delegate = self  // hey textfield, I (as UserSettingsViewController) am your delegate. I inherit from UITextFieldDelegate

        }
    }
    
    
    @IBOutlet weak var textFieldResetValueValue: UITextField!{
        didSet{
            textFieldResetValueValue.delegate = self   // text field in delegesini kendimiz olarak atiyoruz. Yani biz "UserSettingsViewController" sinifi olarak bu text field in delegesiyiz. bi is oldu mu ayak islerini yapariz.
        }
    }
    
    
    
    @IBOutlet weak var textFieldUpperLimitValue: UITextField!{
        didSet{
            textFieldUpperLimitValue.delegate = self
        }
    }
    
    
    func textFieldShouldReturn(_ sender: UITextField) -> Bool {
        sender.resignFirstResponder()
        
        return true
    }
    
    
    
    @IBAction func textFieldCounterName(_ sender: UITextField) {
        
        if let inputText = sender.text
        {
            self.userSettings.Name = inputText
        }
    }
    
    
    @IBAction func textFieldCounter(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.Counter = inputText
        }
    }
    
    
    @IBAction func textFieldCounterEditingDidEnd(_ sender: UITextField) {
        resignFirstResponder()
    }
    
    
    @IBAction func textFieldCounterTouchOutside(_ sender: UITextField) {
        resignFirstResponder()
    }
    
   
    
    @IBAction func textFieldResetValue(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.ResetValue = inputText
        }
    }
    
    
    
    @IBAction func textFieldStepSize(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
                {
                    self.userSettings.StepSize = inputText
                }
    }
    
    
    
    @IBAction func textFieldUpperLimit(_ sender: UITextField) {
        
        if let inputText = Int(sender.text!)
        {
            self.userSettings.UpperLimit = inputText
        }
        
        
    }
    
    
    
    
    @IBAction func leftHandedSwitch(_ sender: UISwitch) {
        
        if    sender.isOn
        {
            UserLeftHanded = true
        }
        else
        {
            UserLeftHanded = false
        }
        
            
    }
    
    
    
    @IBAction func vibrationOnOffSwitch(_ sender: UISwitch) {
        
        if sender.isOn
        {
            self.VibrationOnOff = false
        }
        else
        {
            self.VibrationOnOff = true
        }
    }
    
    
    
    @IBAction func soundsOnOffSwitch(_ sender: UISwitch) {
        
        if sender.isOn
        {
            self.SoundOnOff = false
        }
        else
        {
            self.SoundOnOff = true
        }
    }
    
    
    
    
    @IBAction func counterConfigSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0: userSettings.incDecButtonConfigGetSet = 1
        case 1: userSettings.incDecButtonConfigGetSet = 2
        case 2: userSettings.incDecButtonConfigGetSet = 3
        default: break
        }
    }
    
    
    
    @IBOutlet weak var vibrationOnOffOutlet: UISwitch!
    
    @IBOutlet weak var counterConfigSegmentOutlet: UISegmentedControl!
    
    
    @IBOutlet weak var leftHandedSwitchOutlet: UISwitch!
    
    
    @IBOutlet weak var soundsOnOffSwitchOutlet: UISwitch!
    
    
    @IBAction func supportPageButton(_ sender: UIButton) {
        //UIApplication.sharedApplication.openURL(NSURL(string: "http://www.google.com"))
        //UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
        
        if let url = NSURL(string: "http://muharremdemiray.blogspot.com/2017/03/counter-support.html")
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBOutlet weak var versionLabelOutlet: UILabel!
    
    
    
    @IBAction func feedbackButtonAction(_ sender: UIButton) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["muharrem.demiray@icloud.com"])
        mailComposerVC.setSubject("iOS Application Counter - Version: \(versionLabelOutlet.text!)")
        mailComposerVC.setMessageBody("Message body goes here...", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
 
        //show the alert
        let alert = UIAlertController(title: "Could Not Send Email",
                                      message: "Your device could not send e-mail.  Please check e-mail configuration and try again.",
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    // MARK: MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func rateButton(_ sender: UIButton) {
        
        // find and copy here iTunes URL of your own app.
        if let url = NSURL(string: "https://appsto.re/ca/gZ7Eib.i")
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "BackToCounterSegue"
        {
            
            let destinationViewController = segue.destination as? CounterViewController
            
            // 
            // if user did not change the Counter value, then do not change it.
            if self.userSettings.Counter != 0
            {
              destinationViewController?.CounterValue = self.userSettings.Counter
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
