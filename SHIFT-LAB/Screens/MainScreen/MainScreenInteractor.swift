//
//  MainScreenInteractor.swift
//  SHIFT-LAB
//
//  Created by Елена on 24.04.2023.
//

import Foundation

class MainScreenInteractor {
    weak var presenter: MainScreenPresenterProtocol?
    
    var competition = Observable<[Competition]>()
}

extension MainScreenInteractor: MainScreenInteractorProtocol {
    func getUserName() {
        if let name = UserDefaults.standard.string(forKey: "userName") {
            presenter?.sendNameUser(name)
            return
        }
        
        presenter?.sendErrorAboutNameUser(errorMessage: "Произошла ошибка. Попробуйте повторить действие.")
    }
    
    func loadCompetition() {
        let dataCompetition = DataCompetition()
        
        competition.updateModel(with: dataCompetition.getCompetition())
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "userName")
    }
}
