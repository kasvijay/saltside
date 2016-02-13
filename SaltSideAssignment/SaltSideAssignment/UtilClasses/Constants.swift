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
    
    struct urlConstants {
        static let listingURL = ""
    }
}
