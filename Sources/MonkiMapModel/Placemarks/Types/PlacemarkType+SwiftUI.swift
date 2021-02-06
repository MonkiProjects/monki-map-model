//
//  PlacemarkType+SwiftUI.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

extension PlacemarkType {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var icon: Image {
		return Image(iconName, bundle: .fixedModule)
	}
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var glyph: Image {
		return Image(glyphName, bundle: .fixedModule)
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var color: Color {
		do {
			return try self.asPrivate(in: Locale.en).category.color
		} catch {
			return .red
		}
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public func color(publicationStatus: PlacemarkPublicationStatus) -> Color {
		if publicationStatus.isLocal {
			return .gray
		} else {
			do {
				return try self.asPrivate(in: Locale.en)
					.category.color(publicationStatus: publicationStatus)
			} catch {
				return .red
			}
		}
	}
	
}

extension PlacemarkType.Localized {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var icon: Image? { id.icon }
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var glyph: Image? { id.glyph }
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var color: Color { id.color }
	
}
#endif