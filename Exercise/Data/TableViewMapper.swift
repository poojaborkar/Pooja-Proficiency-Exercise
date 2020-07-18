//
//  TableViewMapper.swift
//  Exercise

import Foundation

class TableViewMapper {
    
    //Maps the response object with UI Model
    static func getUIModel(from responseModel: TableViewDataModel) -> TableViewUIModel {
        
        var tableViewUIModel = TableViewUIModel()
        tableViewUIModel.navigationTitle = responseModel.title
        guard let rows = responseModel.rows  else {
            return TableViewUIModel()
        }

        tableViewUIModel.tableViewRow = [TableViewRowUIModel]()
        for model in rows {
            var uiResponseModel = TableViewRowUIModel()
            uiResponseModel.title = model.title
            uiResponseModel.imageUrl = model.imageHref
            uiResponseModel.description = model.description
            
            tableViewUIModel.tableViewRow?.append(uiResponseModel)
        }
        
        return tableViewUIModel
    }
}
