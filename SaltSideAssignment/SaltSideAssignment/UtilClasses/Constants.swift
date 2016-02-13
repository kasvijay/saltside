//
//  Constants.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/13/16.
//
//

import UIKit

struct Constants {

    struct FilePaths
    {
        static let cachesDirPath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0] as String
        static let documentsDirPath = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true)[0] as String
        
        static let imgDirPath = Constants.FilePaths.cachesDirPath.stringByAppendingString("/images/")
    }
    
    struct URLConstants {
        static let listingURL = "https://gist.githubusercontent.com/maclir/f715d78b49c3b4b3b77f/raw/8854ab2fe4cbe2a5919cea97d71b714ae5a4838d/items.json"
    }
    
    struct DimentionConstants {
        static let kDeviceWidth = UIScreen.mainScreen().bounds.width
        static let kDeviceHeight = UIScreen.mainScreen().bounds.height
    }
}
