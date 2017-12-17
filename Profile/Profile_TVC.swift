//
//  Profile_TVC.swift
//  Profile
//
//  Created by kidnapper on 14/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class Profile_TVC: UITableViewController, UITextFieldDelegate {
    
    private let nameCellId = "profileName"
    private let contentCellId = "profileContent"
    
    var itemLabelArray = ["Paul", "服務單位", "服務科別", "聯絡電話"]
    var itemTextFieldArray = ["ming@gmail.com", "林口長庚", "心臟科", "02-26542345"]
    var notFirst = false
    var editClicked = 0 {
        didSet{
            if editClicked == 1{
                editBtn.title = "Save"
                tableView.reloadData()
            }else{
                notFirst = true
                editBtn.title = "Edit"
                tableView.reloadData()
            }
        }
    }
    @IBOutlet var editBtn: UIBarButtonItem!
    @IBAction func editBtnClicked(_ sender: Any){
        editClicked = editClicked ^ 1
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tableView.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard(){
        tableView.endEditing(true)
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let nameCell = tableView.dequeueReusableCell(withIdentifier: nameCellId) as! ProfileName_TVCell
            nameCell.nameLabel.text = "Paul"
            nameCell.contentTextField.text = "ming@gmail.com"
            nameCell.backgroundColor = UIColor.lightGray
            nameCell.contentTextField.isUserInteractionEnabled = false
            nameCell.selectionStyle = .none
            return nameCell
        }else{
            let contentCell = tableView.dequeueReusableCell(withIdentifier: contentCellId, for: indexPath) as! ProfileContent_TVCell
            
            if editClicked == 1{
                contentCell.contentTextField.isUserInteractionEnabled = true
            }else{
                contentCell.contentTextField.isUserInteractionEnabled = false
                if notFirst{
                    itemTextFieldArray[indexPath.item] = contentCell.contentTextField.text!
                }
            }
            contentCell.contentLabel.text = itemLabelArray[indexPath.item]
            contentCell.contentTextField.text = itemTextFieldArray[indexPath.item]
            contentCell.contentTextField.delegate = self
            return contentCell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0{
            return 70
        }
        else{
            return 49
        }
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
