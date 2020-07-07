//
//  TableViewConfigurator.swift
//  Exercise

import Foundation

protocol TableViewConfigurator {
    func configure(view: TableContainerView)
}

class TableViewConfiguratorImpl: TableViewConfigurator {
    func configure(view: TableContainerView) {
        let useCase = TableViewUseCaseImpl(service: TableViewServiceImpl())
        let presenter = TableViewPresenterImpl(view: view, useCase: useCase)
        view.attachPresenter(presenter: presenter)
    }
}
