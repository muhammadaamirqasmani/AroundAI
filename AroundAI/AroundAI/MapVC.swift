//
//  MapVC.swiftca
//  tapping view
//
//  Created by admin on 15/0/Users/admin/Desktop/AroundAI/AroundAI/AroundAI9/2017.
//  Copyright © 2017 MuhammadAamir. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class MapVC: UIViewController {
    
    
    var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var location: CLLocation?
    var zoomLevel: Float = 17.5
    var placesClient: GMSPlacesClient!
    var camera: GMSCameraPosition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
  }
    //Load functions in view did load
    func setupView (){
        _loadView()
        _marker()
        _initializeLocation()
    }
    
    
    func _initializeLocation (){
    locationManager = CLLocationManager()
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.distanceFilter = 50
    locationManager.startUpdatingLocation()
    locationManager.delegate = self
        
    placesClient = GMSPlacesClient.shared()
    }
    
    //Load Google Map
    func _loadView(){
        self.camera = GMSCameraPosition.camera(withLatitude: 10, longitude: 10, zoom: zoomLevel, bearing: 30, viewingAngle: 40)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        
       view = mapView
        }
    
    // Create a marker
        func _marker(){
            let marker = GMSMarker()
            print(self.location?.coordinate.latitude)
            marker.position = CLLocationCoordinate2D(latitude: 24.861462 , longitude: 67.009939)
            marker.title = "MyLocation"
            marker.snippet = "This Is My Location"
            marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
            marker.icon = GMSMarker.markerImage(with: .green)
            marker.tracksInfoWindowChanges = true
            marker.map = self.mapView
        }
    
    
    
}




extension MapVC: CLLocationManagerDelegate{

    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last!
        print("Location: \(String(describing: location))")
        
        self.camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!,longitude: (location?.coordinate.longitude)!,zoom: zoomLevel, bearing: 30, viewingAngle: 40)
    
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        marker.title = "AroundAI Here"
        marker.snippet = "AI is Arounding You"
        marker.tracksInfoWindowChanges = true
        marker.icon = GMSMarker.markerImage(with: .blue)
        marker.map = mapView
        
        mapView.animate(to: camera)

    }
    
//    // Handle authorization for the location manager.
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .restricted:
//            print("Location access was restricted.")
//        case .denied:
//            print("User denied access to location.")
//            // Display the map using the default location.
//            mapView.isHidden = false
//        case .notDetermined:
//            print("Location status not determined.")
//        case .authorizedAlways: fallthrough
//        case .authorizedWhenInUse:
//            print("Location status is OK.")
//        }
//    }
    


    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }

}


