//
//  XCUIElementQuery.swift
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

extension XCUIElementQuery {
    /// The last element that matches the query.
    public var lastMatch: XCUIElement {
        return element(boundBy: count - 1)
    }

    /// An radom element that matches the query.
    public var random: XCUIElement {
        return element(boundBy: Int.random(in: 0 ..< count))
    }

    /// Returns an element that will use the index provided
    ///
    /// - Parameters:
    ///   - index: The index of element to access.
    public subscript(_ index: Int) -> XCUIElement {
        return element(boundBy: index)
    }

    /// Print all elements
    func printAllElements() {
        print(self.debugDescription)
    }
}

#endif
