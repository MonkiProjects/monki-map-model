//
//  DrinkingWater.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 29/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel

public struct DrinkingWater: PlacemarkProtocol, Hashable, Codable {
	
	public let id: UUID
	public let title: String
	public let caption: String? = nil
	public let latitude: Double
	public let longitude: Double
	public let creator: MPUser.Public.Small?
	public let createdAt: Date
	public let publicationStatus: PlacemarkPublicationStatus
	public let images: [URL]
	public let satelliteImage: URL?
	public let city: String?
	public let country: String?
	public let type: PlacemarkType
	public let category: PlacemarkCategory
	public let features = [PlacemarkFeature]()
	public let goodForTraining = [ParkourTechnique]()
	public let benefits = [PlacemarkBenefit]()
	public let hazards = [PlacemarkHazard]()
	public let url: URL?
	public let htmlUrl: URL?
	public let isLiked: Bool
	public let isFavorited: Bool
	public let updatedAt: Date
	
	public init(
		id: UUID,
		title: String,
		latitude: Double,
		longitude: Double,
		creator: MPUser.Public.Small? = nil,
		creation: Date = Date(),
		publicationStatus: PlacemarkPublicationStatus = .local,
		images: [URL] = [],
		satelliteImage: URL? = nil,
		city: String? = nil,
		country: String? = nil,
		type: PlacemarkType = .defaultCase,
		category: PlacemarkCategory = .defaultCase,
		url: URL? = nil,
		htmlUrl: URL? = nil,
		isLiked: Bool = false,
		isFavorited: Bool = false,
		updatedAt: Date = Date()
	) {
		self.id = id
		self.title = title
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
		self.url = url
		self.htmlUrl = htmlUrl
		self.isLiked = isLiked
		self.isFavorited = isFavorited
		self.updatedAt = updatedAt
	}
	
	// MARK: Decodable
	
	private enum CodingKeys: String, CodingKey {
		case id
		case title, caption, latitude, longitude, creator, createdAt, publicationStatus
		case images, satelliteImage, city, country
		case type, category, features, goodForTraining, benefits, hazards
		case url, htmlUrl, isLiked, isFavorited, updatedAt
	}
	
}
