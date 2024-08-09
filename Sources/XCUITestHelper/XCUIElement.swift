//
//  XCUIElement.swift
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

/// Actions that can be performed on an XCUIElement.
public enum XCUIElementAction {
    /// Send (last button)
    case send

    /// Clear (last button on input field)
    case clear

    /// Do nothing
    case none
}

extension XCUIElement {
    /// Does the element has keyboard focus?
    ///
    /// - Returns: boolean to indicate if the element has the current keyboard focus
    public var hasKeyboardFocus: Bool {
        return (self.value(forKey: "hasKeyboardFocus") as? Bool) ?? false
    }

    /// Type some text and submit
    ///
    /// - Parameter text: Text to type.
    /// - Parameter press: Should press "Continue", "Send", "Search", ...
    public func type(in textField: XCUIElement, text: String, action: XCUIElementAction = .send) {
        if textField.elementType == .textField ||
           textField.elementType == .secureTextField ||
           textField.elementType == .searchField {

            // Focus keyboard
            textField.tap()

            // Type text
            textField.typeText(text)

            switch action {
            case .send:
                // Send (last button)
                self.keyboards.buttons.lastMatch.tap()
            case .clear:
                // Clear (last button on input field)
                textField.buttons.lastMatch.tap()
            case .none:
                // Do nothing
                break
            }
        } else {
            fatalError("This element is a \(textField.elementType), expected a *Field.")
        }
    }

    /// Print all elements
    func printAllElements() {
        print(self.debugDescription)
    }

    /// Wait for a duration
    ///
    /// - Parameter duration: Duration to wait
    public func wait(for duration: TimeInterval) {
        let testCase = XCTestCase()
        let waitExpectation = testCase.expectation(description: "Waiting")
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            waitExpectation.fulfill()
        }
        testCase.waitForExpectations(timeout: duration + 0.5)
    }
}

#endif
