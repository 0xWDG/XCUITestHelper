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

extension XCUIElementQuery {
    /// The last element that matches the query.
    public var lastMatch: XCUIElement {
        return element(boundBy: count - 1)
    }

    /// Returns an element that will use the index provided
    ///
    /// - Parameters:
    ///   - index: The index of element to access.
    public subscript(_ index: Int) -> XCUIElement {
        return element(boundBy: index)
    }
}

#endif
