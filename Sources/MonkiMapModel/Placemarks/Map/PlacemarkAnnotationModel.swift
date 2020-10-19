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
	public var title: String
	public var latitude: Double
	public var longitude: Double
	public var publicationStatus: PlacemarkPublicationStatus
	public var type: PlacemarkType
	public var category: PlacemarkCategory
	public var isLiked: Bool
	public var isFavorited: Bool
	public var userCount: Int
	/// Used to update data client-side
	public var updatedAt: Date
	
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
		userCount: Int = 0,
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
		self.userCount = userCount
		self.updatedAt = updatedAt
	}
	
}

extension PlacemarkAnnotationModel: PlacemarkProtocol {
	
	public var _type: PlacemarkType { type }
	public var _category: PlacemarkCategory { category }
	
}
