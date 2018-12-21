//
//  AuthNetwork.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

final class AuthNetwork: AuthUseCase {

    private let router: Router<AuthTarget>

    init(router: Router<AuthTarget>) {
        self.router = router
    }

    func signin(credential: Credential) -> Observable<Void> {
        return router.request(.signin(credential)).map { _ in return }
    }
}
