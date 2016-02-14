//
//  CommonUtil.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/12/16.
//
//

import UIKit

func print(items: Any..., separator: String = " ", terminator: String = "\n") {
    Swift.print(items[0], separator:separator, terminator: terminator)
}

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
    
    class func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        if(image.size.height > image.size.width)
        {
            let newHeight = Constants.DimentionConstants.kDeviceHeight/2 - 44
            let scale = newHeight / image.size.height
            let newWidth = image.size.width * scale
            UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
            image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage
        }
        else
        {
            let scale = newWidth / image.size.width
            let newHeight = image.size.height * scale
            UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
            image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage
        }
    }
}
