//
//  NSCache+SharedInstanse.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/13/16.
//
//

import Foundation

extension NSCache {
    class var sharedInstance : NSCache {
        struct Static {
            static let instance : NSCache = NSCache()
        }
        return Static.instance
    }
}