//
//  Setting_TVC.swift
//  Profile
//
//  Created by kidnapper on 14/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class Setting_TVC: UITableViewController {

    private let notificationCellId = "notification"
    
    //use for headerCell and detailNotificationCell
    private let basicCellId = "basic"
    private let contentCellId = "settingContent"
    private let changePasswordCellId = "settingChangePassword"
    
    let headerArray = ["通知設定", "密碼設定"]
    let contentArray = ["接收通知", "", "新文章上架通知", "學術活動通知", "公告通知"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Setting"
        navigationController?.navigationBar.isTranslucent = false
        
        tableView.estimatedRowHeight = 0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return headerArray.count + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        }
        else if section == 1{
            
            // 1 for spaceCell
            return contentArray.count + 1
        }
        else{
            return 1
        }
    }
    
    //: header delegate
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let notificationCell = tableView.dequeueReusableCell(withIdentifier: notificationCellId) as! SettingNotification_TVCell
            return notificationCell
        }
        else{
            let headerCell = tableView.dequeueReusableCell(withIdentifier: basicCellId)!
            headerCell.textLabel?.text = headerArray[section - 1]
            headerCell.textLabel?.font = headerCell.textLabel?.font.withSize(16)
            headerCell.textLabel?.textColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
            headerCell.backgroundColor = UIColor.white
            return headerCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 44
        }
        else{
            return 23
        }
    }
    
    //: tableView dataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let spaceCell = tableView.dequeueReusableCell(withIdentifier: basicCellId)!
            spaceCell.textLabel?.text = nil
            return spaceCell
        }
        else if (indexPath.section == 1) && (indexPath.item == 5) {
            let spaceCell = tableView.dequeueReusableCell(withIdentifier: basicCellId)!
            spaceCell.textLabel?.text = nil
            return spaceCell
        }
        else if (indexPath.section == 1) && (indexPath.item == 1){
            let detailNotificationCell = tableView.dequeueReusableCell(withIdentifier: basicCellId)!
            detailNotificationCell.textLabel?.text = "通知細項設定"
            detailNotificationCell.textLabel?.font = detailNotificationCell.textLabel?.font.withSize(13)
            detailNotificationCell.textLabel?.textColor = UIColor(red: 109/255, green: 109/255, blue: 114/255, alpha: 1)
            return detailNotificationCell
        }
        else if (indexPath.section == 2) && (indexPath.item == 0){
            let changePasswordCell = tableView.dequeueReusableCell(withIdentifier: changePasswordCellId)!
            return changePasswordCell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: contentCellId, for: indexPath) as! SettingContent_TVCell
            cell.contentTitle.text = contentArray[indexPath.item]
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 19
        }
        else if (indexPath.section == 1) && (indexPath.item == 1) {
            return 30
        }
        else if (indexPath.section == 1) && (indexPath.item == contentArray.count) {
            return 35
        }
        else if indexPath.section == 0 {
            return 19
        }
        else {
            return 49
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigationController?.popViewController(animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
