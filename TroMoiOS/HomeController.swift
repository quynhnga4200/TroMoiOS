//
//  HomeController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import Foundation
import UIKit

class HomeController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var rooms = [Room]()
    var HomeCellarray = [HomeTableViewCell]()
    //var image = UIImageView(named:"Logo")
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return userData.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! Home
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var request = URLRequest(url: URL(string: "http://127.0.0.1/APIMobile/?type=1")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = session.dataTask(with: request, completionHandler: { [self] data, response, error -> Void in
            //print(response!)
            DispatchQueue.main.async {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! [Dictionary<String, AnyObject>]
                    print(json[1]["tienIch"]!)
                    for item in json {
                        print(item)
                    }
                } catch {
                    print("error")
                }
                  }

            
        })
        
        task.resume()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newRoom") as? HomeTableViewCell{
            let room = rooms[indexPath.row]
            cell.motelIMG.image = room.Roomimage[indexPath.row]
            cell.addressLB.text = room.Roomaddress
            cell.areaLB.text = room.Roomacreage
            cell.priceLB.text = room.Roomprice
            return cell
            
        }
        else{
            fatalError("Can not create the cell")
        }
      
        
    }
    @IBAction func unWindFromCreatePostController (segue: UIStoryboardSegue){
        print("Hello")
        if let sourceController = segue.identifier as? CreatePostController{
            if let room = sourceController.room{
                rooms += [room]
                let newindexPath = IndexPath(row: rooms.count - 1, section: 0)
                tableView.insertRows(at: [newindexPath], with: .automatic)
            }
        }
    }
   
}

