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
        let url = NSURL(string: "https://gist.githubusercontent.com/maclir/f715d78b49c3b4b3b77f/raw/8854ab2fe4cbe2a5919cea97d71b714ae5a4838d/items.json")
        
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
                    print("error serializing JSON: \(error)")
                }
            }
            else
            {
                processFailure()
            }
        })
        

    }
}
