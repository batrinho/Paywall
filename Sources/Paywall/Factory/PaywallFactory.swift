//
//  PaywallFactory.swift
//  Sufler
//
//  Created by Batyr Tolkynbayev on 27.12.2024.
//

import UIKit

public final class PaywallFactory {
    public init() {}
    
    @available(iOS 13.0, *)
    public func createPaywall(dependency: PaywallDependency) -> UIViewController {
        let presenter = SuflerPaywallPresenter(dependency: dependency)
        let view = SuflerPaywallViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
