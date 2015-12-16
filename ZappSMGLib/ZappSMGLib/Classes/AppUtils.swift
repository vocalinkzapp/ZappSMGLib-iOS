//
//  AppUtils.swift
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/9/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

import Foundation
import UIKit

@objc public class AppUtils : NSObject {
    
    public static let zappScheme: String = "zapp://"
    
    /// Checks if there is any of the CFI apps installed on the device supports PBBA payment.
    public static var isZappCFIAppAvailable: Bool {
        
        let zappURLScheme = NSURL(string: AppUtils.zappScheme)
        let appAvailable = UIApplication.sharedApplication().canOpenURL(zappURLScheme!)
        
        return appAvailable
    }
    
    /**
     Open PBBA enabled CFI application.
     
     - parameter aptId:  used to build the app url
     - parameter aptrId: used to build the app url
     */
    public static func openZappCFIApp(aptId: String, aptrId: String) {
        
        guard aptId.isEmpty == false && aptrId.isEmpty == false else {
            return
        }
        
        guard isZappCFIAppAvailable else {
            return
        }
        
        let appURL = NSURL(string: String(format: "%@%@/%@", arguments: [AppUtils.zappScheme, aptId, aptrId]))
        UIApplication.sharedApplication().openURL(appURL!)
    }
}