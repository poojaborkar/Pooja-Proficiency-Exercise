//
//  TableModel.swift
//  Exercise

import Foundation

struct TableViewDataModel: Decodable {
    var title: String?
    var rows: [TableRowDataModel]?
}

struct TableRowDataModel: Decodable {
    var title: String?
    var description: String?
    var imageHref: String?
}

struct TableViewUIModel {
    var navigationTitle: String?
    var tableViewRow: [TableViewRowUIModel]?
}

struct TableViewRowUIModel {
    var title: String?
    var description: String?
    var imageUrl: String?
}
