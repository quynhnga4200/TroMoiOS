//
//  CreatePostController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import Foundation
import UIKit

class CreatePostController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var PostType: Int = 0
    var RoomType: Int = 0
    @IBOutlet weak var PriceTextfield: UITextField!
    @IBOutlet weak var AcreageTextfield: UITextField!
    @IBOutlet weak var TitleTextfield: UITextField!
    @IBOutlet weak var OwnerTextfield: UITextField!
    @IBOutlet weak var PhoneTextfield: UITextField!
    @IBOutlet weak var DescriptionTextfield: UITextView!
    @IBOutlet weak var BtnConfirm: UIButton!
    @IBOutlet weak var WifiStackView: UIStackView!
    @IBOutlet weak var WcStackView: UIStackView!
    @IBOutlet weak var PackingStackView: UIStackView!
    @IBOutlet weak var FreeStackView: UIStackView!
    @IBOutlet weak var KitchenStackView: UIStackView!
    @IBOutlet weak var AirStackView: UIStackView!
    @IBOutlet weak var FridgeStackView: UIStackView!
    @IBOutlet weak var WasingStackView: UIStackView!
    @IBOutlet weak var AdressCity: UITextField!
    @IBOutlet weak var AdressDictrict: UITextField!
    @IBOutlet weak var AdressWard: UITextField!
    @IBOutlet weak var AdressStreet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Thay đổi giá trị của loại tin
    @IBAction func onTapSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                print("Cho thuê")
            PostType = sender.selectedSegmentIndex
            case 1:
                print("Tìm người ở ghép")
            PostType = sender.selectedSegmentIndex
            default:
                break
            }
    }
    //MARK: Thay đổi giá trị loại phòng
    @IBAction func onTapRoomTypeSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                print("Phòng")
            RoomType = sender.selectedSegmentIndex
            case 1:
                print("Căn hộ")
            RoomType = sender.selectedSegmentIndex
            case 2:
                print("Căn hộ mini")
            RoomType = sender.selectedSegmentIndex
            case 3:
                print("Nguyên căn")
            RoomType = sender.selectedSegmentIndex
            default:
                break
            }
    }
    
    //MARK: Bắt sự kiện bấm vào chọn ảnh
    @IBAction func imageProcessing(_ sender: UITapGestureRecognizer) {
        //print("Đã có thể nhấn vào nút ")
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self//Câu này chưa làm được
        present(imagePickerController, animated: true, completion: nil)
        
    }
    //MARK: Image picker delegation function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            //imgMeal.image = selectedImage //đưa ảnh đã chọn vào view//Câu này bị lỗi
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func Confirmbutton(_ sender: UIButton) {
        let bordercolor = UIColor.red
        var check: Bool = false
        if PriceTextfield.text == ""{
            check = true
            PriceTextfield.layer.borderColor = bordercolor.cgColor
            PriceTextfield.layer.borderWidth = 1.0
            
        }
        
        if check  {
            return
        }
        
        print(PostType)
        print(RoomType)
        print(PriceTextfield.text)
    }
}

