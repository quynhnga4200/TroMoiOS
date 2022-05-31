
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
        
        // lay du lieu api
        var request = URLRequest(url: URL(string: "http://192.168.56.1/iOS_tromoi/?action=getAllRoom")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request, completionHandler: { [self] data, response, error -> Void in
            //print(response!)
            DispatchQueue.main.async {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! [Dictionary<String, AnyObject>]
                    for item in json {
                        var imageView : UIImage!
                        let url = URL(string:item["image"] as! String);
                        if let data = try? Data(contentsOf: url!){
                            imageView = UIImage(data:data);
                        }
                        
                        if let room = Room(id: Int(item["id"] as! String) ?? 0,motelImg: imageView, address: item["DiaChi"] as! String, acreage: Int(item["dientich"] as! String) ?? 0,price: Int(item["giaphong"] as! String) ?? 0){
                            rooms += [room]
                            
                        }
                    }
                    self.tableView.reloadData()
                } catch {
                    print("error")
                }
            }
            
            
        })
        
        task.resume()
        
        
        
        //du lieu ao
//        for _ in 0...10 {
//            if let room = Room(motelImg: roomImg, address: "31/21 Duong 12 Linh chiu thu duc", acreage: 18,price: 5){
//                rooms += [room]
//
//            }
//        }
        
        
        //searchMotel = addressData
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
extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
extension HomeController: UITableViewDelegate , UITableViewDataSource , UISearchResultsUpdating , UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if seaching {
            return searchMotel.count
        }
        else {
            return rooms.count
        }
    }
    
    //return addressData.count
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = rooms[indexPath.row].Roomid
        DataPassing.shared.id = id
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DescriptionScreen") // MySecondSecreen the storyboard ID
        self.present(vc, animated: true, completion: nil)
    }
    
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
