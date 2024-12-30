//
//  SwiftUIView.swift
//  Sufler
//
//  Created by Batyr Tolkynbayev on 27.12.2024.
//

import Foundation
import Domain

protocol SuflerPaywallOutput: AnyObject {
    var presenter: SuflerPaywallInput { get }
    
    func setPrice(_ price: String)
    func setFeatures(_ feature: [Feature])
    
    func updateUI()
}
