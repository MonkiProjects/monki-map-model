//
//  PlacemarkProtocol+SwiftUI.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI

extension PlacemarkProtocol {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var icon: Image? {
		#if !os(macOS)
		if publicationStatus == .draft {
			return Image(systemName: "doc.text")
		}
		#endif
		
		if let icon = type.icon {
			return icon
		} else {
			return nil
		}
	}
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var glyph: Image? {
		#if !os(macOS)
		if publicationStatus == .draft {
			return Image(systemName: "doc.text")
		}
		#endif
		
		if let glyph = type.glyph {
			return glyph
		} else {
			return nil
		}
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var color: Color? {
		if isLocal {
			return .gray
		} else {
			return category.color
		}
	}
	
}
#endif
