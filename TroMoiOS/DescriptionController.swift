//
//  DescriptionController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import Foundation
import UIKit

class DescriptionController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var titleroom: UITextField!
    @IBOutlet weak var tienich: UIStackView!
    @IBOutlet weak var timePost: UITextField!
    @IBOutlet weak var area: UITextField!
    
    @IBOutlet weak var chitiet: UITextField!
    @IBOutlet weak var phone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let id = DataPassing.shared.id
        // lay du lieu api
        var request = URLRequest(url: URL(string: "http://192.168.56.1/iOS_tromoi/?action=getRoomById&id=\(id)")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request, completionHandler: { [self] data, response, error -> Void in
            //print(response!)
            DispatchQueue.main.async {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                    var imageView : UIImage!
                    let url = URL(string:json["image"] as! String);
                    if let data = try? Data(contentsOf: url!){
                        imgView.image = UIImage(data:data);
                    }
                    address.text = json["DiaChi"] as! String
                    titleroom.text = json["Tieude"] as! String
                    area.text = json["dientich"] as! String
                } catch {
                    print("error")
                }
            }
            
            
        })
        task.resume()
    }


}


