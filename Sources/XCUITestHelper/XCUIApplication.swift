//
//  XCUIApplication.swift
//  XCUITestHelper
//
//  Created by Wesley de Groot on 2024-08-08.
//  https://wesleydegroot.nl
//
//  https://github.com/0xWDG/XCUITestHelper
//  MIT License
//

#if canImport(XCTest)
import XCTest
import Foundation

extension XCUIApplication {
    /// Navigate back
    public func navigateBack() {
        self.navigationBars.buttons.element(boundBy: 0).tap()
    }

    /// Set language of test to
    ///
    /// - Parameter to: language
    public func setLanguage(to language: Locale.LanguageCode) {
        self.launchArguments += ["-AppleLanguages", "(\(language.identifier))"]
        self.launchArguments += ["-AppleLocale", "\"\(language.identifier)\""]
    }
}

#endif
