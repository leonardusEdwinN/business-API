//
//  HoursOperationTableViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 23/01/22.
//

import UIKit

//hoursItemTableViewCell

class HoursOperationTableViewCell: UITableViewCell {

    @IBOutlet weak var hoursOfOperationTableView: UITableView!
    @IBOutlet weak var labelHoursOfOperation: UILabel!
    
    var hoursOperations : [Open] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCell(){
        hoursOfOperationTableView.register(UINib.init(nibName: "HoursItemTableViewCell", bundle: nil), forCellReuseIdentifier: "hoursItemTableViewCell")
        hoursOfOperationTableView.delegate = self
        hoursOfOperationTableView.dataSource = self
    }
    
    func setupUI(hoursOperations : [Open]){
        self.hoursOperations = hoursOperations
        DispatchQueue.main.async {
            self.hoursOfOperationTableView.reloadData()
        }
    }
    
}


extension HoursOperationTableViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hoursOperations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hoursItemTableViewCell", for: indexPath) as! HoursItemTableViewCell
        
        var dayStr :String = ""
        var timeStr :String = ""
        switch hoursOperations[indexPath.row].day{
        case 0:
            dayStr = "Monday"
        case 1:
            dayStr = "Tuesday"
        case 2:
            dayStr = "Wednesday"
        case 3:
            dayStr = "Thursday"
        case 4:
            dayStr = "Friday"
        case 5:
            dayStr = "Saturday"
        case 6:
            dayStr = "Sunday"
        default :
            dayStr = "DAY"
        }
        
        
        if let startTime = hoursOperations[indexPath.row].start, let endTime =  hoursOperations[indexPath.row].end{
            
            timeStr = "\(startTime.prefix(2)) : \(startTime.suffix(2)) - \(endTime.prefix(2)) : \(endTime.suffix(2))"
        }
        
        cell.setupUI(dayStr: dayStr, timeStr: timeStr)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    
}
