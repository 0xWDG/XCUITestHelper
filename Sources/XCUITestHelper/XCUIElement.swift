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
/// 
/// This are actions that can be (automatically) performed on an XCUIElement.
public enum XCUIElementAction {
    /// Send
    /// 
    /// This will search for the last button on the keyboard which is usually the "Send" button and will tap it.
    case send

    /// Clear
    ///
    /// This will search for the last button on the input field which is usually the "Clear" button and will tap it.
    case clear

    /// Do nothing
    /// 
    /// This will do nothing after the requested action.
    case none
}

extension XCUIElement {
    /// Does the element has keyboard focus?
    ///
    /// - Returns: boolean to indicate if the element has the current keyboard focus
    public var hasKeyboardFocus: Bool {
        return (self.value(forKey: "hasKeyboardFocus") as? Bool) ?? false
    }

    /// Type some text and perform an action.
    /// 
    /// Focus the text field, type some text and perform an action if needed.
    ///
    /// - Parameter in: Element to type in.
    /// - Parameter text: Text to type.
    /// - Parameter action: Action to perform after typing.
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

    /// Wait for a duration
    /// 
    /// Wait for a specified duration, this is a blocking call.
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
