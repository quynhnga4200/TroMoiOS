//
//  user.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 28/05/2022.
//

import Foundation
import UIKit

struct  User {
    let name: String
    let emai: String
    let phonenumber : String
    let password : String
    let repassword : String
    let Avatar : String
    
    init(name:String ,email: String ,phone:String,pass:String,repass:String,avatar:String){
       self.name = name
       self.emai = email
        self.phonenumber = phone
        self.password = pass
        self.repassword = repass
        self.Avatar = avatar
    }

        
    }
    

   

