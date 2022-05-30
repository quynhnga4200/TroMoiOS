//
//  Room.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 26/05/2022.
//

import Foundation
import UIKit
class Room {
    //MARK: Properties
    var Roomid: Int = 0
    var Roomtitle: String = ""
    var Roomowner: String = ""
    var Roomaddress: String = ""
    var Roomownerphone: String = ""
    var Roomacreage: Int = 0
    var RoomDescription: String = ""
    //var Roomimage: [UIImage]?
    //var Roomutility:[UIImage]?
    var RoomPrice: Int = 0
    var Roomimg:UIImage?
    //init(id: Int, title: String, owner: String, address: String, ownerphone: String, acreage: Int, description: String//,image: [UIImage]?, untility: [UIImage]?) {
       // self.Roomid = id
       // self.Roomtitle = title
       // self.Roomowner = owner
       // self.Roomaddress = address
        //  self.Roomownerphone = ownerphone
       // self.Roomacreage = acreage
       // self.RoomDescription = description
        //self.Roomimage = image
        //self.Roomutility = untility
    //}
    
    init?( motelImg: UIImage?, address: String,acreage: Int , price : Int  ) {
    self.Roomaddress = address
    self.Roomimg = motelImg
    self.Roomacreage = acreage
    self.RoomPrice = price
    }
}
    
//}
