//
//  ListParser.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/13/16.
//
//

import UIKit

class ListParser: NSObject {

    class func parseJsonDict(jsonDict : NSArray) -> Array<ListModel>
    {
        var listObjArr = Array<ListModel>()
        
        for (var i=0; i < jsonDict.count; i++)
        {
            if let tempListObj = jsonDict.objectAtIndex(i) as? NSDictionary
            {
                let listObj = ListModel()
                listObj.image = (tempListObj["image"] != nil) ? tempListObj["image"] as! String : ""
                listObj.desc = (tempListObj["description"] != nil) ? tempListObj["description"] as! String : ""
                listObj.title = (tempListObj["title"] != nil) ? tempListObj["title"] as! String : ""
                
                listObjArr.append(listObj)
            }
        }
        
        return listObjArr
    }
    
}
