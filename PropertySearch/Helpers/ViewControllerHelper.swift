//
//  ViewControllerHelper.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 24/10/21.
//

import UIKit

extension UIViewController {
    public static func make<T>(viewController: T.Type) -> T {
        let viewControllerName = String(describing: viewController)

        let storyboard = UIStoryboard(name: viewControllerName, bundle: Bundle(for: viewController as! AnyClass))

        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName) as? T else {
            fatalError("Unable to create ViewController: \(viewControllerName) from storyboard: \(storyboard)")
        }
        return viewController
    }
}

protocol ViewControllerProtocol {
    associatedtype ViewModelType
    var viewModel: ViewModelType! { get set }
}
