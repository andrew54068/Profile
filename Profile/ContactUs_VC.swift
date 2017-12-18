//
//  ContactUs_VC.swift
//  Profile
//
//  Created by kidnapper on 18/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class ContactUs_VC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate{
    
    var questionType:[String] = ["Type1", "Type2", "Type3", "Type4", "Type5"]
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var lastName: UILabel!
    @IBOutlet var firstName: UILabel!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var email: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var commentTextView: UITextView!
    @IBAction func sendOnClick(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelAttributeSetup()
        addTapToHideKeyboard()
        
        textFieldSetup()
        textViewSetup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func labelAttributeSetup(){
        let attrs1 = [NSFontAttributeName: UIFont.systemFont(ofSize: 15, weight: UIFontWeightBold), NSForegroundColorAttributeName: UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1) ]
        let attrs2 = [NSFontAttributeName: UIFont.systemFont(ofSize: 13), NSForegroundColorAttributeName: UIColor(red: 0/255, green: 102/255, blue: 204/255, alpha: 1)]
        let attributedStringForLastName = NSMutableAttributedString(string: "姓氏", attributes: attrs1)
        let attributedStringForFirstName = NSMutableAttributedString(string: "名字", attributes: attrs1)
        let attributedStringForEmail = NSMutableAttributedString(string: "電子郵件", attributes: attrs1)
        let attributedStringForStar = NSMutableAttributedString(string: "*", attributes: attrs2)
        let attributedStringForNotEditable = NSMutableAttributedString(string: "不可修改", attributes: attrs2)
        attributedStringForLastName.append(attributedStringForStar)
        attributedStringForFirstName.append(attributedStringForStar)
        attributedStringForEmail.append(attributedStringForStar)
        attributedStringForEmail.append(attributedStringForNotEditable)
        lastName.attributedText = attributedStringForLastName
        firstName.attributedText = attributedStringForFirstName
        email.attributedText = attributedStringForEmail
        
    }
    
    func textFieldSetup() {
        lastNameTextField.delegate = self
        firstNameTextField.delegate = self
        emailTextField.delegate = self
    }
    
    func textViewSetup() {
        commentTextView.delegate = self
    }
    
    // MARK: UITextView Delegate
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.text.append("\n")
        return true
    }
    
    
    // MARK: UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func addTapToHideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        scrollView.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide {
            scrollView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)

        } else {
            scrollView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    // MARK: UIPickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return questionType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }

}
