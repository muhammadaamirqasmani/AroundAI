//
//  PlacePickingVC.swift
//  AroundAI
//
//  Created by admin on 18/09/2017.
//  Copyright © 2017 MuhammadAamir. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker

class PlacePickingVC: UIViewController {

//   
//    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var addressLabel: UILabel!
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//    // Add a UIButton in Interface Builder, and connect the action to this function.
//    @IBAction func pickPlace(_ sender: UIButton) {
//        
//        let center = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
//        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
//        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
//        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
//        let config = GMSPlacePickerConfig(viewport: viewport)
//        let placePicker = GMSPlacePicker(config: config)
//        
//        
//        placePicker.pickPlace(callback: {(place, error) -> Void in
//            if let error = error {
//                print("Pick Place error: \(error.localizedDescription)")
//                return
//            }
//            
//            if let place = place {
//                self.nameLabel.text = place.name
//                self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
//                    .joined(separator: "\n")
//            } else {
//                self.nameLabel.text = "No place selected"
//                self.addressLabel.text = ""
//            }
//        })
//    }
    

    
    @IBAction func pickPlace(_ sender: UIButton) {
        var config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePickerViewController(config: config)
        
        
        let center = CLLocationCoordinate2D(latitude: -33.865143, longitude: 151.2099)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001,
                                               longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001,
                                               longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
         config = GMSPlacePickerConfig(viewport: viewport)
        
        present(placePicker, animated: true, completion: nil)
    }
    
    
}

extension PlacePickingVC: GMSPlacePickerViewControllerDelegate{
    // To receive the results from the place picker 'self' will need to conform to
    // GMSPlacePickerViewControllerDelegate and implement this code.
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        
        print("Place name \(place.name)")
        print("Place address \(place.formattedAddress)")
        print("Place attributions \(place.attributions)")
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        
        print("No place selected")
    }

}

