//
//  DataCompetition.swift
//  SHIFT-LAB
//
//  Created by Елена on 29.04.2023.
//

import Foundation

// Данный класс создан для создания данных для главного экрана по причине того, что с API произошли проблемы
class DataCompetition {
    private var competition = [Competition]()
    
    init() {
        setArrayCompetition()
    }
    
    private func setArrayCompetition() {
        competition.append(Competition(id: "0", name: "Конкурс на стипендию от Тинькофф", startTime: "14.03.2023 00:00", endTime: "23:59", url: "https://fintech.tinkoff.ru/activities/scholarship/?ysclid=lh1u5yzhjf139596302"))
        competition.append(Competition(id: "1", name: "Конкурс по машинному обучению", startTime: "29.03.2023 13:00", endTime: "16:00", url: "https://team.cft.ru/events/65?ysclid=lh1u7p3br1390836900"))
        competition.append(Competition(id: "2", name: "Инженерные кадры России", startTime: "04.05.2023 09:00", endTime: "15:00", url: "https://ict2go.ru/events/40822/"))
        competition.append(Competition(id: "0", name: "Конкурс на стипендию от Тинькофф", startTime: "14.03.2023 00:00", endTime: "23:59", url: "https://fintech.tinkoff.ru/activities/scholarship/?ysclid=lh1u5yzhjf139596302"))
        competition.append(Competition(id: "1", name: "Конкурс по машинному обучению", startTime: "29.03.2023 13:00", endTime: "16:00", url: "https://team.cft.ru/events/65?ysclid=lh1u7p3br1390836900"))
        competition.append(Competition(id: "2", name: "Инженерные кадры России", startTime: "04.05.2023 09:00", endTime: "15:00", url: "https://ict2go.ru/events/40822/"))
        competition.append(Competition(id: "0", name: "Конкурс на стипендию от Тинькофф", startTime: "14.03.2023 00:00", endTime: "23:59", url: "https://fintech.tinkoff.ru/activities/scholarship/?ysclid=lh1u5yzhjf139596302"))
        competition.append(Competition(id: "1", name: "Конкурс по машинному обучению", startTime: "29.03.2023 13:00", endTime: "16:00", url: "https://team.cft.ru/events/65?ysclid=lh1u7p3br1390836900"))
        competition.append(Competition(id: "2", name: "Инженерные кадры России", startTime: "04.05.2023 09:00", endTime: "15:00", url: "https://ict2go.ru/events/40822/"))
    }
    
    func getCompetition() -> [Competition] {
        return competition
    }
}
