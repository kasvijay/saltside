//
//  ViewController.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/12/16.
//
//

import UIKit

class SaltListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var baseView = UIView()
    var saltSideTV = UITableView()
    var titleImgView = UIImageView()
    var listArr : [ListModel]!
    var loadingView = UIView()
    var loadingImageView = UIImageView()
    
    //MARK : -
    //MARK : UIView Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.configureNavBar()
        self.configureView()
        self.getTableViewData()
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.titleImgView.hidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        //self.titleImgView.hidden = true
    }
    
    //MARK : -
    //MARK : NavigationBar configuration method
    func configureNavBar()
    {
        let navBarHeight : CGFloat = (self.navigationController?.navigationBar.frame.size.height)!
        let choiceHeight : CGFloat = navBarHeight * 0.85
        let titleYPos = (navBarHeight - choiceHeight)/2
        
        let navBarWidth : CGFloat = (self.navigationController?.navigationBar.frame.size.width)!
        let choiseWidth : CGFloat = navBarWidth * 0.35
        let titleXPos = (navBarWidth - choiseWidth)/2
        
        self.titleImgView = UIImageView(frame: CGRectMake(titleXPos, titleYPos, choiseWidth, choiceHeight))
        self.titleImgView.image = UIImage(named: "SaltSide_Title")
        self.titleImgView.backgroundColor = UIColor.clearColor()
        self.navigationController?.navigationBar.addSubview(self.titleImgView)
        
    }
    
    //MARK : -
    //MARK : View configuration methods
    func configureView()
    {
        self.addBaseView()
        self.addSaltTableVC()
        self.addLoadingView()
    }
    
    func addBaseView()
    {
        self.baseView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(baseView)
        
        let viewsDict = ["baseView" : baseView]
        let baseView_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[baseView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let baseView_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[baseView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(baseView_constraint_H)
        self.view.addConstraints(baseView_constraint_V)
    }
    
    func addSaltTableVC()
    {
        self.saltSideTV = UITableView(frame: CGRectZero, style: .Plain)
        self.saltSideTV.delegate = self
        self.saltSideTV.dataSource = self
        self.saltSideTV.translatesAutoresizingMaskIntoConstraints = false
        
        self.baseView.addSubview(self.saltSideTV)
        
        let viewsDict = ["adVTableView" : saltSideTV]
        let adVTableView_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[adVTableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let adVTableView_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[adVTableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.baseView.addConstraints(adVTableView_constraint_H)
        self.baseView.addConstraints(adVTableView_constraint_V)
    }
    
    func addLoadingView()
    {
        self.loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.baseView.addSubview(self.loadingView)
        
        let viewsDict = ["loadingView" : loadingView]
        let loadingView_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[loadingView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let loadingView_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[loadingView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.baseView.addConstraints(loadingView_constraint_H)
        self.baseView.addConstraints(loadingView_constraint_V)
        
        self.loadingImageView = UIImageView(image: UIImage(named: "SaltSide_Logo_200"))
        //self.loadingImageView.frame = CGRectMake(100, 200, 100, 100)
        self.loadingImageView.translatesAutoresizingMaskIntoConstraints = false
        self.loadingView.addSubview(self.loadingImageView)
        
        let imageViewDict = ["loadingImageView" : loadingImageView]
        
        let loadingImageView_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat("H:[loadingImageView(100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: imageViewDict)
        let loadingImageView_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat("V:[loadingImageView(100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: imageViewDict)
        let loadingImageView_Center_X = NSLayoutConstraint(item: loadingImageView, attribute: .CenterX, relatedBy: .Equal, toItem: loadingView, attribute: .CenterX, multiplier: 1, constant: 0)
        let loadingImageView_Center_Y = NSLayoutConstraint(item: loadingImageView, attribute: .CenterY, relatedBy: .Equal, toItem: loadingView, attribute: .CenterY, multiplier: 1, constant: 0)
        
        self.baseView.layoutIfNeeded()
        self.loadingView.addConstraints(loadingImageView_constraint_H)
        self.loadingView.addConstraints(loadingImageView_constraint_V)
        self.loadingView.addConstraint(loadingImageView_Center_X)
        self.loadingView.addConstraint(loadingImageView_Center_Y)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(5)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
        let radians = CGFloat(M_PI)
        UIView.setAnimationRepeatCount(50)
        loadingImageView.transform = CGAffineTransformMakeRotation(radians)
        UIView.commitAnimations()
    }
    
    func getTableViewData()
    {
        CommonUtil.setNetworkActivityIndicator(true)
        
        if (Reachability.isConnectedToNetwork())
        {
            let qualityOfServiceClass = QOS_CLASS_BACKGROUND
            let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
            dispatch_async(backgroundQueue, { () -> Void in
                
                DataDownloader.getListing(self.processSuccess, processFailure: self.processFailure)
            })
        }
        else
        {
            CommonUtil.showAlert("No Network!", alertContent: "Please check your internet connection", fromViewController: self, actionTitle: "Ok")
        }
    }
    
    func processSuccess (listObjects : [ListModel])
    {
        CommonUtil.setNetworkActivityIndicator(false)
        
        self.listArr = listObjects
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.loadingView.hidden = true
            self.saltSideTV.reloadData()
        }
    }
    
    func processFailure ()
    {
        CommonUtil.setNetworkActivityIndicator(false)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.loadingView.hidden = true
            CommonUtil.showAlert("Alert!", alertContent: "Error while downloading data", fromViewController: self, actionTitle: "Ok")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //MARK : -
    //MARK : UITableView delegate methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.listArr != nil)
        {
            return self.listArr.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        tableView.registerClass(SaltListingCustomTVCell.self, forCellReuseIdentifier: "cell")
        let cell : SaltListingCustomTVCell = tableView.dequeueReusableCellWithIdentifier("cell") as! SaltListingCustomTVCell
        
        var title = self.listArr[indexPath.row].title
        title.replaceRange(title.startIndex...title.startIndex, with: String(title[title.startIndex]).capitalizedString)
        
        var description = self.listArr[indexPath.row].desc
        description.replaceRange(description.startIndex...description.startIndex, with: String(description[description.startIndex]).capitalizedString)
        
        cell.titleLbl.text = title
        cell.descriptionLbl.text = description
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let saltDetailsVC = SaltDetailsVC()
        saltDetailsVC.detailsDict = self.listArr[indexPath.row]
        
        self.navigationController?.pushViewController(saltDetailsVC, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 60
    }
}

