//
//  PlacemarkKind+Localized.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 10/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public extension Placemark.Kind {
	
	/// A localized `Placemark.Kind`.
	/// It's used by APIs to return localized content.
	///
	/// # Example #
	/// ```json
	/// {
	///     "id": "training_spot",
	///     "title": "Training Spot"
	/// }
	/// ```
	struct Localized: Codable, Equatable, Identifiable {
		
		public let id: Placemark.Kind
		public let title: String
		
		fileprivate init(id: ID, title: String) {
			self.id = id
			self.title = title
		}
		
	}
	
	func localized(in locale: Locale = Locale.current) throws -> Localized {
		return Localized(id: self, title: try self.title(in: locale))
	}
	
}
