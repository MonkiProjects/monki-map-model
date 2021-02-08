//
//  PlacemarkDetails+Public.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 05/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark.Details {
	
	struct Public: Codable {
		
		public let caption: String
		public let satelliteImage: URL
		public let images: [URL]
		public let location: Placemark.Location.Public?
		public let features, goodForTraining, benefits, hazards: [Placemark.Property.Localized]
		
		public var allImages: [URL] { images + [satelliteImage] }
	}
	
}
