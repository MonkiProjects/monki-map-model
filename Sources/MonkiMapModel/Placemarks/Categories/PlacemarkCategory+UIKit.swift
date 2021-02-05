//
//  PlacemarkCategory+UIKit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension PlacemarkCategory {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiIcon: UIImage? {
		if let iconName = self.iconName {
			return UIImage(named: iconName, in: .fixedModule, compatibleWith: nil)
		} else {
			return nil
		}
	}
	
	@available(iOS 11.0, *)
	public var uiColor: UIColor { UIColor(named: rawValue, in: .fixedModule, compatibleWith: nil) ?? .systemRed }
	
	@available(iOS 11.0, *)
	public func uiColor(publicationStatus: PlacemarkPublicationStatus) -> UIColor {
		if publicationStatus.isLocal {
			return .systemGray
		} else {
			return self.uiColor
		}
	}
	
}

extension PlacemarkCategory.Localized {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiIcon: UIImage? { id.uiIcon }
	
	@available(iOS 11.0, *)
	public var uiColor: UIColor { id.uiColor }
	
}
#endif
