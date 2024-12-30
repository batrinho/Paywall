//
//  ContinueButton.swift
//  Sufler
//
//  Created by Batyr Tolkynbayev on 28.12.2024.
//

import UIKit

@available(iOS 13.0, *)
final class ContinueButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        setTitle("Let’s go", for: .normal)
        backgroundColor = .label
        setTitleColor(.systemBackground, for: .normal)
        layer.cornerRadius = 25
        translatesAutoresizingMaskIntoConstraints = false
    }
}
