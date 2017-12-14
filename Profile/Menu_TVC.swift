//
//  Menu_TVC.swift
//  Profile
//
//  Created by kidnapper on 14/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class Menu_TVC: UITableViewController {

    let thumbnailImage = ["icon_indi_profile_default", "icon_indicate_menu_setting_black", "icon_indicate_menu_ae_black", "icon_indicate_menu_help_black"]
    let menuItemLabelText = ["Profile", "Setting", "AE Management Tool", "Help"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "MENU"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! menu_TVCell
        cell.thumbnail.image = UIImage(named: thumbnailImage[indexPath.item])
        cell.menuItemLabel.text = menuItemLabelText[indexPath.item]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 49
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let profile  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "profile_TVC")
            navigationController?.pushViewController(profile, animated: true)
            profile.navigationItem.title = "profile"
//        case 1:
            
//        case 2:
//            <#code#>
//        case 3:
//            <#code#>
        default:
            let setting = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "setting_TVC")
            navigationController?.pushViewController(setting, animated: true)
        }
    }
    
}
