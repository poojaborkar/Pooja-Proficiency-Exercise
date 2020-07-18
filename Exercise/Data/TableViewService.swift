//
//  TableViewService.swift
//  Exercise

import Foundation

protocol TableViewService {
    func fetchData(completion: CompletionHandler)
}

class TableViewServiceImpl: TableViewService {
    var parser: ParsingUtilProtocol?
    init(parser: ParsingUtilProtocol) {
        self.parser = parser
    }
    
    //Make an API and returns the completion with UI model
    func fetchData(completion: CompletionHandler) {
        
        if let json = parser?.getJsonFromFile(fileName: JsonFileName.data.rawValue, bundle: Bundle(for: type(of: self))) {
            guard let jsonData = json.data(using: .utf8) else {return}
            
            let (response, error, _) = ParsingUtil().deserialization(TableViewDataModel.self, from: jsonData)
            if let response = response {
                let uiModel = TableViewMapper.getUIModel(from: response)
                completion(true, uiModel, nil)
            } else if let error = error {
                completion(false, nil, error)
            }
        }
    }
}
