//
//  SuflerPaywallPresenter.swift
//  Sufler
//
//  Created by Batyr Tolkynbayev on 27.12.2024.
//

import Foundation

final class SuflerPaywallPresenter: SuflerPaywallInput {
    weak var view: SuflerPaywallOutput?
    
    private let dependency: PaywallDependency
    
    init(dependency: PaywallDependency) {
        self.dependency = dependency
    }
    
    func viewDidLoad() {
        view?.setPrice(dependency.provider.getPrice())
        view?.setFeatures(dependency.provider.getFeaturesList())
        view?.updateUI()
    }
    
    func dismiss() {
        dependency.coordinator.dismiss()
    }
}
