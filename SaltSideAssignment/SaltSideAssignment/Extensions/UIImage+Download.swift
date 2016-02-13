//
//  UIImage+Download.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/13/16.
//
//

import UIKit

extension UIImageView
{
    func downloadFrom(link link:String?, imgId : String, contentMode mode: UIViewContentMode)
    {
        contentMode = mode
        if link == nil
        {
            self.image = UIImage(named: "Loading_icon")
            return
        }
        if (NSCache.sharedInstance.objectForKey(imgId) != nil)
        {
            self.image = CommonUtil.resizeImage(UIImage(data: NSCache.sharedInstance.objectForKey(imgId) as! NSData)!, newWidth: (Constants.DimentionConstants.kDeviceWidth - 40))
            self.layoutSubviews()
        }
        else if (NSFileManager.defaultManager().fileExistsAtPath(self.getLocalImagePathForId(imgId)))
        {
            self.image = CommonUtil.resizeImage(UIImage(contentsOfFile: self.getLocalImagePathForId(imgId))!, newWidth: (Constants.DimentionConstants.kDeviceWidth - 40))
            NSCache.sharedInstance.setObject(NSData(contentsOfFile: self.getLocalImagePathForId(imgId))!, forKey: imgId)
            self.layoutSubviews()
        }
        else if let url = NSURL(string: link!)
        {
            let fileManager = NSFileManager.defaultManager()
            let cacheDirPath = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)[0] as String
            let imgDirPath = cacheDirPath.stringByAppendingString("/images/")
            if (!fileManager.fileExistsAtPath(imgDirPath))
            {
                do {
                    try fileManager.createDirectoryAtPath(imgDirPath, withIntermediateDirectories: true, attributes: nil)
                }
                catch let aError as NSError {
                    print("Error in createing directory: \(aError.description)")
                }
            }
            let imagePath = imgDirPath.stringByAppendingString("\(imgId).jpg")
            print("Image Path : \(imagePath)")
            
            NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (imgData, _, error) -> Void in
                guard let data = imgData where error == nil else {
                    print("\nerror on download \(error)")
                    return
                }
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    print("\ndownload completed \(url.lastPathComponent!)")
                    
                    if let getImage =  UIImage(data: data)
                    {
                        UIImageJPEGRepresentation(getImage, 100)!.writeToFile(imagePath, atomically: true)
                        NSCache.sharedInstance.setObject(data, forKey: imgId)
                        
                        self.image = CommonUtil.resizeImage(getImage, newWidth: (Constants.DimentionConstants.kDeviceWidth - 40))
                        self.layoutSubviews()
                    }
                }
            }).resume()
        }
        else
        {
            self.image = UIImage(named: "Loading_icon")
        }
    }
    
    func getLocalImagePathForId(imageId : String) -> String
    {
        return Constants.FilePaths.imgDirPath.stringByAppendingString("\(imageId).jpg")
    }
}
