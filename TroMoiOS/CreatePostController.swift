//
//  CreatePostController.swift
//  TroMoiOS
//
//  Created by PHAM QUYNH NGA on 25/05/2022.
//

import UIKit
import PhotosUI
import FirebaseDatabase
import FirebaseDatabaseSwift

class CreatePostController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    var ref: DatabaseReference!

    var PostType: Int = 0
    var RoomType: Int = 0
    var ImageArray: [UIImage] = []
    @IBOutlet weak var StackViewImage: UIStackView!
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
    @IBOutlet weak var wifiUIImage: UIImageView!
    @IBOutlet weak var wifitextfield: UILabel!
    var imagearay: [PHPickerResult] = []
    var uilityaray: [Bool] = [false,false,false,false,false,false,false,false]
    
    
    @IBAction func stackclick(_ sender: UITapGestureRecognizer) {
        stackviewClicked(viewstack: WifiStackView,position: 0)
    }
    
    @IBAction func WCClick(_ sender: UITapGestureRecognizer) {
        stackviewClicked(viewstack: WcStackView,position: 1)
    }
    
    @IBAction func PakingClick(_ sender: UITapGestureRecognizer) {
        stackviewClicked(viewstack: PackingStackView,position: 2)
    }
    
    @IBAction func FreeClick(_ sender: UITapGestureRecognizer) {
        stackviewClicked(viewstack: FreeStackView,position: 3)
    }
    
    
    func stackviewClicked (viewstack: UIStackView, position: Int){
        if uilityaray[position] == false{
            viewstack.layer.backgroundColor = UIColor.red.cgColor
            uilityaray[position] = true
        }
        else{
            viewstack.layer.backgroundColor = .none
            uilityaray[position] = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderdes = UIColor.black
        DescriptionTextfield.layer.borderColor = borderdes.cgColor
        DescriptionTextfield.layer.borderWidth = 1.0

        ref = Database.database().reference()
        self.ref.child("users").setValue(["username": "abc"])

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
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 4
        configuration.preferredAssetRepresentationMode = .automatic
        let imagePickerController = PHPickerViewController(configuration:configuration)
        //picker(imagePickerController, didFinishPicking: imagearay)
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
        
        
    }
    //MARK: Image picker delegation function
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let selectedImage = info[.originalImage] as? UIImage{
//            //imgMeal.image = selectedImage //đưa ảnh đã chọn vào view//Câu này bị lỗi
//            dismiss(animated: true, completion: nil)
//        }
//    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        StackViewImage.subviews.forEach{(view) in view.removeFromSuperview()}
        //StackViewImage.removeArrangedSubview(StackViewImage.arrangedSubviews[0])
        let itemProviders = results.map(\.itemProvider)
        for item in itemProviders {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self) { (image, error) in
                    DispatchQueue.main.async { [self] in
                        if let image = image as? UIImage {
                            let imageView = UIImageView()
                            image.draw(in: imageView.bounds)
                            imageView.backgroundColor = UIColor(patternImage: image)
                            imageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
                            imageView.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
                            StackViewImage.addArrangedSubview(imageView)
                            ImageArray.append(image)
                            print(ImageArray.count)
                            //self.imageView.image = nil
                            //self.imageView.image = image
                        }
                    }
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func InputPriceTextfield(_ sender: UITextField){
        
        PriceTextfield.layer.borderColor = UIColor.blue.cgColor;
        PriceTextfield.layer.borderWidth = 1.0
    }
    @IBAction func Confirmbutton(_ sender: UIButton) {
        let bordercolor = UIColor.red
        var check: Bool = false

        if PriceTextfield.text == ""{
            check = true
            PriceTextfield.layer.borderColor = bordercolor.cgColor
            PriceTextfield.layer.borderWidth = 1.0
        }
        else{
            PriceTextfield.layer.borderColor = nil
        }
        if AcreageTextfield.text == ""{
            check = true
            AcreageTextfield.layer.borderColor = bordercolor.cgColor
            AcreageTextfield.layer.borderWidth = 1.0
        }
        if TitleTextfield.text == ""{
            check = true
            TitleTextfield.layer.borderColor = bordercolor.cgColor
            TitleTextfield.layer.borderWidth = 1.0
        }
        if OwnerTextfield.text == ""{
            check = true
            OwnerTextfield.layer.borderColor = bordercolor.cgColor
            OwnerTextfield.layer.borderWidth = 1.0
        }
        if PhoneTextfield.text == ""{
            check = true
            PhoneTextfield.layer.borderColor = bordercolor.cgColor
            PhoneTextfield.layer.borderWidth = 1.0
        }
        if DescriptionTextfield.text == ""{
            check = true
            DescriptionTextfield.layer.borderColor = bordercolor.cgColor
            DescriptionTextfield.layer.borderWidth = 1.0
        }
        if AdressCity.text == ""{
            check = true
            AdressCity.layer.borderColor = bordercolor.cgColor
            AdressCity.layer.borderWidth = 1.0
        }
        if AdressDictrict.text == ""{
            check = true
            AdressDictrict.layer.borderColor = bordercolor.cgColor
            AdressDictrict.layer.borderWidth = 1.0
        }
        if AdressWard.text == ""{
            check = true
            AdressWard.layer.borderColor = bordercolor.cgColor
            AdressWard.layer.borderWidth = 1.0
        }
        if AdressStreet.text == ""{
            check = true
            AdressStreet.layer.borderColor = bordercolor.cgColor
            AdressStreet.layer.borderWidth = 1.0
        }
        if check  {
            return
        }
    }
}

