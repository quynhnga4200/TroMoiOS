//
//  LoginController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import Foundation
import UIKit

class LoginController: UIViewController ,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var phoneError: UILabel!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passError: UILabel!
    var check: Bool = false
    var userList = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        phoneTF.addTarget(self, action: #selector(self.valicationField), for: .editingChanged)
//        phoneTF.addTarget(self, action: #selector(self.valicationField), for: .editingChanged)
        
    }
    @objc private func valicationField(){
        loginButton.isEnabled =  phoneTF.text != "" && passTF.text != ""
    }
    @IBAction func loginAction(_ sender: UIButton) {
        NetWorkServỉce.share.login(phone: phoneTF.text!, pass: passTF.text!){ success in
            if success {
                self.goToHome()
                print()
            }
            else{
                self.passError.text = "sai số điẹn thoại hoặc mật khẩu"
            }
        }
        
    }
    private  func goToHome(){
        let controller = storyboard!.instantiateViewController(withIdentifier: "home") as! HomeController
        present(controller, animated: true,completion: nil)
    }
    @IBAction func unWindFromMealDetailController(segue: UIStoryboardSegue){
        //print("Back from meal detail controller")
        //ket noi man hinh nguoi voi ham unwind
    
        //get source controller tu man hinh 2
        if let sourceController = segue.source as? RegisterController {
        //get the new meal from meal detail controller
            if let users = sourceController.user { //mealName
                //print(meal.name)
                //add the new meal into data source
                    userList += [users]
           
                
                    }
                }
    }
    
}
