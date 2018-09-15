// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen
import Foundation

public enum Localization {

    public enum Languages {

        public enum ObjectiveC {
            /// General-purpose, object-oriented programming language that adds Smalltalk-style messaging to the C programming language
            public static let description = localize("languages.objective-c.description")
            /// https://en.wikipedia.org/wiki/Objective-C
            public static let link = localize("languages.objective-c.link")
            /// Objective-C
            public static let name = localize("languages.objective-c.name")
        }

        public enum Swift {
            /// General-purpose, multi-paradigm, compiled programming language developed by Apple Inc. for iOS, macOS, watchOS, tvOS, and Linux
            public static let description = localize("languages.swift.description")
            /// https://en.wikipedia.org/wiki/Swift_(programming_language)
            public static let link = localize("languages.swift.link")
            /// Swift
            public static let name = localize("languages.swift.name")
        }
    }

    public enum MainScreen {
        /// Language
        public static let title = localize("main-screen.title")

        public enum Button {
            /// View in Wikipedia
            public static let title = localize("main-screen.button.title")
        }
    }
}

extension Localization {

    fileprivate static func localize(_ key: String, _ args: CVarArg...) -> String {
        return String(
            format: NSLocalizedString(key, comment: ""),
            locale: Locale.current,
            arguments: args
        )
    }
}
