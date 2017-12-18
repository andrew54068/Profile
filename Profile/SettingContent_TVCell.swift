//
//  SettingContent_TVCell.swift
//  Profile
//
//  Created by kidnapper on 14/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

protocol SetteingCellDelegate {
    func didSetSwitchValue(isOn:Bool, tag:Int)
}

class SettingContent_TVCell: UITableViewCell {

    @IBOutlet var contentTitle: UILabel!
    @IBOutlet var contentSwitch: UISwitch!
    var delegate:SetteingCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didSwitch(_ sender: Any) {
        let isOn = (sender as! UISwitch).isOn
        delegate?.didSetSwitchValue(isOn:isOn, tag: contentSwitch.tag)
    }

}
