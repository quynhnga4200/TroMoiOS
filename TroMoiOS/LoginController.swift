//
//  LoginController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import Foundation
import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var phoneError: UILabel!
   
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passError: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     
    
    func resetForm(){
        loginButton.isEnabled = false
        phoneError.isHidden = false
        passError.isHidden = false
        
       
        passError.text = ""
        phoneTF.text = ""
        passTF.text = ""
    }
    
    @IBAction func phoneChanged(_ sender: Any) {
       
    }

        func invalidPhoneNumber(_ value:String) -> String?{

           return nil
        }

    @IBAction func passwordChanged(_ sender: Any) {
        
    }
    
    func invalidPassword(_ value: String)->String?
    {
           return nil
    }
   
    @IBAction func loginAction(_ sender: Any) {
        resetForm()
    }
}
