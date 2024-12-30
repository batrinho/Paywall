//
//  SuflerPaywallPresenter.swift
//  Sufler
//
//  Created by Batyr Tolkynbayev on 27.12.2024.
//

import Foundation

final class SuflerPaywallPresenter: SuflerPaywallInput {
    weak var output: SuflerPaywallOutput?
    
    private let dependency: PaywallDependency
    
    init(dependency: PaywallDependency) {
        self.dependency = dependency
    }
    
    func viewDidLoad() {
        output?.setPrice(dependency.provider.getPrice())
        output?.setFeatures(dependency.provider.getFeaturesList())
        output?.updateUI()
    }
    
    func dismiss() {
        dependency.coordinator.dismiss()
    }
}
