//
//  SearchTypeCollectionViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 24/01/22.
//

import UIKit

class SearchTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var searchTypeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        resetUI()
        // Initialization code
    }
    
    func resetUI(){
        outerView.layer.cornerRadius = 10
        outerView.backgroundColor = UIColor.lightGray
        outerView.layer.borderColor = UIColor.clear.cgColor
        outerView.layer.borderWidth = 2
    }
    
    func setupUI(type : String){
        searchTypeLabel.text = type
        self.isSelected = false
        backgroundUpdate()
        
    }
    
    func backgroundUpdate(){
        if(isSelected){
            self.outerView.backgroundColor = UIColor.red
            self.tintColor = UIColor.white
        }else{
            self.outerView.backgroundColor = UIColor.lightGray
            self.tintColor = UIColor.black
        }
        
//        isSelected = !isSelected
    }

}
