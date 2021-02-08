//
//  PlacemarkProperty+Internal.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 24/06/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Property {
	
	struct Internal: PlistDecodable, Identifiable {
		
		static let fileName = "PlacemarkProperties"
		
		let id, title: String
		let kind: Kind
		
	}
	
}
