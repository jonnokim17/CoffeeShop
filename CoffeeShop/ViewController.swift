//
//  ViewController.swift
//  CoffeeShop
//
//  Created by Jonathan Kim on 11/27/15.
//  Copyright © 2015 Jonathan Kim. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!

    var locationManager: CLLocationManager?
    let distanceSpan: Double = 500

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        mapView.delegate = self
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if locationManager == nil {
            locationManager = CLLocationManager()

            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager?.requestAlwaysAuthorization()
            locationManager?.distanceFilter = 50
            locationManager?.startUpdatingLocation()
        }
    }

    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, distanceSpan, distanceSpan)
        mapView.setRegion(region, animated: true)
    }
}

