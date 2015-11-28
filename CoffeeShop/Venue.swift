//
//  Venue.swift
//  CoffeeShop
//
//  Created by Jonathan Kim on 11/28/15.
//  Copyright © 2015 Jonathan Kim. All rights reserved.
//

import Foundation
import RealmSwift
import MapKit

class Venue: Object {
    dynamic var id = ""
    dynamic var name = ""

    dynamic var latitude: Float = 0
    dynamic var longitude: Float = 0

    dynamic var address = ""

    var coordinates: CLLocation {
        return CLLocation(latitude: Double(latitude), longitude: Double(longitude))
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}