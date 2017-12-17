//
//  SettingNotificationView.swift
//  Profile
//
//  Created by kidnapper on 17/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class SettingNotificationView: UIView {

    let btnAttributes: [String: Any] = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.white, NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
    
    @IBOutlet var notificationOpenBtn: UIButton!
    
    @IBAction func openSystemPage(_ sender: Any){
        UIApplication.openAppSettings()
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let attributedString = NSMutableAttributedString(string: "開啟通知", attributes: btnAttributes)
        notificationOpenBtn.setAttributedTitle(attributedString, for: .normal)
        
    }

}
