//
//  Setting_TVC.swift
//  Profile
//
//  Created by kidnapper on 14/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit
import UserNotifications

enum NotificationSettingType {
    case All, NewArticle, Event, System
}

class Setting_TVC: UIViewController, UITableViewDelegate, UITableViewDataSource, SetteingCellDelegate {

//    private let notificationCellId = "notification"
    private let headerViewId = "settingHeader"
    private let basicCellId = "settingBasic"
    private let contentCellId = "settingContent"
    private let changePasswordCellId = "settingChangePassword"
    private var allNotification = true

    
    let headerArray = ["通知設定", "密碼設定"]
    let contentArray = ["接收通知", "", "新文章上架通知", "學術活動通知", "公告通知"]
    
    
    @IBOutlet var settingReminderView: UIView!
    @IBOutlet var settingTableView: UITableView!
    
    @IBOutlet var topEqualBottom: NSLayoutConstraint!
    
    @IBOutlet var toTop: NSLayoutConstraint!
    
    @IBOutlet var heightOfNotificationView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        navigationItem.title = "Setting"
        navigationController?.navigationBar.isTranslucent = false
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.estimatedRowHeight = 0
        settingTableView.rowHeight = UITableViewAutomaticDimension
        settingTableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//        self.settingTableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        
        checkSystemSetting()
        
        let headerViewNib = UINib(nibName: "SettingHeaderView", bundle: nil)
        settingTableView.register(headerViewNib, forHeaderFooterViewReuseIdentifier: headerViewId)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkSystemSetting()
    }
    
    func checkSystemSetting() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            DispatchQueue.main.async {
                if error != nil{
                    print("error = \(String(describing: error))")
                }else{
                    if granted{
                        self.settingReminderView.isHidden = true
                        self.heightOfNotificationView.isActive = false
                        self.topEqualBottom.isActive = false
                        self.toTop.isActive = true
//                        self.settingTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
                    }
                    else{
                        self.settingReminderView.isHidden = false
                        self.toTop.isActive = false
                        self.topEqualBottom.isActive = true
                        self.heightOfNotificationView.isActive = true
                    }
                }
            }
        }
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return headerArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            // 1 for spaceCell
            return contentArray.count
        }
        else{
            return 1
        }
    }
    
    // MARK: switch button logic
    func switchChange(_ sender: UISwitch){
        if sender.tag == 0{
            if !sender.isOn{
                
            }
        }
        else{
            
        }
    }
    
    func switchBtnLogic(notification: Notification){
        
    }
    
    // MARK: header delegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerViewId) as! SettingHeaderView
        headerView.headerLabel.text = headerArray[section]
//        headerView.backgroundView?.backgroundColor = UIColor.black
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 23
    }
    
    //: tableView dataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) && (indexPath.item == 1){
            let detailNotificationCell = tableView.dequeueReusableCell(withIdentifier: basicCellId)!
            detailNotificationCell.textLabel?.text = "通知細項設定"
            detailNotificationCell.textLabel?.font = detailNotificationCell.textLabel?.font.withSize(13)
            detailNotificationCell.textLabel?.textColor = UIColor(red: 109/255, green: 109/255, blue: 114/255, alpha: 1)
            detailNotificationCell.selectionStyle = .none
            return detailNotificationCell
        }
        else if (indexPath.section == 1)
//            && (indexPath.item == 0)
        {
            let changePasswordCell = tableView.dequeueReusableCell(withIdentifier: changePasswordCellId)!
            return changePasswordCell
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: contentCellId, for: indexPath) as! SettingContent_TVCell
            cell.contentTitle.text = contentArray[indexPath.item]
            cell.contentSwitch.tag = indexPath.item
            cell.selectionStyle = .none
            cell.delegate = self
            
            if allNotification == false {
                cell.contentSwitch.isOn = false
            }
            else {
                // parse by server
                if indexPath.row == 0 {
                    cell.contentSwitch.isOn = true
                }
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) && (indexPath.item == 1) {
            return 30
        }
        else if (indexPath.section == 0) && (indexPath.item == contentArray.count) {
            return 35
        }
        else {
            return 49
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            let changePassword_TVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "passwordChange_TVC") as! PasswordChange_TVC
            navigationController?.pushViewController(changePassword_TVC, animated: true)
        }
    }
    

    func didSetSwitchValue(isOn: Bool, tag: Int) {
        if tag == 0 {
            allNotification = isOn
            settingTableView.reloadData()
        }
        else {
            if isOn == true && allNotification == false {
                allNotification = true
                settingTableView.reloadData()
            }
        }
    }

}
