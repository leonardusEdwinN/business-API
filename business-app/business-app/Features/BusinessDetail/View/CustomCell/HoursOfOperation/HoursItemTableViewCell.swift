//
//  HoursItemTableViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 23/01/22.
//

import UIKit

class HoursItemTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelDay: UILabel!
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
        labelDay.text = ""
        labelTime.text = ""
    }
    
    func setupUI(dayStr : String, timeStr : String){
        labelDay.text = dayStr
        labelTime.text = timeStr
    }
    
}
