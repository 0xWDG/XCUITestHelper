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

extension XCUIApplication {
    /// Navigate back
    public func navigateBack() {
        self.navigationBars.buttons.element(boundBy: 0).tap()
    }

    /// Wait for a duration
    /// 
    /// - Parameter duration: Duration to wait
    public func wait(for duration: TimeInterval) {
        let testCase = XCTestCase()
        let waitExpectation = testCase.expectation(
            description: "Waiting"
        )

        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }

        testCase.waitForExpectations(
            timeout: duration + 0.5
        )
    }
}

#endif
