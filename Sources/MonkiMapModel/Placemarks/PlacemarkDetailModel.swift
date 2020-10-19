//
//  PlacemarkDetailModel.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 16/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public struct PlacemarkDetailModel: Codable, Hashable, Identifiable {
	
	public let id: UUID
	public var title: String
	public var caption: String?
	public var latitude: Double
	public var longitude: Double
	public var creator: MPUser.Public.Small?
	public let createdAt: Date
	public var publicationStatus: PlacemarkPublicationStatus
	public var images: [URL]
	public var satelliteImage: URL?
	public var city: String?
	public var country: String?
	public var type: PlacemarkType.Localized
	public var category: PlacemarkCategory.Localized
	public var features: [PlacemarkFeature.Localized]
	public var goodForTraining: [ParkourTechnique.Localized]
	public var benefits: [PlacemarkBenefit.Localized]
	public var hazards: [PlacemarkHazard.Localized]
	public let url: URL?
	public let htmlUrl: URL?
	public var isLiked: Bool
	public var isFavorited: Bool
	/// Used to update data client-side
	public var updatedAt: Date
	
	public var allImages: [URL] {
		if let satelliteImage = satelliteImage {
			return images + [satelliteImage]
		} else {
			return images
		}
	}
	
	public init(
		id: UUID = UUID(),
		title: String,
		caption: String? = nil,
		latitude: Double,
		longitude: Double,
		creator: MPUser.Public.Small? = nil,
		creation: Date = Date(),
		publicationStatus: PlacemarkPublicationStatus = .local,
		images: [URL] = [],
		satelliteImage: URL? = nil,
		city: String? = nil,
		country: String? = nil,
		// swiftlint:disable:next force_try
		type: PlacemarkType.Localized = try! PlacemarkType.defaultCase.localized(),
		// swiftlint:disable:next force_try
		category: PlacemarkCategory.Localized = try! PlacemarkCategory.defaultCase.localized(),
		features: [PlacemarkFeature.Localized] = [],
		goodForTraining: [ParkourTechnique.Localized] = [],
		benefits: [PlacemarkBenefit.Localized] = [],
		hazards: [PlacemarkHazard.Localized] = [],
		url: URL? = nil,
		htmlUrl: URL? = nil,
		isLiked: Bool = false,
		isFavorited: Bool = false,
		updatedAt: Date = Date()
	) {
		self.id = id
		self.title = title
		self.caption = caption
		self.latitude = latitude
		self.longitude = longitude
		self.creator = creator
		self.createdAt = creation
		self.publicationStatus = publicationStatus
		self.images = images
		self.satelliteImage = satelliteImage
		self.city = city
		self.country = country
		self.type = type
		self.category = category
		self.features = features
		self.goodForTraining = goodForTraining
		self.benefits = benefits
		self.hazards = hazards
		self.url = url
		self.htmlUrl = htmlUrl
		self.isLiked = isLiked
		self.isFavorited = isFavorited
		self.updatedAt = updatedAt
	}
	
}

extension PlacemarkDetailModel: PlacemarkProtocol {
	
	public var _type: PlacemarkType { type.id }
	public var _category: PlacemarkCategory { category.id }
	
}
