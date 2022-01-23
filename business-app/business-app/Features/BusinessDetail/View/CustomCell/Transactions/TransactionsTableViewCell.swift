//
//  TransactionsTableViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 23/01/22.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var transactionsTableView: UITableView!
    @IBOutlet weak var transactionsLabel: UILabel!
    
    var transactions : [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func resetUI(){
        
    }
    
    func setupUI(transactions: [String]){
        self.transactions = transactions
        DispatchQueue.main.async {
            self.transactionsTableView.reloadData()
        }
    }
    
    func registerCell(){
//        transactionItemTableViewCell
        transactionsTableView.register(UINib.init(nibName: "TransactionItemTableViewCell", bundle: nil), forCellReuseIdentifier: "transactionItemTableViewCell")
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
    }
    
}


extension TransactionsTableViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionItemTableViewCell", for: indexPath) as! TransactionItemTableViewCell
        
        cell.setupUI(transaction: transactions[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
