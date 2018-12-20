//
//  AuthNavigator.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit

protocol SigninCoordinate {
    func showSignin()
    func showHome()
}

final class SigninNavigator: Coordinate, SigninCoordinate {

    private let navigationController: UINavigationController

    @discardableResult
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showSignin() {
        let controller = SigninViewController()
        let credentialUseCase = RealmProvider(configuration: RealmSecurity.configuration)
            .credential()
        controller.viewModel = SigninViewModel(navigator: self,
                                               authUseCase: NetworkProvider.current.auth(),
                                               credentialUseCase: credentialUseCase)
        navigationController.pushViewController(controller, animated: true)
    }

    func showError(_ error: Error) {
        let alert = UIAlertController(title: App.String.appName,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        navigationController.present(alert, animated: true, completion: nil)
    }

    func showHome() {
        Application.shared.home()
    }
}
