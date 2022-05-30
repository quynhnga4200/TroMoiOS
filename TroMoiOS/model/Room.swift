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
    var Roomprice:String = ""
    var Roomtitle: String = ""
    var Roomowner: String = ""
    var Roomaddress: String = ""
    var Roomownerphone: String = ""
    var Roomacreage: String = ""
    var RoomDescription: String = ""
    var Roomimage: [UIImage]
    var Roomutility:[Bool]

    init(id: Int, title: String, owner: String, address: String, ownerphone: String, acreage: String, description: String,image: [UIImage], untility: [Bool], price: String) {
        self.Roomid = id
        self.Roomtitle = title
        self.Roomowner = owner
        self.Roomaddress = address
        self.Roomownerphone = ownerphone
        self.Roomacreage = acreage
        self.RoomDescription = description
        self.Roomimage = image
        self.Roomutility = untility
        self.Roomprice = price
    }
}
    
//}
