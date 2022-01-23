//
//  CategoryTableViewCell.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 22/01/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var dataCategory : [Categories] = []
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
        categoryCollectionView.register(UINib.init(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryItemViewCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func resetUI(){
        
        
    }
    
    func setupUI(category : [Categories]){
        self.dataCategory = category
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
        }
    }
    
    
}

extension CategoryTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryItemViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.setupUI(category: dataCategory[indexPath.row].title ?? "")
        return cell
    }
    
    
}



// MARK: Collection view delegate Layout
extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var widthCell : CGSize = CGSize(width: 100, height: 100)
        
        if collectionView == self.categoryCollectionView{
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 20
            layout.invalidateLayout()
            
            widthCell =  CGSize(width: (self.categoryCollectionView.frame.width - 50) / 2 , height: 40) // Set your item size here
        }else{
            widthCell =  CGSize(width: 125 , height:150)
        }
        
        return widthCell
    }
}
