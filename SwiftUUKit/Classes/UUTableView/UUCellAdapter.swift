//
//  UUCellAdapter.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import Foundation

public class UUCellAdapter {
    public var reuseIdentifier: String?
    public var cellHeight: CGFloat = 0.0
    public var data: Any?
    public var cellClass: AnyClass?
    
    public init() { }
    
    public init(cellClass: AnyClass?) {
        self.cellClass = cellClass
        if let anyClass = cellClass {
            let className = UUKitTool.classNameAsString(anyClass)
            self.reuseIdentifier = className
        }
    }
    
    public init(reuseIdentifier: String) {
        self.reuseIdentifier = reuseIdentifier
    }
    
    public init(reuseIdentifier: String, data: Any?) {
        self.reuseIdentifier = reuseIdentifier
        self.data = data
    }
}