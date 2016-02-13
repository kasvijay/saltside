//
//  SaltDetailsVC.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/13/16.
//
//

import UIKit

class SaltDetailsVC: UIViewController {

    var detailsDict : ListModel?
    
    var baseView = UIView()
    var imageHoldingView = UIView()
    var imageView = UIImageView()
    var descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
    }

    //MARK : -
    //MARK : View configuration methods
    
    func configureView()
    {
        self.addBaseView()
        self.addImageHoldingView()
        self.addDescriptionView()
    }
    
    func addBaseView()
    {
        self.baseView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(baseView)
        self.baseView.backgroundColor = UIColor.whiteColor()
        
        let viewsDict = ["baseView" : baseView]
        let baseView_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[baseView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let baseView_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[baseView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(baseView_constraint_H)
        self.view.addConstraints(baseView_constraint_V)
    }
    
    func addImageHoldingView()
    {
        self.imageHoldingView.translatesAutoresizingMaskIntoConstraints = false
        self.imageHoldingView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        self.baseView.addSubview(self.imageHoldingView)
        
        self.baseView.layoutIfNeeded()
        let imgHoldingViewHeight = self.baseView.frame.size.height / 2
        let imageHoldingViewDict = ["imageHoldingView" : imageHoldingView]
        let imgHoldingView_constraing_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[imageHoldingView]-0-|", options: [], metrics: nil, views: imageHoldingViewDict)
        let imgHoldingView_constraing_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-64-[imageHoldingView(\(imgHoldingViewHeight))]", options: [], metrics: nil, views: imageHoldingViewDict)
        
        self.baseView.addConstraints(imgHoldingView_constraing_H)
        self.baseView.addConstraints(imgHoldingView_constraing_V)
        
        self.addImageToImageHoldingView()
    }
    
    func addImageToImageHoldingView()
    {
        let imageId = (self.detailsDict!.image as NSString).lastPathComponent as String
        self.imageView.downloadFrom(link: self.detailsDict!.image, imgId: imageId, contentMode: .ScaleAspectFit)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageHoldingView.addSubview(self.imageView)
        
        self.imageHoldingView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: imageHoldingView, attribute: .CenterX, multiplier: 1, constant: 0))
        self.imageHoldingView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: imageHoldingView, attribute: .CenterY, multiplier: 1, constant: 0))
        self.imageView.image?.size.width
    }
    
    func addDescriptionView()
    {
        self.descriptionLabel = UILabel()
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.descriptionLabel.font = UIFont.systemFontOfSize(12)
        self.descriptionLabel.text = "Description :\n\(self.detailsDict!.desc)"
        self.descriptionLabel.sizeToFit()
        
        self.baseView.addSubview(self.descriptionLabel)
        
        let viewsDict = ["imageHoldingView" : imageHoldingView, "descriptionLabel" : descriptionLabel]
        let descLabel_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-5-[descriptionLabel]-5-|", options: [], metrics: nil, views: viewsDict)
        let descLabel_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:[imageHoldingView]-5-[descriptionLabel]-5-|", options: [], metrics: nil, views: viewsDict)
        
        self.baseView.addConstraints(descLabel_constraint_H)
        self.baseView.addConstraints(descLabel_constraint_V)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
