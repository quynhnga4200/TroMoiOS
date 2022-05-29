//
//  HomeTableViewCell.swift
//  TroMoiOS
//
//  Created by Truong Thai Anh on 27/09/5782 AM.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var motelView: UIView!
    @IBOutlet weak var motelIMG: UIImageView!
    @IBOutlet weak var areaLB: UILabel!
    @IBOutlet weak var addressLB: UILabel!
    @IBOutlet weak var areaIMG: UIImageView!
    @IBOutlet weak var priceLB: UILabel!
    //@IBOutlet weak var myImageView: UIImageView!
    //@IBOutlet weak var locationIMG: UIImageView!
   // @IBOutlet weak var locationLB: UILabel!
    //@IBOutlet weak var areaIMG: UIImageView!
    //@IBOutlet weak var areaLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
