//
//  NetWorkService.swift
//  TroMoiOS
//
//  Created by tran thanh on 29/05/2022.
//

import Foundation
class   NetWorkServỉce{
    
   static let share = NetWorkServỉce()
    private init(){}
    
    private var user : User?
    
    func login(phone:String,pass:String,
               completion: @escaping (Bool) -> Void){
        
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if phone == "0376610701" && pass == "admin"{
                    completion(true)
                    self.user = User(name: "thanh", email: "20211TT1281@gmail.com", phone: "0376610701", pass: "admin", repass: "admin", avatar: "")
                    
                }
                else{
                    self.user = nil
                    completion(false)
                }
                
            }
        }
        
    }
    func 	getLoggerInUser() -> User? {
        
        return user
    }
}
