//
//  SettingNotification_TVCell.swift
//  Profile
//
//  Created by kidnapper on 14/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class SettingNotification_TVCell: UITableViewCell {

    let btnAttributes: [String: Any] = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.white, NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
    
    @IBOutlet var notificationSwitchBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let attributedString = NSMutableAttributedString(string: "開啟通知", attributes: btnAttributes)
        notificationSwitchBtn.setAttributedTitle(attributedString, for: .normal)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
