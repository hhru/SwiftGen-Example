// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen
import UIKit.UIImage


// swiftlint:disable superfluous_disable_command
// swiftlint:disable identifier_name line_length nesting type_body_length type_name file_length
public enum Image {

    public enum Logos {
        public static var objectiveC: UIImage {
            return image(named: "ObjectiveC")
        }
        public static var swift: UIImage {
            return image(named: "Swift")
        }
    }

    private static func image(named name: String) -> UIImage {
        let bundle = Bundle(for: BundleToken.self)
        guard let image = UIImage(named: name, in: bundle, compatibleWith: nil) else {
            fatalError("Unable to load image named \(name).")
        }
        return image
    }
}

private final class BundleToken {}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name file_length
