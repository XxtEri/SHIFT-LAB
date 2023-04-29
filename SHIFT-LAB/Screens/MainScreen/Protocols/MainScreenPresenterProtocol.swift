//
//  MainScreenPresenterProtocol.swift
//  SHIFT-LAB
//
//  Created by Елена on 29.04.2023.
//

import Foundation

protocol MainScreenPresenterProtocol: AnyObject {
    var view: MainScreenViewControllerProtocol? { get set }
    var router: MainScreenRouterProtocol { get set }
    var interactor: MainScreenInteractorProtocol { get set }
    
    func greetingButtonPressed()
    func loadCompetition()
    func sendNameUser(_ name: String)
    func sendCompetitionToView(_ competitions: [CompetitionModel])
    func sendErrorAboutNameUser(errorMessage: String)
}
