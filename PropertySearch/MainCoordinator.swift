//
//  MainCoordinator.swift
//  
//
//  Created by Dushyant Singh on 24/10/21.
//

import RxSwift

class MainCoordinator {
    var mainNavigationController: UINavigationController!
    let viewModelCoordinator = MainViewModelCoordinator()
    let disposeBag = DisposeBag()

    init() {
        startApplication()
        setupNavigationAction()
    }
}

extension MainCoordinator {
    private func startApplication() {
        let vm = viewModelCoordinator.createStartUpViewModel()
        let vc = getViewController(vm)
        self.mainNavigationController = UINavigationController(rootViewController: vc)
    }

    private func setupNavigationAction() {
        viewModelCoordinator
            .navigationAction
            .subscribe(onNext: { event in
                switch event {
                case .push(let viewModel, let animated):
                    let vc = self.getViewController(viewModel)
                    self.mainNavigationController.pushViewController(vc, animated: animated)
                case .pop(let animated):
                   self.getNavigationController().popViewController(animated: animated)
                case .present(let viewModel, let animated):
                    let vc = self.getViewController(viewModel)
                    let viewController =
                        UINavigationController(rootViewController: vc)
                    self.mainNavigationController.present(viewController, animated: animated)
                case .dismiss(let animated):
                     self.getNavigationController().dismiss(animated: animated)
                } })
            .disposed(by: disposeBag)
    }
}


extension MainCoordinator {
     private func getViewController(_ viewModel: Any) -> UIViewController {
        switch viewModel {
        case let viewModel as SearchViewModel :
            let viewController = UIViewController.make(viewController: SearchViewController.self)
            viewController.viewModel = viewModel
            return viewController
        case let viewModel as PropertyDetailViewModel :
            let viewController = UIViewController.make(viewController: PropertyDetailViewController.self)
            viewController.viewModel = viewModel
            return viewController
        default:
            return UIViewController()
        }
    }

    func getNavigationController() -> UINavigationController {
          if let embeddedNavController = mainNavigationController.presentedViewController as? UINavigationController {
                  return embeddedNavController
              }
        return mainNavigationController
    }
}
