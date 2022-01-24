//
//  SearchView.swift
//  business-app
//
//  Created by Edwin Niwarlangga on 24/01/22.
//

import UIKit
protocol OverlayDoneProtocol{
    func delegateAndSearch(searchTerm : String)
}

class OverlaySearchView: UIViewController {
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    //    var delegate : OverlayButtonProtocol?
    
    @IBAction func buttonDonePressed(_ sender: Any) {
        
        switch searchTypeSegmentedControl.selectedSegmentIndex
        {
        case 0:
            guard let location = locationTextField.text, let businessName = businessNameTextfield.text else{return}
            searchTerm = "location=\(location)&term=\(businessName)"
        case 1:
                guard let location = locationTextField.text else{return}
                searchTerm = "location=\(location)"
        case 2:
            searchTerm = "cancelled";
        default:
            break;
        }
        
        self.dismiss(animated: true) {
            self.delegate?.delegateAndSearch(searchTerm: self.searchTerm)
        }
        
        
    }
    @IBOutlet weak var labelSearch: UILabel!
    @IBOutlet weak var buttonDone: UIButton!
    @IBOutlet weak var searchTypeSegmentedControl: UISegmentedControl!
    @IBAction func segmentControlPressed(_ sender: UISegmentedControl) {
        switch searchTypeSegmentedControl.selectedSegmentIndex
        {
        case 0:
            //Only Business Name and Location
            self.stackViewLocation.isHidden = false
            self.locationLabel.isHidden = false
            self.locationTextField.isHidden = false
            
            self.stackViewbusinessName.isHidden = false
            self.businessNameLabel.isHidden = false
            self.businessNameTextfield.isHidden = false
            
            self.stackViewCuisineType.isHidden = true
        case 1:
            self.stackViewLocation.isHidden = false
            self.locationLabel.isHidden = false
            self.locationTextField.isHidden = false
            
            self.stackViewbusinessName.isHidden = true
            self.businessNameLabel.isHidden = true
            self.businessNameTextfield.isHidden = true
            
            self.stackViewCuisineType.isHidden = false
        case 2:
            self.stackViewLocation.isHidden = false
            self.locationLabel.isHidden = false
            self.locationTextField.isHidden = false
            
            self.stackViewbusinessName.isHidden = false
            self.businessNameLabel.isHidden = false
            self.businessNameTextfield.isHidden = false
            
            self.stackViewCuisineType.isHidden = true
        default:
            break;
        }
    }
    
    @IBOutlet weak var stackViewLocation : UIStackView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!
    
    
    @IBOutlet weak var stackViewbusinessName : UIStackView!
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var businessNameTextfield: UITextField!
    
    @IBOutlet weak var stackViewCuisineType : UIStackView!
    @IBOutlet weak var cuisineTypeLabel: UILabel!
    @IBOutlet weak var cuisineTypeTextfield: UITextField!
    
    var delegate : OverlayDoneProtocol?
    var searchTerm : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setSegmentedControl()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
    }
    
    func setSegmentedControl(){
        self.stackViewLocation.isHidden = false
        self.locationLabel.isHidden = false
        self.locationTextField.isHidden = false
        
        self.stackViewbusinessName.isHidden = false
        self.businessNameLabel.isHidden = false
        self.businessNameTextfield.isHidden = false
        
        self.stackViewCuisineType.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 300)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        //function search
        textField.resignFirstResponder()
        
        guard let searchText = textField.text else { return false}
//        presenter?.searchImage(querySearch: searchText)
        return true
    }
    
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(OverlaySearchView.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
