//
//  SuflerPaywallViewController.swift
//  Sufler
//
//  Created by Batyr Tolkynbayev on 27.12.2024.
//

import UIKit
import Domain

@available(iOS 13.0, *)
final class SuflerPaywallViewController: UIViewController, SuflerPaywallOutput {
    let presenter: SuflerPaywallInput
    
    private var price: String?
    private var features: [Feature]?
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private let suflerPlusImageView: UIImageView = {
        let image = UIImage(named: "suflerplus")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .systemGray
        label.textAlignment = .center
        let attri = NSAttributedString(
            string: "attriString",
            attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        label.attributedText = attri
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let continueButton = ContinueButton()
    
    private let featuresTitle: UILabel = {
        let featuresTitle = UILabel()
        featuresTitle.text = "Top features"
        featuresTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        featuresTitle.translatesAutoresizingMaskIntoConstraints = false
        return featuresTitle
    }()
    
    private let featuresStack: UIStackView = {
        let featuresStack = UIStackView()
        featuresStack.axis = .vertical
        featuresStack.spacing = 30
        featuresStack.translatesAutoresizingMaskIntoConstraints = false
        return featuresStack
    }()
    
    private let featuresView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let featuresScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    init(presenter: SuflerPaywallInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    // MARK: - UI Setup
    private func configureUI() {
        view.backgroundColor = .systemGray6
        
        addSubviews()
        configureConstraints()
        addTargets()
    }
    
    private func addSubviews() {
        for feature in features! {
            let featureView = FeatureCell(
                imageString: feature.imageString,
                featureTitle: feature.featureTitle,
                featureDescription: feature.featureDescription
            )
            featuresStack.addArrangedSubview(featureView)
        }

        view.addSubview(closeButton)
        view.addSubview(suflerPlusImageView)
        view.addSubview(priceLabel)
        view.addSubview(featuresTitle)
        featuresView.addSubview(featuresStack)
        featuresScrollView.addSubview(featuresView)
        view.addSubview(featuresScrollView)
        view.addSubview(continueButton)
    }

    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            suflerPlusImageView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            suflerPlusImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            priceLabel.centerYAnchor.constraint(equalTo: suflerPlusImageView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            featuresTitle.topAnchor.constraint(equalTo: suflerPlusImageView.bottomAnchor, constant: 60),
            featuresTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            featuresScrollView.topAnchor.constraint(equalTo: featuresTitle.bottomAnchor, constant: 20),
            featuresScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            featuresScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            featuresScrollView.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -20),
            
            featuresView.topAnchor.constraint(equalTo: featuresScrollView.topAnchor),
            featuresView.leadingAnchor.constraint(equalTo: featuresScrollView.leadingAnchor),
            featuresView.trailingAnchor.constraint(equalTo: featuresScrollView.trailingAnchor),
            featuresView.widthAnchor.constraint(equalTo: featuresScrollView.widthAnchor),
            
            featuresStack.topAnchor.constraint(equalTo: featuresView.topAnchor, constant: 20),
            featuresStack.leadingAnchor.constraint(equalTo: featuresView.leadingAnchor, constant: 10),
            featuresStack.trailingAnchor.constraint(equalTo: featuresView.trailingAnchor, constant: -10),
            featuresView.bottomAnchor.constraint(equalTo: featuresStack.bottomAnchor, constant: 20),
            
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func addTargets() {
        closeButton.addTarget(self, action: #selector(paywallDismiss), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(paywallDismiss), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func paywallDismiss() {
        presenter.dismiss()
    }
}

// MARK: - SuflerPaywallOutput
@available(iOS 13.0, *)
extension SuflerPaywallViewController {
    func setPrice(_ price: String) {
        priceLabel.text = price
    }
    
    func setFeatures(_ features: [Feature]) {
        self.features = features
    }
    
    func updateUI() {
        configureUI()
    }
}
