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
    /// 
    /// This is the last element that matches the query.
    public var lastMatch: XCUIElement {
        return element(boundBy: count - 1)
    }

    /// An random element that matches the query.
    /// 
    /// This is an random element that matches the query.
    public var random: XCUIElement {
        return element(boundBy: Int.random(in: 0 ..< count))
    }

    /// Returns an element that will use the index provided
    /// 
    /// This functions returns an element that will use the index provided.
    ///
    /// - Parameter index: The index of element to access.
    public subscript(_ index: Int) -> XCUIElement {
        return element(boundBy: index)
    }

    /// Print all elements
    /// 
    /// This function will print all elements in the query.
    /// 
    /// - Note: This function is for debugging purposes only.
    func printAllElements() {
        print(self.debugDescription)
    }
}

#endif
