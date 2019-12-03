//
//  MapView.swift
//  Shops
//
//  Created by Tommy Troest on 30/11/2019.
//  Copyright © 2019 Tommy Troest. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    
    fileprivate let locationManager: CLLocationManager = CLLocationManager()
    
    // Setting Map View
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // Function for updating the map with annotations and user location
    func updateUIView(_ view: MKMapView, context: Context) {
        let shopList = decodeJson()
        for shop in shopList {
            view.addAnnotation(createShopAnnotation(shop: shop))
        }
        setUserLocation(mapView: view)
    }
    
    // Function for setting up user location tracking.
    func setUserLocation(mapView: MKMapView) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        let regionRadius: CLLocationDistance = 500
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
    }
    
    // Function for setting an annotation
    func createShopAnnotation(shop: Shop) -> MKAnnotation {
        let annotation = MKPointAnnotation()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(shop.address.addressAsString()) { placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            var coord: CLLocationCoordinate2D = CLLocationCoordinate2D()
            coord.latitude = lat!
            coord.longitude = lon!
            annotation.coordinate = coord
            annotation.title = shop.name
            annotation.subtitle = shop.category
        }
        return annotation
    }
    
    // Function for getting shops from data source
    func decodeJson() -> [Shop] {
        var shops: [Shop] = []
        let path = Bundle.main.url(forResource: "shops", withExtension: "json")
        let jsonData = try? Data(contentsOf: path!)
        let decoder = JSONDecoder()
        
        do {
            shops = try decoder.decode([Shop].self, from: jsonData!)
        } catch {
            print(error.localizedDescription)
        }
        return shops
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
