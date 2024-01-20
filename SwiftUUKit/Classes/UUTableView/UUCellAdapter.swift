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
    public var cellWidth: CGFloat = 0.0
    public var data: Any?
    public var cellClass: AnyClass?
    public weak var cellDelegate: UUCustomTableViewCellDelegate?
    public var tag: Int = 0
    
    public init() {
        self.cellWidth = UUKitTool.width
    }
    
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
    
    public static func cellAdapter(with cellClass: AnyClass?,
                                   data: Any?,
                                   cellHeight: CGFloat) -> UUCellAdapter {
        return cellAdapter(with: cellClass, data: data, cellWidth: UUKitTool.width, cellHeight: cellHeight, cellDelegate: nil, tag: 0)
    }
    
    public static func cellAdapter(with cellClass: AnyClass?,
                                   data: Any?,
                                   cellWidth: CGFloat,
                                   cellHeight: CGFloat,
                                   cellDelegate: UUCustomTableViewCellDelegate?,
                                   tag: Int) -> UUCellAdapter {
        let adapter = UUCellAdapter.init(cellClass: cellClass)
        adapter.data = data
        adapter.cellWidth = cellWidth
        adapter.cellHeight = cellHeight
        adapter.cellDelegate = cellDelegate
        adapter.tag = tag
        return adapter
    }
}
