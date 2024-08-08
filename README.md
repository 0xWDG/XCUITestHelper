# XCUITestHelper

XCUITestHelper is a package what contains extensions for XCUITest.

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
3. Click **Finish**.

## Usage

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
        app.launchArguments += ["-AppleLanguages", "(en-US)"]
        app.launchArguments += ["-AppleLocale", "\"en-US\""]
        app.launch()

        // Wait for 1 second to continue
        app.wait(for: 1)

        // Go back to previous screen (navigation)
        app.navigateBack()

        // Tap on the last button
        app.buttons.lastMatch.tap()

        // Tap on the second button
        app.buttons[1].tap()
    }
}
```

## Contact

We can get in touch via [Mastodon](https://mastodon.social/@0xWDG), [Twitter/X](https://twitter.com/0xWDG), [Discord](https://discordapp.com/users/918438083861573692), [Email](mailto:email@wesleydegroot.nl), [Website](https://wesleydegroot.nl).

Interested learning more about Swift? [Check out my blog](https://wesleydegroot.nl/blog/).
