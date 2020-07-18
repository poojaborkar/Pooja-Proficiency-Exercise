//
//  TableViewPresenter.swift
//  Exercise

import Foundation

protocol TableViewPresenter {
    func initialSetup()
    func tableView(numberOfRowsInSection: Int) -> Int
    func getCellMode(atIndexPath: IndexPath) -> TableViewRowUIModel?
    func getNavigationTitle() -> String
    func fetchData()
}

class TableViewPresenterImpl: TableViewPresenter {
    
    var view: TableContainerView?
    var useCase: TableViewUseCase?
    var tableViewData: TableViewUIModel?
    
    init(view: TableContainerView,
         useCase: TableViewUseCase) {
        self.view = view
        self.useCase = useCase
    }
    
    func initialSetup() {
        view?.initialSetup()
        fetchData()
    }
    
    //returns the number of rows to Controller
    func tableView(numberOfRowsInSection: Int) -> Int {
        return tableViewData?.tableViewRow?.count ?? 0
    }
    
    //return cell model for indexPath
    func getCellMode(atIndexPath: IndexPath) -> TableViewRowUIModel? {
        return tableViewData?.tableViewRow?[atIndexPath.row]
    }
    
    //return the navigation title of the controller
    func getNavigationTitle() -> String {
        return tableViewData?.navigationTitle ?? ""
    }
    
    //Fetch the data from API
    func fetchData() {
        useCase?.fetchData(completion: { [weak self] (isSuccess, response, error) in
            if isSuccess {
                guard let data = response else { return }
                self?.tableViewData = data
                self?.view?.reloadTableView()
            } else {
                print("Error: \(String(describing: error))")
            }
        })
    }
}
