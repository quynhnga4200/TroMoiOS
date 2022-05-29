//
//  HomeController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import Foundation
import UIKit

class HomeController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let addressData = ["Logo" , "phone" , "time"]
    let areaData = ["50" , "5" , "10"]
    let price = ["4" , "9" , "12"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // dang ki nhan dang tai su dung o
        //let nib = UINib(nibName: "HomeTableView", bundle: nil)
        
        //tableView.register(nib, forCellReuseIdentifier: "HomeTableView")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableView", for: indexPath) as! HomeTableViewCell
        
        //lay duong dan trong mang
        let motel = addressData[indexPath.row]
        let area = areaData[indexPath.row]
        let price = price[indexPath.row]
        
        
        cell.motelIMG.image = UIImage (named: motel)
        cell.addressLB.text = motel
        cell.areaLB.text = "DT: \(area) m2"
        cell.priceLB.text = "\(price) triệu"
      return cell
        
    }
   
}

