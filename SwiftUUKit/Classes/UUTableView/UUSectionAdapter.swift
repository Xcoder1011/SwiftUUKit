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
    public weak var headerView: UIView?
    public weak var footerView: UIView?
    public var titleForHeader: String?
    public var titleForFooter: String?
    public var reuseHeaderIdentifier: String?
    public var reuseFooterIdentifier: String?
    public weak var headerFooterDelegate: UUTableViewHeaderFooterViewDelegate?
    
    public var headerClass: AnyClass? {
        didSet {
            if let headerClass = self.headerClass {
                self.reuseHeaderIdentifier = UUKitTool.classNameAsString(headerClass)
            }
        }
    }
    
    public var footerClass: AnyClass? {
        didSet {
            if let footerClass = self.footerClass {
                self.reuseFooterIdentifier = UUKitTool.classNameAsString(footerClass)
            }
        }
    }
    
    public var tag: Int = 0
    
    public init() { }
    
    public init(cellAdapters: [UUCellAdapter]) {
        self.cellAdapters = cellAdapters
    }
    
    public init(cellAdapters: [UUCellAdapter], headerData: Any?, footerData: Any?) {
        self.cellAdapters = cellAdapters
        self.headerData = headerData
        self.footerData = footerData
    }
    
    public init(headerClass: AnyClass?, footerClass: AnyClass?) {
        self.headerClass = headerClass
        self.footerClass = footerClass
        if (headerClass != nil) {
            self.reuseHeaderIdentifier = UUKitTool.classNameAsString(headerClass!)
        }
        if (footerClass != nil) {
            self.reuseFooterIdentifier = UUKitTool.classNameAsString(footerClass!)
        }
    }
}
