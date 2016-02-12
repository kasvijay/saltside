//
//  SaltListingCustomTVCell.swift
//  SaltSideAssignment
//
//  Created by vijay Kas on 2/13/16.
//
//

import UIKit

class SaltListingCustomTVCell: UITableViewCell {

    var titleLbl = UILabel()
    var descriptionLbl = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configureCell()
    }
    
    func configureCell()
    {
        self.titleLbl = UILabel(frame: CGRectMake(15, 2, self.contentView.frame.width - 15, 25))
        self.titleLbl.textColor = UIColor.blackColor()
        self.titleLbl.font = UIFont.boldSystemFontOfSize(14)
        
        self.contentView.addSubview(self.titleLbl)
        
        self.descriptionLbl = UILabel(frame: CGRectMake (20, 27, self.contentView.frame.width - 20, 20))
        self.descriptionLbl.textColor = UIColor.lightGrayColor()
        self.descriptionLbl.font = UIFont.systemFontOfSize(12)
        
        self.contentView.addSubview(self.descriptionLbl)
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
