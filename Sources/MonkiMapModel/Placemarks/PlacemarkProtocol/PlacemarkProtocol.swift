//
//  PlacemarkProtocol.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation.NSUUID

public protocol PlacemarkProtocol {
	
	var id: UUID { get }
	var publicationStatus: PlacemarkPublicationStatus { get }
	
	// swiftlint:disable identifier_name
	var _type: PlacemarkType { get }
	var _category: PlacemarkCategory { get }
	// swiftlint:enable identifier_name
	
}

public protocol LocalizedPlacemarkProtocol: PlacemarkProtocol {
	
	var type: PlacemarkType.Localized { get }
	var category: PlacemarkCategory.Localized { get }
	
	// swiftlint:disable identifier_name
	var _type: PlacemarkType { get }
	var _category: PlacemarkCategory { get }
	// swiftlint:enable identifier_name
	
}

extension LocalizedPlacemarkProtocol {
	
	// swiftlint:disable identifier_name
	public var _type: PlacemarkType { type.id }
	public var _category: PlacemarkCategory { category.id }
	// swiftlint:enable identifier_name
	
}
