//
//  CounterManager.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-03-15.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import Foundation
import UIKit

class CounterManager
{
    static let sharedManager = CounterManager()
    
    init()
    {
        unarchiveCounter()
    }
    
    // MODEL
//    var counter = Counter(name: "Counter Name",
//                          value: 0,
//                          stepSize: 1,
//                          resetValue: 0,
//                          upperLimit: 9999,
//                          userLeftHanded: false,
//                          buttonConfig: UserSettings.IncDecButtonConfigEnum.bothIncAndDecButton,
//                          vibrationOff: true,
//                          backgroundColor: UIColor("#56789A"),
//                          soundOff: false)
    var counter = Counter()
    
    let fileName = "ArchievedCounterValues"
    
    func archieveCounter()
    {
        let dirPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] as String
        let pathArray = [dirPath, fileName]
        let fileURL =  NSURL.fileURL(withPathComponents: pathArray)!
        
        NSKeyedArchiver.archiveRootObject(counter, toFile: fileURL.path)
    }
    
    
    
    func unarchiveCounter()
    {
        let dirPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] as String
        let pathArray = [dirPath, fileName]
        let fileURL =  NSURL.fileURL(withPathComponents: pathArray)!
        
        let path = fileURL.path
        let unarchievedCounter = NSKeyedUnarchiver.unarchiveObject(withFile: path)
        
        if unarchievedCounter != nil
        {
            self.counter = unarchievedCounter as! Counter
        }
    }
    
}
