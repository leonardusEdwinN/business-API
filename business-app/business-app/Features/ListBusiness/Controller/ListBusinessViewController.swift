//
//  ListBusinessViewController.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 21/01/22.
//

import Foundation
import UIKit

class ListBusinessViewController : UIViewController{
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var listBusinessTableView: UITableView!
    
    // MARK: Variable
    var listBusinessVM = ListBusinessViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUINavigation()
        registerCell()
        getBusiness(keyword: "NYC",isNext: false) // just set default
    }
    
    
    func setUINavigation(){
        navigationView.backgroundColor = UIColor.white
        navigationView.layer.shadowColor = UIColor.gray.cgColor
        navigationView.layer.shadowOffset = CGSize(width: 1, height: 1)
        navigationView.layer.shadowRadius = 1
        navigationView.layer.shadowOpacity = 5
    }
    
    
    
    func registerCell(){
        listBusinessTableView.register(UINib.init(nibName: "ListBusinessTableViewCell", bundle: nil), forCellReuseIdentifier: "listBusinessTableViewCell")
        listBusinessTableView.delegate = self
        listBusinessTableView.dataSource = self
    }
    
    func getBusiness(keyword: String, isNext : Bool){
        LoadingScreen.sharedInstance.showIndicator()
        listBusinessVM.getBusinessFromKeyword(keyword: keyword,isNext: isNext) { _ in
           
            DispatchQueue.main.async {
                self.listBusinessTableView.reloadData()
                LoadingScreen.sharedInstance.hideIndicator()

            }
        }
        
        
    }
}


extension ListBusinessViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("list : \(listBusinessVM.numberOfRows(section))")
        return listBusinessVM.numberOfRows(section)
//        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listBusinessTableViewCell", for: indexPath) as! ListBusinessTableViewCell
        
        let data = listBusinessVM.modelAt(indexPath.row)
        let address = "\(data.item.location?.address1 ?? "") \(data.item.location?.city ?? "") , \(data.item.location?.state ?? "")  \(data.item.location?.zip_code ?? "")"
        cell.setupUI(name: data.item.name ?? "", phone: data.item.phone ?? "", displayPhone: data.item.display_phone ?? "", price: data.item.price ?? "", rating: data.item.rating ?? 0, address: address  , imageURL: (URL(string: data.item.image_url ?? "")))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
