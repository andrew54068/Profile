//
//  SettingHeaderView.swift
//  Profile
//
//  Created by kidnapper on 15/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class SettingHeaderView: UITableViewHeaderFooterView {

    @IBOutlet var headerLabel: UILabel!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect){
        // Drawing code
        let view = UIView()
        view.frame = rect
        self.backgroundView = view
        self.backgroundView?.backgroundColor = UIColor.white
    }
 

}
