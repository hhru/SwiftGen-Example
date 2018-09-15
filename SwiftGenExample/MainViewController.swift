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

        title = localization.MainScreen.title
        wikiButton.setTitle(localization.MainScreen.Button.title, for: .normal)
        setupWithLanguage(programmingLanguage)
    }

    // MARK: - IBActions
    @IBAction func openWiki(_ sender: UIButton) {
        guard let url = wikiUrl else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    // MARK: - Setup

    let logos = Image.Logos.self
    let localization = Localization.self

    private func setupWithLanguage(_ language: ProgrammingLanguage) {
        switch language {
        case .Swift:
            logoImageView.image = logos.swift
            nameLabel.text = localization.Languages.Swift.name
            descriptionLabel.text = localization.Languages.Swift.description
            wikiUrl = localization.Languages.Swift.link.toURL()
        case .ObjectiveC:
            logoImageView.image = logos.objectiveC
            nameLabel.text = localization.Languages.ObjectiveC.name
            descriptionLabel.text = localization.Languages.ObjectiveC.description
            wikiUrl = localization.Languages.ObjectiveC.link.toURL()
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
