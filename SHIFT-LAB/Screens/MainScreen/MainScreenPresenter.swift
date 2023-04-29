//
//  MainScreenPresenter.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//


class MainScreenPresenter {
    weak var view: MainScreenViewControllerProtocol?
    var router: MainScreenRouterProtocol
    var interactor: MainScreenInteractorProtocol
    
    init(router: MainScreenRouterProtocol, interactor: MainScreenInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    func greetingButtonPressed() {
        interactor.getUserName()
    }
    
    func sendNameUser(_ name: String) {
        view?.showInfoUser(userName: name)
    }
    
    func sendErrorAboutNameUser(errorMessage: String) {
        view?.showErrorMessage(errorMessage: errorMessage)
    }
}
