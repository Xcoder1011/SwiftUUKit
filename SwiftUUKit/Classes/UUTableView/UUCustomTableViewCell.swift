//
//  UUCustomTableViewCell.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import UIKit

open class UUCustomTableViewCell: UITableViewCell {
    
    open weak var cellAdapter: UUCellAdapter?
    open var indexPath: IndexPath?
 
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        makeUI()
    }
    
    open func configureCell() {
        selectionStyle = .none
    }
    
    
    open func makeUI() {
        backgroundColor = .white
        updateUI()
    }
    
    open func updateUI() {
        setNeedsDisplay()
    }
    
    open func loadData(with cellAdapter: UUCellAdapter, for indexPath: IndexPath) {
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCell()
        makeUI()
    }
}
