//
//  CommunicationUtil.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/12/16.
//
//

import UIKit

class CommunicationUtil: NSObject, NSURLSessionDataDelegate {
    
    class func sendRequest(request : NSURLRequest, completionHandler:(Bool,NSURLResponse?,NSData?,NSError?)->Void)
    {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            let str = String(data: data!, encoding: NSUTF8StringEncoding)
            print(str)
            if (error == nil)
            {
                completionHandler(true, response, data, error)
            }
            
        }
        task.resume()
    }
}
