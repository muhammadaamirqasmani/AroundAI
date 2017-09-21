//
//  ARKitVC.swift
//  tapping view
//
//  Created by admin on 15/09/2017.
//  Copyright © 2017 MuhammadAamir. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker
class ARKitVC: UIViewController {

    
//    
//    var placesClient: GMSPlacesClient!
//    
//    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var addressLabel: UILabel!
//    
    override func viewDidLoad() {
       super.viewDidLoad()
//        placesClient = GMSPlacesClient.shared()
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    @IBAction func pickPlace(_ sender: UIButton) {
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePickerViewController(config: config)
        
        present(placePicker, animated: true, completion: nil)
    } 
//    // Add a UIButton in Interface Builder, and connect the action to this function.
//    @IBAction func getCurrentPlace(_ sender: UIButton) {
//        
//        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
//            if let error = error {
//                print("Pick Place error: \(error.localizedDescription)")
//                return
//            }
//            
//            self.nameLabel.text = "No current place"
//            self.addressLabel.text = ""
//            
//            if let placeLikelihoodList = placeLikelihoodList {
//                let place = placeLikelihoodList.likelihoods.first?.place
//                if let place = place {
//                    self.nameLabel.text = place.name
//                    self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
//                        .joined(separator: "\n")
//                }
//            }
//        })
//    }
}

extension ARKitVC: GMSPlacePickerViewControllerDelegate{
    // To receive the results from the place picker 'self' will need to conform to
    // GMSPlacePickerViewControllerDelegate and implement this code.
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        
        print("Place name \(place.name)")
        print("Place address \(String(describing: place.formattedAddress))")
        print("Place attributions \(String(describing: place.attributions))")
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        
        print("No place selected")
    }
}
