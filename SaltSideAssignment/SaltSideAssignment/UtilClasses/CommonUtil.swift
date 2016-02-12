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
    
    class func showAlert(alertTitle:String, alertContent:String, fromViewController:UIViewController, actionTitle:String)
    {
        let alert = UIAlertController(title: alertTitle, message: alertContent, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default, handler: nil))
        fromViewController.presentViewController(alert, animated: true, completion: nil)
    }
}
