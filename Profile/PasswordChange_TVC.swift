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
    var firstResponder = false
    var hadEdited = false
    var oldPasswordCorrect = false
    var confirmNewPassword = false
    var errorView: PasswordChangeErrorView!
    
    
    @IBAction func save(_ sender: Any) {
        if (oldPasswordCorrect && confirmNewPassword && hadEdited){
            // API call here
            let alert = UIAlertController(title: "密碼修改成功", message: "下次登入請使用新密碼", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "密碼錯誤", message: "請檢查新舊密碼正確且新密碼不可為空", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Change Password"

        errorView = UINib(nibName: "PasswordChangeErrorView", bundle: nil).instantiate(withOwner: self, options: nil).first as! PasswordChangeErrorView
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tableView.addGestureRecognizer(tap)
        
        tableView.estimatedRowHeight = 50
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        errorView.isHidden = true
//        let tapOnErrorView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(makeFirstResponder))
        errorView.isUserInteractionEnabled = false
//        errorView.addGestureRecognizer(tapOnErrorView)
    }
    
    func dismissKeyboard(){
        tableView.endEditing(true)
    }
    
//    func makeFirstResponder() {
//        firstResponder = true
//        tableView.reloadData()
//    }
    
    // MARK: - TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hadEdited = true
        textField.endEditing(true)
        if textField.tag == 0{
            if passwordArray[0] != textField.text{
                self.errorView!.errorLabel.text = "舊密碼不正確"
                self.oldPasswordCorrect = false
                self.errorView.isHidden = false
            }
            else if passwordArray[1] != passwordArray[2]{
                self.oldPasswordCorrect = true
                self.confirmNewPassword = false
                self.errorView!.errorLabel.text = "兩次新密碼不相同"
                self.errorView.isHidden = false
            }
            else{
                self.oldPasswordCorrect = true
                self.errorView.isHidden = true
//                passwordArray[0] = textField.text!
            }
        }
        else if textField.tag == 1{
            passwordArray[1] = textField.text!
            if textField.text! == ""{
                self.confirmNewPassword = false
                self.errorView!.errorLabel.text = "新密碼不可為空"
                self.errorView.isHidden = false
            }
            else if passwordArray[1] != passwordArray[2]{
                self.confirmNewPassword = false
                self.errorView!.errorLabel.text = "兩次新密碼不相同"
                self.errorView.isHidden = false
            }
            else{
                self.confirmNewPassword = true
                self.errorView.isHidden = true
            }
        }
        else if textField.tag == 2 {
            passwordArray[2] = textField.text!
            if self.oldPasswordCorrect == false{
                self.errorView!.errorLabel.text = "舊密碼不正確"
                self.errorView.isHidden = false
            }
            else if passwordArray[1] != passwordArray[2]{
                self.confirmNewPassword = false
                self.errorView!.errorLabel.text = "兩次新密碼不相同"
                self.errorView.isHidden = false
            }
            else if textField.text != ""{
                self.confirmNewPassword = true
                self.errorView.isHidden = true
            }
            else{
                self.confirmNewPassword = false
                self.errorView!.errorLabel.text = "確認新密碼不可為空"
                self.errorView.isHidden = false
            }
        }
//        else {
//            self.errorView!.isHidden = true
//        }
        tableView.reloadData()
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
        if !(oldPasswordCorrect && confirmNewPassword){
            tableView.addSubview(self.errorView!)
        }

        return cell
    }


}
