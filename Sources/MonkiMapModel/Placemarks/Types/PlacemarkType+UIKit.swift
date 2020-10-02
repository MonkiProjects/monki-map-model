//
//  PlacemarkType+UIKit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension PlacemarkType {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiIcon: UIImage? {
		return UIImage(named: iconName, in: .module, compatibleWith: nil)
	}
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiGlyph: UIImage? {
		return UIImage(named: glyphName, in: .module, compatibleWith: nil)
	}
	
	@available(iOS 13.0, *)
	public var uiColor: UIColor {
		do {
			return try self.asPrivate(in: Locale.en).category.uiColor
		} catch {
			return .systemRed
		}
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public func uiColor(publicationStatus: PlacemarkPublicationStatus) -> UIColor {
		do {
			return try self.asPrivate(in: Locale.en)
				.category.uiColor(publicationStatus: publicationStatus)
		} catch {
			return .systemRed
		}
	}
	
}

extension PlacemarkType.Localized {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiIcon: UIImage? { id.uiIcon }
	
	@available(iOS 13.0, *)
	public var uiColor: UIColor { id.uiColor }
	
}
#endif
