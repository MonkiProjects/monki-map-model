//
//  Facility.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public struct Facility: LocalizedPlacemarkProtocol, Hashable, Codable {
	
	public let id: UUID
	public let title: String
	public let caption: String?
	public let latitude: Double
	public let longitude: Double
	public let creator: MPUser.Public.Small?
	public let createdAt: Date
	public let publicationStatus: PlacemarkPublicationStatus
	public let images: [URL]
	public let satelliteImage: URL?
	public let city: String?
	public let country: String?
	public let type: PlacemarkType.Localized
	public let category: PlacemarkCategory.Localized
	public let features: [PlacemarkFeature.Localized]
	public let goodForTraining: [ParkourTechnique.Localized]
	public let benefits: [PlacemarkBenefit.Localized]
	public let hazards: [PlacemarkHazard.Localized]
	public let url: URL?
	public let htmlUrl: URL?
	public let isLiked: Bool
	public let isFavorited: Bool
	/// Used to update data client-side
	public let updatedAt: Date
	
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
