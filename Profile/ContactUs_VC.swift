//
//  ContactUs_VC.swift
//  Profile
//
//  Created by kidnapper on 18/12/2017.
//  Copyright © 2017 25sprout.com. All rights reserved.
//

import UIKit

class ContactUs_VC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var questionType:[String] = ["Type1", "Type2", "Type3", "Type4", "Type5"]
    
    @IBOutlet var lastName: UILabel!
    @IBOutlet var firstName: UILabel!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var email: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var commentTextField: UITextField!
    @IBAction func sendOnClick(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelAttributeSetup()
        // Do any additional setup after loading the view.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
