//
//  PlacemarkProperty+All.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 17/02/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

extension Placemark.Property {
	
	public static func all(in locale: Locale = .default) -> [Self] {
		return Internal.all(in: locale)
			.map { Self.init(id: $0.id, kind: $0.kind) }
	}
	
	public static func all(kind: Kind, in locale: Locale = .default) -> [Self] {
		return Internal.all(in: locale)
			.filter { $0.kind == kind }
			.map { Self.init(id: $0.id, kind: $0.kind) }
	}
	
}
