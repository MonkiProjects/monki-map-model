//
//  PlacemarkCategory+SwiftUI.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

extension PlacemarkCategory {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var icon: Image? {
		if let iconName = iconName {
			return Image(iconName, bundle: .fixedModule)
		} else {
			return nil
		}
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var color: Color { Color(rawValue, bundle: .fixedModule) }
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public func color(publicationStatus: PlacemarkPublicationStatus) -> Color {
		if publicationStatus.isLocal {
			return .gray
		} else {
			return self.color
		}
	}
	
}

extension PlacemarkCategory.Localized {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var icon: Image? { id.icon }
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var color: Color { id.color }
	
}
#endif
