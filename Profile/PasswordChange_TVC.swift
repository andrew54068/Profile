//
//  PasswordChange_TVC.swift
//  Profile
//
//  Created by kidnapper on 14/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class PasswordChange_TVC: UITableViewController, UITextFieldDelegate {
    
    private let cellId = "password"
    
    let contentTitle = ["舊密碼", "新密碼", "確認新密碼"]
    var passwordArray = ["12345678", "", ""]
    
    @IBAction func save(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Change Password"

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tableView.addGestureRecognizer(tap)
        
        tableView.estimatedRowHeight = 50
    }
    
    func dismissKeyboard(){
        tableView.endEditing(true)
    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordArray[textField.tag] = textField.text!
        textField.endEditing(true)
        if textField.tag == 0{
            if passwordArray[0] != textField.text{
                let view = UIView()
                view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20)
                view.backgroundColor = UIColor(red: 204/255, green: 0, blue: 51/255, alpha: 0.8)
                
                tableView.addSubview(view)
            }
        }
        else if textField.tag == 2{
            if passwordArray[1] != passwordArray[2]{
                print("確認密碼失敗")
            }
        }
        return true
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contentTitle.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PasswordChange_TVCell
        cell.passwordLabel.text = contentTitle[indexPath.item]
        cell.passwordTextField.tag = indexPath.item
        cell.passwordTextField.delegate = self
//        cell.passwordTextField

        // Configure the cell...

        return cell
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
