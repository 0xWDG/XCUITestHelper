# XCUITestHelper

XCUITestHelper helps you writing UI tests within SwiftUI. It provides a set of useful extensions on [XCUIApplication](Sources/XCUITestHelper/XCUIApplication.swift), [XCUIElement](Sources/XCUITestHelper/XCUIElement.swift) and [XCUIElementQuery](Sources/XCUITestHelper/XCUIElementQuery.swift) to make your tests more readable and easier to maintain.

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2F0xWDG%2FXCUITestHelper%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/0xWDG/XCUITestHelper)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2F0xWDG%2FXCUITestHelper%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/0xWDG/XCUITestHelper)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager)
![License](https://img.shields.io/github/license/0xWDG/XCUITestHelper)

## Requirements

- Swift 5.9+ (Xcode 15+)
- iOS 13+, macOS 10.15+

## Installation (Pakage.swift)

```swift
dependencies: [
    .package(url: "https://github.com/0xWDG/XCUITestHelper.git", branch: "main"),
],
targets: [
    .target(name: "MyTarget", dependencies: [
        .product(name: "XCUITestHelper", package: "XCUITestHelper"),
    ]),
]
```

## Installation (Xcode)

1. In Xcode, open your project and navigate to **File** → **Swift Packages** → **Add Package Dependency...**
2. Paste the repository URL (`https://github.com/0xWDG/XCUITestHelper`) and click **Next**.
3. Make sure you add it to the **UITest target**!
4. Click **Finish**.

## Usage / Examples

```swift
import XCTest
import XCUITestHelper

final class MyAppUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()

        // * Set the app language to English.
        app.setLanguage(to: .english)
        // Do this before launching the app.
        app.launch()

        // * `Wait` for 1 second to continue
        app.wait(for: 1)

        // * Tap a `random` cell in a collection view.
        // Random works with any kind of element, not just buttons.
        app.collectionViews.buttons.random.tap()

        // * Go back to previous screen (NavigationView)
        app.navigateBack()

        // * Tap on the last button
        app.buttons.lastMatch.tap()

        // * Tap on the second button
        app.buttons[1].tap()

        // * Type something, and then clear it.
        let textfield = app.searchFields.firstMatch
        app.type(in: textfield, text: "a", action: .clear)
    }
}
```

## Contact

🦋 [@0xWDG](https://bsky.app/profile/0xWDG.bsky.social)
🐘 [mastodon.social/@0xWDG](https://mastodon.social/@0xWDG)
🐦 [@0xWDG](https://x.com/0xWDG)
🧵 [@0xWDG](https://www.threads.net/@0xWDG)
🌐 [wesleydegroot.nl](https://wesleydegroot.nl)
🤖 [Discord](https://discordapp.com/users/918438083861573692)

Interested learning more about Swift? [Check out my blog](https://wesleydegroot.nl/blog/).

