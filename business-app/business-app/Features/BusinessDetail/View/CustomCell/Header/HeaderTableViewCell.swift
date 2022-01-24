//
//  HeaderTableViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 22/01/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var businessTitle: UILabel!
    @IBOutlet weak var businessImage: UIImageView!
    
    @IBOutlet weak var addressAndContactLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressValueLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneValueLabel: UILabel!

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceValueLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingValueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        resetData()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func resetData(){
        businessTitle.text = "Business Title"
        businessImage.image = UIImage(named: "noImage")
        businessImage.contentMode = .scaleAspectFill
        addressValueLabel.text = "Address"
        phoneValueLabel.text = "Phone"
        ratingValueLabel.text = "-"
        priceValueLabel.text = "-"
        
    }
    
    func setupUI(name : String, displayPhone : String, address : String, imageURL : URL?, rating: Double, price: String){
        
        businessTitle.text = name
        businessImage.contentMode = .scaleAspectFill
        addressValueLabel.text = address
        phoneValueLabel.text = displayPhone
        ratingValueLabel.text = "\(rating)"
        priceValueLabel.text = price
        
        guard let imageUrl = imageURL else {return}
        businessImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "noImage"))
        
        
        
    }
    
}
