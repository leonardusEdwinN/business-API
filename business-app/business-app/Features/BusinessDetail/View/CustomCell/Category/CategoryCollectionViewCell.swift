//
//  CategoryCollectionViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 22/01/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var labelCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetUI()
        // Initialization code
    }
    func resetUI(){
        labelCategory.text = ""
        outerView.layer.cornerRadius = 15
        
    }

    func setupUI(category: String){
        labelCategory.text = category
    }
}
