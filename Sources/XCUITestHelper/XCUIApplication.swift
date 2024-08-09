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
    /// 
    /// Navigate back to the previous screen.
    /// 
    /// - Note: This will tap the first button in the navigation bar.
    public func navigateBack() {
        if self.navigationBars.buttons.count == 0 {
            return
        }

        self.navigationBars.buttons.element(boundBy: 0).tap()
    }

    /// Set the language for the UITest.
    /// 
    /// This function will set the language for the UITest.
    /// To run the UITest in a different language, you can use this function.
    /// 
    /// - Parameter to: language to set the UITest to.
    /// 
    /// - Note: Usually you want to call this function in the `setUp` function of your UITest.
    public func setLanguage(to language: Locale.LanguageCode) {
        self.launchArguments += ["-AppleLanguages", "(\(language.identifier))"]
        self.launchArguments += ["-AppleLocale", "\"\(language.identifier)\""]
    }
}

#endif
