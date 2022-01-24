//
//  ListBusinessViewController.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 21/01/22.
//

import Foundation
import UIKit

enum SortingValue: String,CaseIterable{
    case bestMatch = "best_match"
    case review = "review_count"
    case rating = "rating"
    case distance = "distance"
}

class ListBusinessViewController : UIViewController, UITextFieldDelegate{
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBAction func buttonSearchPressed(_ sender: Any) {
//        click / enter has same function
        PresentActionSheetForSearch()
        
    }
    
    @IBOutlet weak var buttonFilter: UIButton!
    @IBAction func buttonFilterPressed(_ sender: Any) {
//        click / enter has same function
        PresentActionSheetSort()
    }
    
    @IBOutlet weak var emptyState: UIView!
    @IBOutlet weak var listBusinessTableView: UITableView!
    
    // MARK: Variable
    var listBusinessVM = ListBusinessViewModel()
    var selectedIndex : Int = 0
    var selectedBusinessVM : BusinessViewModel?
    var isLoading = false
    var searchType : String = ""
    var keyword = "location=NYC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        setUINavigation()
//        searchTextField.delegate = self
        registerCell()
        getBusiness(keyword: self.keyword,isNext: false) // just set default
    }
    
    
    func setUINavigation(){
        navigationView.backgroundColor = UIColor.white
        navigationView.layer.shadowColor = UIColor.red.cgColor
        navigationView.layer.shadowOffset = CGSize(width: 1, height: 1)
        navigationView.layer.shadowRadius = 1
        navigationView.layer.shadowOpacity = 5
    }
    
    
    
    func registerCell(){
        listBusinessTableView.register(UINib.init(nibName: "ListBusinessTableViewCell", bundle: nil), forCellReuseIdentifier: "listBusinessTableViewCell")
        listBusinessTableView.delegate = self
        listBusinessTableView.dataSource = self
        
    }
    
    func checkState(){
        if(listBusinessVM.numberOfRows(0) == 0){
            emptyState.isHidden = false
            listBusinessTableView.isHidden = true
        }else{
            emptyState.isHidden = true
            listBusinessTableView.isHidden = false
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ListBusinessViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail"{
            guard let newVC = segue.destination as? BusinessDetailViewController else {
               return
            }
            
            newVC.businesVM = self.selectedBusinessVM
            
            
        }
    }
    
    private func PresentActionSheetForSearch(){
        
        let slideVC = OverlaySearchView()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        slideVC.delegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    private func PresentActionSheetSort(){
        
        let actionSheet = UIAlertController(title: "Sort By", message: "", preferredStyle: .actionSheet)
//        actionSheet.view.tintColor = Uicolor
        
        let sortByBestMatch = UIAlertAction(title: "Best Match", style: .default){ (action: UIAlertAction) in
            self.keyword += "&sort_by=\(SortingValue.bestMatch.rawValue)"
            self.getBusiness(keyword: self.keyword, isNext: false)
        }
        let sortByRating = UIAlertAction(title: "Rating", style: .default){ (action: UIAlertAction) in
            
            self.keyword += "&sort_by=\(SortingValue.rating.rawValue)"
            self.getBusiness(keyword: self.keyword, isNext: false)
        }
        let sortByReview = UIAlertAction(title: "Review", style: .default){ (action: UIAlertAction) in
            self.keyword += "&sort_by=\(SortingValue.review.rawValue)"
            self.getBusiness(keyword: self.keyword, isNext: false)
        }
        let sortByDistance = UIAlertAction(title: "Distance", style: .default){ (action: UIAlertAction) in
            self.keyword += "&sort_by=\(SortingValue.distance.rawValue)"
            self.getBusiness(keyword: self.keyword, isNext: false)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style:.cancel, handler: nil)
        
        
        actionSheet.addAction(sortByBestMatch)
        actionSheet.addAction(sortByRating)
        actionSheet.addAction(sortByDistance)
        actionSheet.addAction(sortByReview)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    
}


extension ListBusinessViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationSearchTypeViewController(presentedViewController: presented, presenting: presenting)
    }
}


extension ListBusinessViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        self.performSegue(withIdentifier: "goToDetail", sender: ListBusinessViewController.self)
    }
    
    
    //API doesn't have unlimited page
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == listBusinessVM.numberOfRows(0) - 4 && !isLoading && listBusinessVM.numberOfRows(0) >= 10{
//            isLoading = true
//
//            getBusiness(keyword: self.keyword, isNext: true)
//
//
//        }
//    }
    
    
}



// MARK: GET DATA
extension ListBusinessViewController{
    func getBusiness(keyword: String, isNext : Bool){
        isLoading = true
        LoadingScreen.sharedInstance.showIndicator()
        listBusinessVM.getBusinessFromKeyword(keyword: keyword,isNext: isNext) { _ in
           
            DispatchQueue.main.async {
                self.listBusinessTableView.reloadData()
                self.checkState()
                self.isLoading = false
                LoadingScreen.sharedInstance.hideIndicator()

            }
        }
    }
}

extension ListBusinessViewController : OverlayDoneProtocol{
    func delegateAndSearch(searchTerm: String) {
        self.keyword = searchTerm
        getBusiness(keyword: searchTerm, isNext: false)
    }
    
    
}
