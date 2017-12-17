//
//  PasswordChangeFooterView.swift
//  Profile
//
//  Created by kidnapper on 18/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class PasswordChangeFooterView: UITableViewHeaderFooterView {

    @IBAction func forgetPassword(_ sender: Any) {
        
    }
    override func draw(_ rect: CGRect){
        // Drawing code
        let view = UIView()
        view.frame = rect
        self.backgroundView = view
        self.backgroundView?.backgroundColor = UIColor.white
    }

}
