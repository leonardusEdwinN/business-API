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
    var selectedIndex : Int = 0
    var selectedBusinessVM : BusinessViewModel?
    
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
    
    func getBusinessDetail(id: String){
        self.selectedBusinessVM?.getBusinessDetailFromID(id: id, completion: { Businesses in
            LoadingScreen.sharedInstance.showIndicator()
            LoadingScreen.sharedInstance.hideIndicator()
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail"{
            guard let newVC = segue.destination as? BusinessDetailViewController else {
               return
            }
            
            newVC.businesVM = self.selectedBusinessVM
            
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        selectedBusinessVM = listBusinessVM.modelAt(indexPath.row)
        //get data buat businesVM
//        guard let idSelect = selectedBusinessVM?.item.id else {
//            return
//        }
//        
//        getBusinessDetail(id: idSelect)
        
        
        
        
        
        
        self.performSegue(withIdentifier: "goToDetail", sender: ListBusinessViewController.self)
    }
    
    
}
