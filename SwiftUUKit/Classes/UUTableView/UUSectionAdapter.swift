//
//  UUSectionAdapter.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import Foundation

public class UUSectionAdapter {
    public var cellAdapters: [UUCellAdapter] = []
    public var headerHeight: CGFloat = 0.0
    public var footerHeight: CGFloat = 0.0
    public var headerData: Any?
    public var footerData: Any?
    
    public init() { }
    
    public init(cellAdapters: [UUCellAdapter]) {
        self.cellAdapters = cellAdapters
    }
    
    public init(cellAdapters: [UUCellAdapter], headerData: Any?, footerData: Any?) {
        self.cellAdapters = cellAdapters
        self.headerData = headerData
        self.footerData = footerData
    }
}
