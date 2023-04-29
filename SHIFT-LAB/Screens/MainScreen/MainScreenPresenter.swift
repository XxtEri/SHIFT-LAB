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
        
        bindListener()
    }
}

private extension MainScreenPresenter {
    func bindListener() {
        interactor.competition.subscribe { competitions in
            let competitionsModel = competitions.map {
                CompetitionModel(id: $0.id, name: $0.name, startTime: $0.startTime, endTime: $0.endTime, url: $0.url)
            }
            
            self.sendCompetitionToView(competitionsModel)
        }
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    func greetingButtonPressed() {
        interactor.getUserName()
    }
    
    func loadCompetition() {
        interactor.loadCompetition()
    }
    
    func sendNameUser(_ name: String) {
        view?.showInfoUser(userName: name)
    }
    
    func sendCompetitionToView(_ competitions: [CompetitionModel]) {
        view?.sendCompetition(competitions)
    }
    
    func sendErrorAboutNameUser(errorMessage: String) {
        view?.showErrorMessage(errorMessage: errorMessage)
    }
}
