//
//  Placemark+Category.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public extension Placemark {
	
	enum Category: String, Codable, Hashable, DefaultCaseDecodable {
		
		case unknown
		case spot
		case facility
		case miscellaneous = "misc"
		
		public static var defaultCase: Self = .unknown
		
		public init(for kind: Placemark.Kind) throws {
			self = try kind.internal(in: Locale.en).category
		}
		
	}
	
}

/// Extend for testing purposes
extension Placemark.Category: CaseIterable {}
