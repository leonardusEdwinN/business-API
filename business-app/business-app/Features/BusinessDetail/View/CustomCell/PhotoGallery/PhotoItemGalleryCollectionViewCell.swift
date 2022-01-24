//
//  PhotoItemGalleryCollectionViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 23/01/22.
//

import UIKit
import SDWebImage

class PhotoItemGalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewOuter: UIView!
    @IBOutlet weak var photoItem: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resetUI()
    }
    
    func resetUI(){
        viewOuter.layer.cornerRadius = 10
        photoItem.layer.cornerRadius = 15
        photoItem.image = UIImage(named: "noImage")
        
    }
    
    func setupUI(imageStr : String){
        photoItem.sd_setImage(with: URL(string: imageStr), placeholderImage: UIImage(named: "noImage"))
        
    }

}
