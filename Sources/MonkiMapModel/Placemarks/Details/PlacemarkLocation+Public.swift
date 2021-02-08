//
//  PlacemarkLocation+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public extension Placemark.Location {
	
	struct Public: Codable, Equatable {
		public let city, country: String
	}
	
}