//
//  Placemark+Create.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 09/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark {
	
	public struct Create: Codable {
		
		public let name: String
		public let latitude, longitude: Double
		public let kind: Kind
		public let caption: String
		public let images: [URL]?
		public let features, goodForTraining, benefits, hazards: [String]?
		
		public init(
			name: String,
			latitude: Double,
			longitude: Double,
			kind: Kind,
			caption: String,
			images: [URL]? = nil,
			features: [String]? = nil,
			goodForTraining: [String]? = nil,
			benefits: [String]? = nil,
			hazards: [String]? = nil
		) {
			self.name = name
			self.latitude = latitude
			self.longitude = longitude
			self.kind = kind
			self.caption = caption
			self.images = images
			self.features = features
			self.goodForTraining = goodForTraining
			self.benefits = benefits
			self.hazards = hazards
		}
		
	}
	
}
