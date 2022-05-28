//
//  user.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 28/05/2022.
//

import Foundation
import UIKit
class  User {
    var name: String = ""
    var emai: String = ""
    var phonenumber : String = ""
    var password : String = ""
    var repassword : String = ""
    var Avatar : String = ""
    init(name:String ,email: String ,phone:String,pass:String,repass:String,avatar:String){
       self.name = name
       self.emai = email
        self.phonenumber = phone
        self.password = pass
        self.repassword = repass
        self.Avatar = avatar
    }
    
}
   

