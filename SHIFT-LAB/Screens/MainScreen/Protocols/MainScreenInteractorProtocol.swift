//
//  MainScreenInteractorProtocol.swift
//  SHIFT-LAB
//
//  Created by Елена on 29.04.2023.
//

import Foundation

protocol MainScreenInteractorProtocol {
    var presenter: MainScreenPresenterProtocol? { get set }
    var competition: Observable<[Competition]> { get set }
    
    func getUserName()
    func loadCompetition()
    func logout()
}
