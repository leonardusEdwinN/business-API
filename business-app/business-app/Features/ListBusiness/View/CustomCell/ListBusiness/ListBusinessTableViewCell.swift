//
//  ListBusinessTableViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 21/01/22.
//

import UIKit
import SDWebImage

class ListBusinessTableViewCell: UITableViewCell {

    @IBOutlet weak var viewOuter: UIView!
    @IBOutlet weak var imageViewBusiness: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelDisplayPhone: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        resetUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func resetUI(){
        imageViewBusiness.image = UIImage(named: "noImage")
        labelName.text = "Business Name : "
        labelPhone.text = "Business Phone : "
        labelDisplayPhone.text = "Business Phone 1 : "
        labelPrice.text = "Price : "
        labelRating.text = "Business Rating : "
        labelAddress.text = "Business Address : "
    }
    
    func setupUI(name : String, phone : String, displayPhone : String, price: String, rating: Double, address : String, imageURL : URL?){
        
        labelName.text = "Business Name : \(name)"
        labelPhone.text = "Business Phone : \(phone)"
        labelDisplayPhone.text = "Business Phone 1 : \(displayPhone)"
        labelPrice.text = "Price : \(price)"
        labelRating.text = "Business Rating : \(rating)"
        labelAddress.text = "Business Address : \(address)"
        
        guard let imageUrl = imageURL else {return}
        imageViewBusiness.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "noImage"))
    }
    
}
