//
//  MainViewController.swift
//  SwiftGenExample
//
//  Created by j.privezentsev on 02.08.2018.
//  Copyright © 2018 HeadHunter. All rights reserved.
//

import UIKit

enum ProgrammingLanguage {
    case Swift
    case ObjectiveC

    static func random() -> ProgrammingLanguage {
        return Bool.random() ? .Swift : .ObjectiveC
    }
}

final class MainViewController: UIViewController {

    let programmingLanguage = ProgrammingLanguage.random()
    var wikiUrl: URL?

    // MARK: - IBOutlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var wikiButton: UIButton!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = String(
            format: NSLocalizedString("main-screen.title", comment: ""),
            locale: Locale.current
        )
        let buttonTitle = String(
            format: NSLocalizedString("main-screen.button.title", comment: ""),
            locale: Locale.current
        )
        wikiButton.setTitle(buttonTitle, for: .normal)
        setupWithLanguage(programmingLanguage)
    }

    // MARK: - IBActions
    @IBAction func openWiki(_ sender: UIButton) {
        guard let url = wikiUrl else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    // MARK: - Setup

    private func setupWithLanguage(_ language: ProgrammingLanguage) {
        switch language {
        case .Swift:
            logoImageView.image = UIImage(named: "Swift")
            nameLabel.text = String(
                format: NSLocalizedString("languages.swift.name", comment: ""),
                locale: Locale.current
            )
            descriptionLabel.text = String(
                format: NSLocalizedString("languages.swift.description", comment: ""),
                locale: Locale.current
            )
            let linkString = String(
                format: NSLocalizedString("languages.swift.link", comment: ""),
                locale: Locale.current
            )
            wikiUrl = linkString.toURL()
        case .ObjectiveC:
            logoImageView.image = UIImage(named: "ObjectiveC")
            nameLabel.text = String(
                format: NSLocalizedString("languages.objective-c.name", comment: ""),
                locale: Locale.current
            )
            descriptionLabel.text = String(
                format: NSLocalizedString("languages.objective-c.description", comment: ""),
                locale: Locale.current
            )
            let linkString = String(
                format: NSLocalizedString("languages.objective-c.link", comment: ""),
                locale: Locale.current
            )
            wikiUrl = linkString.toURL()
        }
    }
}

extension Bool {
    fileprivate static func random() -> Bool {
        return arc4random_uniform(2) == 0
    }
}

extension String {
    fileprivate func toURL() -> URL? {
        return URL(string: addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
    }
}
