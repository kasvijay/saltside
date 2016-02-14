//
//  DataDownloader.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/13/16.
//
//

import UIKit

class DataDownloader: NSObject {

    class func getListing(processSuccess: ([ListModel]) -> Void, processFailure: () -> Void) -> Void
    {
        let url = NSURL(string: Constants.URLConstants.listingURL)
        
        let urlRequest = NSURLRequest(URL: url!)
        
        CommunicationUtil.sendRequest(urlRequest, completionHandler: { (status, response, json, error) -> Void in
            
            if (status == true)
            {
                do
                {
                    let jsonDict = try NSJSONSerialization.JSONObjectWithData(json!, options: .AllowFragments) as! NSArray
                    print(jsonDict)
                    processSuccess(ListParser.parseJsonDict(jsonDict))
                }
                catch {
                    print("Error in serializing JSON: \(error)")
                }
            }
            else
            {
                processFailure()
            }
        })
        

    }
}
