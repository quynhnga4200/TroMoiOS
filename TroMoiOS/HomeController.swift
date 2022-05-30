//
//  HomeController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import Foundation
import UIKit


class HomeController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var rooms = [Room]()
    var searchMotel = [Room]()
    var seaching = false
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // dang ki nhan dang tai su dung o
        
        let roomImg = UIImage(named: "Logo")
        
        if let room = Room(motelImg: roomImg, address: "31/21 Duong 12 Linh chiu thu duc", acreage: 18,price: 5){
            rooms += [room]
            
        }
        if let room = Room(motelImg: roomImg, address: "31/23 Duong 56 Binhh thanh", acreage: 18,price: 5){
            rooms += [room]
            
        }
        if let room = Room(motelImg: roomImg, address: "31/21 Duong 12 Linh chiu thu duc", acreage: 18,price: 5){
            rooms += [room]
            
        }
        if let room = Room(motelImg: roomImg, address: "31/21 Duong 12 Linh chiu thu duc", acreage: 18,price: 5){
            rooms += [room]
            
        }
        if let room = Room(motelImg: roomImg, address: "31/21 Duong 12 Linh chiu thu duc", acreage: 18,price: 5){
            rooms += [room]
            
        }
        //searchMotel = addressData

        
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
        configureSearchController()
        // tableView.allowsSelection = false
    }
    
    private func configureSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Tìm theo địa chỉ"
        
        
        
    }
}

extension HomeController: UITableViewDelegate , UITableViewDataSource , UISearchResultsUpdating , UISearchBarDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if seaching {
            return searchMotel.count
        }
        else {
            return rooms.count
        }
=======
        return rooms.count
>>>>>>> Quynhnga
    }
    
    //return addressData.count
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableView" , for: indexPath) as? HomeTableViewCell{
            
            //lay duong dan trong mang
            let room = rooms[indexPath.row]
            
            
            if  seaching {
                cell.motelIMG.image = searchMotel[indexPath.row].Roomimg
                cell.addressLB?.text = searchMotel[indexPath.row].Roomaddress
                cell.areaLB.text = "TD: \(searchMotel[indexPath.row].Roomacreage) m2"
                cell.priceLB.text = "\(searchMotel[indexPath.row].RoomPrice) triệu"
            }
            else {
                cell.motelIMG.image = room.Roomimg
                cell.addressLB?.text = room.Roomaddress
                cell.areaLB.text = "TD: \(room.Roomacreage) m2"
                cell.priceLB.text = "\(room.RoomPrice) triệu"
            }
            return cell
=======
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newRoom") as? HomeTableViewCell{
            let room = rooms[indexPath.row]
            cell.motelIMG.image = room.Roomimage[indexPath.row]
            cell.addressLB.text = room.Roomaddress
            cell.areaLB.text = room.Roomacreage
            cell.priceLB.text = room.Roomprice
            return cell
            
>>>>>>> Quynhnga
        }
        else{
            fatalError("Can not create the cell")
        }

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        seaching = false
        searchMotel.removeAll()
        self.tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        if !searchText.isEmpty{
            seaching = true
            searchMotel.removeAll()
            
            for word in rooms {
                if word.Roomaddress.uppercased().contains(searchText.uppercased()){
                        searchMotel.append(word)
                       }
                   }
        }
        else{
            seaching =  false
            searchMotel.removeAll()
            searchMotel = rooms
        }
        self.tableView.reloadData()
    }
=======
      
        
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
//extension HomeController:UISearchBarDelegate{
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        searchMotel = []
//        if searchText == ""{
//            searchMotel = addressData
//        }
//        for word in addressData {
//            if word.uppercased().contains(searchText.uppercased()){
//                searchMotel.append(word)
//            }
//        }
//        self.tableView.reloadData()
//    }
//}
