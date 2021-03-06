//
//  ProfilePresenter.swift
//  Stonks
//
//  Created by Иван Лизогуб on 20.07.2021.
//  
//

import Foundation

final class ProfilePresenter {
	weak var view: ProfileViewInput?
    weak var moduleOutput: ProfileModuleOutput?
    
	private let router: ProfileRouterInput
	private let interactor: ProfileInteractorInput
    
    init(router: ProfileRouterInput, interactor: ProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ProfilePresenter: ProfileModuleInput {
}

extension ProfilePresenter: ProfileViewOutput {
    func getUsername() {
        let username = interactor.getUsername()
        view?.updateUsername(username)
    }
    
    func onTapLogOut() {
        interactor.logOut()
    }
    
}

extension ProfilePresenter: ProfileInteractorOutput {
    func didLogOut() {
        moduleOutput?.didLogOut()
    }
    
}
