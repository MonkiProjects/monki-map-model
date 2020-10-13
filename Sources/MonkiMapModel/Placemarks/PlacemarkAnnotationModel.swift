//
//  PlacemarkAnnotationModel.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 02/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public struct PlacemarkAnnotationModel: Codable, Hashable, Identifiable {
	
	public let id: UUID
	public let title: String
	public let latitude: Double
	public let longitude: Double
	public let publicationStatus: PlacemarkPublicationStatus
	public let type: PlacemarkType
	public let category: PlacemarkCategory
	public let isLiked: Bool
	public let isFavorited: Bool
	/// Used to update data client-side
	public let updatedAt: Date
	
	public init(
		id: UUID = UUID(),
		title: String,
		latitude: Double,
		longitude: Double,
		publicationStatus: PlacemarkPublicationStatus = .local,
		type: PlacemarkType = .defaultCase,
		category: PlacemarkCategory = .defaultCase,
		isLiked: Bool = false,
		isFavorited: Bool = false,
		updatedAt: Date = Date()
	) {
		self.id = id
		self.title = title
		self.latitude = latitude
		self.longitude = longitude
		self.publicationStatus = publicationStatus
		self.type = type
		self.category = category
		self.isLiked = isLiked
		self.isFavorited = isFavorited
		self.updatedAt = updatedAt
	}
	
	// MARK: Equatable
	
	public static func == (lhs: Self, rhs: Self) -> Bool {
		return lhs.id == rhs.id
	}
	
}

extension PlacemarkAnnotationModel: PlacemarkProtocol {
	
	public var _type: PlacemarkType { type }
	public var _category: PlacemarkCategory { category }
	
}
