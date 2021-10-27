//
//  NavigationAction.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import Foundation

enum NavigationAction {
    case push(viewModel: Any, animated: Bool)
    case present(viewModel: Any, animated:Bool)
    case pop(animated: Bool)
    case dismiss(animated: Bool)
}

extension NavigationAction: Equatable {
    static func == (lhs: NavigationAction, rhs: NavigationAction) -> Bool {
        switch (lhs, rhs) {
        case (.push, .push):
            return true
        case (.present, .present):
            return true
        case (.pop, .pop):
            return true
            case (.dismiss, .dismiss):
            return true
        default: return false
        }
    }
}
