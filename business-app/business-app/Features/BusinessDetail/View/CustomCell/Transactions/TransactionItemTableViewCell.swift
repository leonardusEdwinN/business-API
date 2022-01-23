//
//  TransactionItemTableViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 23/01/22.
//

import UIKit

class TransactionItemTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var transactionImage: UIImageView!
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
        self.transactionLabel.text = "Transaction"
        
    }
    func setupUI(transaction: String){
        transactionLabel.text = transaction
        
    }
    
}


//takeoutbag.and.cup.and.straw
//car
