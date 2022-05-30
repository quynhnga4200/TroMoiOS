//
//  RegisterController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import Foundation
import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var repassTF: UITextField!
    
    
    @IBOutlet weak var fullNameError: UILabel!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var phoneError: UILabel!
    @IBOutlet weak var passError: UILabel!
    @IBOutlet weak var repassError: UILabel!
    @IBOutlet weak var registerButton: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    func resetForm(){
        registerButton.isEnabled = false
        phoneError.isHidden = false
        passError.isHidden = false
        
       
        passError.text = "  "
        phoneTF.text = " "
        passTF.text = " "
        fullNameTF.text = " "
        repassTF.text = " "
    }
   
    @IBAction func registerAction(_ sender: Any) {
        resetForm()
    
    }
    @IBAction func nameChanged(_ sender: Any) {
        if(fullNameTF.text == ""){
            fullNameError.text = "Vui lòng không để trống"
            fullNameError.isHidden = false
        }
        else{
            fullNameError.isHidden = true
        }
    
    }
    @IBAction func emailChaged(_ sender: Any) {
        if let email = emailTF.text
        {
            if let messageError = invalidEmail(email){
                emailError.text = messageError
                emailError.isHidden = false
           }
            else{
                emailError.isHidden =  true
            }
        }
        checkValidForm()
    }
    
    func invalidEmail(_ value: String)->String?
    {
        let reqularExpression = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let redicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        
        if(!redicate.evaluate(with: value)){
            return "Email không hợp lệ !"
        }
           return nil
    }
    
    @IBAction func phoneChanged(_ sender: Any) {
        if let phoneNumber = phoneTF.text
        {
            if let messageError = invalidPhoneNumber(phoneNumber){
                phoneError.text = messageError
                phoneError.isHidden = false
           }
            else{
                phoneError.isHidden =  true
            }
        }
        checkValidForm()
    }
    
    // xác nhận form phone
    func invalidPhoneNumber(_ value:String) -> String?{
        
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set){
         return "Chỉ được nhập số"
        }
            
            if value.count != 10{
            return " Phải nhập đủ 10 số "
        }
       return nil
    }
    
    @IBAction func passChanged(_ sender: Any) {
        if let password = passTF.text
        {
            if let messageError = invalidPassword(password)
            {
                passError.text = messageError
                passError.isHidden = false
           }
            else{
                passError.isHidden = true
            }
        }
        checkValidForm()
    }
    //Kiểm tra field pass
    func invalidPassword(_ value: String)->String?
    {
        if(value.count < 6){
            return "Mật khẩu phải nhiều hơn 6 kí tự"
        }
        if(containsDigit(value))
        {
           return "Mật khẩu phải chứa ít nhất 1 chữ số"
        }
        if(containsLowerCase(value))
        {
           return "Mật khẩu phải chứa ít nhất 1 chữ thường"
        }
           return nil
        
    }
    
    func containsDigit(_ value: String)->Bool
    {
        // nhập số 0-9
        let reqularExpression = ".*[0-9]+.*"
        let redicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !redicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String)->Bool
    {
        //viết thường
        let reqularExpression = ".*[a-z]+.*"
        let redicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !redicate.evaluate(with: value)
    }
    
    
    @IBAction func repassChanged(_ sender: Any) {
        if (repassTF.text != passTF.text)
        {
            repassError.text = "mật khẩu không giống "
            repassError.isHidden = false
        }
        else{
            repassError.isHidden = true
        }
    }
    
    func checkValidForm(){
    
        if(phoneError.isHidden && passError.isHidden){
            
            registerButton.isEnabled = true
        }
    }
}

