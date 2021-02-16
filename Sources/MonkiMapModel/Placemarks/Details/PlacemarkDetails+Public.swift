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
		
		public typealias Properties = [Placemark.Property.Localized]
		
		public let caption: String
		public let satelliteImage: URL
		public let images: [URL]
		public let location: Placemark.Location.Public
		public let features, goodForTraining, benefits, hazards: Properties
		
		public var allImages: [URL] { images + [satelliteImage] }
		
		public init(
			caption: String,
			satelliteImage: URL,
			images: [URL] = [],
			location: Placemark.Location.Public,
			features: Properties = [],
			goodForTraining: Properties = [],
			benefits: Properties = [],
			hazards: Properties = []
		) {
			self.caption = caption
			self.satelliteImage = satelliteImage
			self.images = images
			self.location = location
			self.features = features
			self.goodForTraining = goodForTraining
			self.benefits = benefits
			self.hazards = hazards
		}
		
	}
	
}
