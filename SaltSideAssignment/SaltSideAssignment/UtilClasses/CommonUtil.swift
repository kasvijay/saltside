//
//  CommonUtil.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/12/16.
//
//

import UIKit

class CommonUtil: NSObject
{
    class func appDelegate() -> AppDelegate
    {
        return (UIApplication.sharedApplication().delegate as! AppDelegate)
    }
    
    class func setNetworkActivityIndicator(shouldShow:Bool)
    {
        CommonUtil.appDelegate().setNetworkActivityIndicatorVisible(shouldShow)
    }
}
