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
    var check: Bool = false
    
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
}
