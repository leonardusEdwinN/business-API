//
//  BusinessDetailViewController.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 22/01/22.
//

import Foundation
import UIKit
import SDWebImage

class BusinessDetailViewController : UIViewController{
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var businessDetailTableView: UITableView!
    
    
    //    @IBOutlet weak var businessTitle: UILabel!
    //    @IBOutlet weak var businessImage: UIImageView!
    //
    //    @IBOutlet weak var addressAndContactLabel: UILabel!
    //    @IBOutlet weak var addressLabel: UILabel!
    //    @IBOutlet weak var addressValueLabel: UILabel!
    //    @IBOutlet weak var phoneLabel: UILabel!
    //    @IBOutlet weak var phoneValueLabel: UILabel!
    //
    //    @IBOutlet weak var categoryLabel: UILabel!
    //    @IBOutlet weak var viewCategory: UIView!
    //    @IBOutlet weak var categoryCollectionView: UICollectionView!
    //
    //    @IBOutlet weak var hoursOfOperationLabel: UILabel!
    //
    //    @IBOutlet weak var viewBusinessLink: UIView!
    //    @IBOutlet weak var businessLink: UILabel!
    
    // MARK: VARIABLE
    var businesVM : BusinessViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUINavigation()
        registerCell()
        
        if let id = businesVM?.item.id{
            getBusinessDetail(id: id)
        }
    }
    
    func setUINavigation(){
        navigationView.backgroundColor = UIColor.white
        navigationView.layer.shadowColor = UIColor.gray.cgColor
        navigationView.layer.shadowOffset = CGSize(width: 1, height: 1)
        navigationView.layer.shadowRadius = 1
        navigationView.layer.shadowOpacity = 5
    }
    
    func getBusinessDetail(id: String){
        businesVM?.getBusinessDetailFromID(id: id, completion: { Businesses in
            LoadingScreen.sharedInstance.showIndicator()
            DispatchQueue.main.async {
                self.businessDetailTableView.reloadData()
            }
            LoadingScreen.sharedInstance.hideIndicator()
        })
    }
    
    func registerCell(){
        businessDetailTableView.register(UINib.init(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerTableViewCell")
        businessDetailTableView.register(UINib.init(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryTableView")
        
        businessDetailTableView.register(UINib.init(nibName: "HoursOperationTableViewCell", bundle: nil), forCellReuseIdentifier: "hoursOfOperationsTableViewCell")
        businessDetailTableView.register(UINib.init(nibName: "PhotoGalleryTableViewCell", bundle: nil), forCellReuseIdentifier: "photoGalleryTableViewCell")
        businessDetailTableView.register(UINib.init(nibName: "TransactionsTableViewCell", bundle: nil), forCellReuseIdentifier: "transactionsTableViewCell")
        businessDetailTableView.delegate = self
        businessDetailTableView.dataSource = self
    }
}

extension BusinessDetailViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerTableViewCell", for: indexPath) as! HeaderTableViewCell
            
            
            let address = "\(businesVM?.item.location?.address1 ?? "") \(businesVM?.item.location?.city ?? "") , \(businesVM?.item.location?.state ?? "")  \(businesVM?.item.location?.zip_code ?? "")"
            
            
            cell.setupUI(name: businesVM?.item.name ?? "", displayPhone: businesVM?.item.display_phone ?? "", address: address, imageURL: URL(string: businesVM?.item.image_url ?? ""), rating: businesVM?.item.rating ?? 0, price: businesVM?.item.price ?? "-")
            
            return cell
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTableView", for: indexPath) as! CategoryTableViewCell
            
            cell.setupUI(category: businesVM?.item.categories ?? [])
            return cell
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "hoursOfOperationsTableViewCell", for: indexPath) as! HoursOperationTableViewCell
            
            cell.setupUI(hoursOperations: businesVM?.item.hours?[0].open ?? [])
            return cell
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "transactionsTableViewCell", for: indexPath) as! TransactionsTableViewCell
            
            cell.setupUI(transactions: businesVM?.item.transactions ?? [])
            return cell
            
        case 4:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoGalleryTableViewCell", for: indexPath) as! PhotoGalleryTableViewCell
            
            cell.setupUI(listPhoto: businesVM?.item.photos ?? [])
            return cell
        default:
            return UITableViewCell()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row{
        case 0:
            return 450
        case 1:
            return 100
        case 2 :
            return 200
        case 3 :
            return 150
        case 4 :
            return 150
        default:
            return 100
        }
        
    }
    
    
}
