//
//  TableViewUseCase.swift
//  Exercise

import Foundation
typealias CompletionHandler = (_ success: Bool, _ data: TableViewUIModel?, _ error: Error?) -> Void

protocol TableViewUseCase {
    func fetchData(completion: CompletionHandler)
}

class TableViewUseCaseImpl: TableViewUseCase {
    private var service: TableViewService?
    
    init(service: TableViewService) {
        self.service = service
    }
    
    func fetchData(completion: CompletionHandler) {
        service?.fetchData(completion: completion)
    }
}
