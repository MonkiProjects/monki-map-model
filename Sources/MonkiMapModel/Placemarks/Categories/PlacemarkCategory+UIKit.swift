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
			return UIImage(named: iconName, in: .module, compatibleWith: nil)
		} else {
			return nil
		}
	}
	
	@available(iOS 11.0, *)
	public var uiColor: UIColor { UIColor(named: rawValue, in: .module, compatibleWith: nil) ?? .systemRed }
	
}

extension PlacemarkCategory.Localized {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiIcon: UIImage? { id.uiIcon }
	
	@available(iOS 11.0, *)
	public var uiColor: UIColor { id.uiColor }
	
}
#endif
