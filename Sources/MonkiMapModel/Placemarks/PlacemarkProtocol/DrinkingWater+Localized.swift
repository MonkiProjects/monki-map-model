//
//  File.swift
//  
//
//  Created by Rémi Bardon on 02/10/2020.
//

import Foundation
import MonkiProjectsModel

extension DrinkingWater {
	
	public enum Localized {
		
		public struct Small: SmallPlacemarkProtocol, Hashable, Codable {
			
			public let id: UUID
			public let title: String
			public let latitude: Double
			public let longitude: Double
			public let publicationStatus: PlacemarkPublicationStatus
			public let type: PlacemarkType.Localized
			public let category: PlacemarkCategory.Localized
			public let isLiked: Bool
			public let isFavorited: Bool
			public let updatedAt: Date
			
			public init(
				id: UUID,
				title: String,
				latitude: Double,
				longitude: Double,
				publicationStatus: PlacemarkPublicationStatus = .local,
				// swiftlint:disable:next force_try
				type: PlacemarkType.Localized = try! PlacemarkType.defaultCase.localized(),
				// swiftlint:disable:next force_try
				category: PlacemarkCategory.Localized = try! PlacemarkCategory.defaultCase.localized(),
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
			
			// MARK: Decodable
			
			private enum CodingKeys: String, CodingKey {
				case id
				case title, latitude, longitude, publicationStatus
				case type, category
				case isLiked, isFavorited, updatedAt
			}
			
		}
		
		public struct Full: FullPlacemarkProtocol, Hashable, Codable {
			
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
			public let type: PlacemarkType.Localized
			public let category: PlacemarkCategory.Localized
			public let features = [PlacemarkFeature.Localized]()
			public let goodForTraining = [ParkourTechnique.Localized]()
			public let benefits = [PlacemarkBenefit.Localized]()
			public let hazards = [PlacemarkHazard.Localized]()
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
				// swiftlint:disable:next force_try
				type: PlacemarkType.Localized = try! PlacemarkType.defaultCase.localized(),
				// swiftlint:disable:next force_try
				category: PlacemarkCategory.Localized = try! PlacemarkCategory.defaultCase.localized(),
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
			
			// MARK: Equatable
			
			public static func == (lhs: Self, rhs: Self) -> Bool {
				return lhs.id == rhs.id
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
		
	}
	
	public func localizedSmall(in locale: Locale = Locale.current) throws -> Localized.Small {
		return .init(
			id: id,
			title: title,
			latitude: latitude,
			longitude: longitude,
			publicationStatus: publicationStatus,
			type: try type.localized(in: locale),
			category: try category.localized(in: locale),
			isLiked: isLiked,
			isFavorited: isFavorited,
			updatedAt: updatedAt
		)
	}
	
	public func localizedSmall(in locale: Locale = Locale.current) throws -> Localized.Full {
		return .init(
			id: id,
			title: title,
			latitude: latitude,
			longitude: longitude,
			creator: creator,
			creation: createdAt,
			publicationStatus: publicationStatus,
			images: images,
			satelliteImage: satelliteImage,
			city: city,
			country: country,
			type: try type.localized(in: locale),
			category: try category.localized(in: locale),
			url: url,
			htmlUrl: htmlUrl,
			isLiked: isLiked,
			isFavorited: isFavorited,
			updatedAt: updatedAt
		)
	}
	
}
