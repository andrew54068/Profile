//
//  Setting_TVC.swift
//  Profile
//
//  Created by kidnapper on 14/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class Setting_TVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    private let notificationCellId = "notification"
    private let headerViewId = "settingHeader"
    private let basicCellId = "settingBasic"
    private let contentCellId = "settingContent"
    private let changePasswordCellId = "settingChangePassword"
    
    
    
    let headerArray = ["通知設定", "密碼設定"]
    let contentArray = ["接收通知", "", "新文章上架通知", "學術活動通知", "公告通知"]
    
    
    @IBOutlet var settingReminderView: UIView!
    @IBOutlet var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Setting"
        navigationController?.navigationBar.isTranslucent = false
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.estimatedRowHeight = 0
        settingTableView.rowHeight = UITableViewAutomaticDimension
        settingTableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        let headerViewNib = UINib(nibName: "SettingHeaderView", bundle: nil)
        settingTableView.register(headerViewNib, forHeaderFooterViewReuseIdentifier: headerViewId)
        
//        settingTableView.register(SettingContent_TVCell.self, forCellReuseIdentifier: contentCellId)
//        tableView.register(, forCellReuseIdentifier: <#T##String#>)
    
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return headerArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            // 1 for spaceCell
            return contentArray.count + 1
        }
        else{
            return 1
        }
    }
    
    //: header delegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UINib(nibName: "SettingHeaderView", bundle: nil).instantiate(withOwner: self, options: nil).first as! SettingHeaderView
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerViewId) as! SettingHeaderView
//        let headerView = tableView.dequeueReusableCell(withIdentifier: headerViewId) as! SettingHeaderView
        headerView.headerLabel.text = headerArray[section]
//        headerView.headerLabel.text = headerArray[section]
//        headerView.headerLabel.font = headerView.headerLabel.font.withSize(16)
//        headerView.headerLabel.textColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
        headerView.backgroundView?.backgroundColor = UIColor.white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 23
    }
    
    //: tableView dataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) && (indexPath.item == 5) {
            let spaceCell = tableView.dequeueReusableCell(withIdentifier: basicCellId)!
            spaceCell.textLabel?.text = nil
            spaceCell.selectionStyle = .none
            return spaceCell
        }
        else if (indexPath.section == 0) && (indexPath.item == 1){
            let detailNotificationCell = tableView.dequeueReusableCell(withIdentifier: basicCellId)!
            detailNotificationCell.textLabel?.text = "通知細項設定"
            detailNotificationCell.textLabel?.font = detailNotificationCell.textLabel?.font.withSize(13)
            detailNotificationCell.textLabel?.textColor = UIColor(red: 109/255, green: 109/255, blue: 114/255, alpha: 1)
            return detailNotificationCell
        }
        else if (indexPath.section == 1) && (indexPath.item == 0){
            let changePasswordCell = tableView.dequeueReusableCell(withIdentifier: changePasswordCellId)!
            return changePasswordCell
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: contentCellId, for: indexPath) as! SettingContent_TVCell
            cell.contentTitle.text = contentArray[indexPath.item]
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
//        tableView.deleteSections(NSIndexSet(index: 0) as IndexSet, with: .automatic)
//        navigationController?.popViewController(animated: true)
    }
    

    /*
    //  to support conditional editing of the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    //  to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    //  to support rearranging the table view.
     func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    //  to support conditional rearranging of the table view.
     func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
