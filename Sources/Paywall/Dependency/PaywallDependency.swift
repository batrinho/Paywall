//
//  PaywallDependency.swift
//  Sufler
//
//  Created by Batyr Tolkynbayev on 27.12.2024.
//

import UIKit
import Domain

public protocol SuflerPaywallCoordinator {
    func dismiss()
}

public struct PaywallDependency {
    let provider: PaywallProviderProtocol
    let coordinator: SuflerPaywallCoordinator
    
    public init(provider: PaywallProviderProtocol, coordinator: SuflerPaywallCoordinator) {
        self.provider = provider
        self.coordinator = coordinator
    }
}
