//
//  UUTableViewHeaderFooterView.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/20.
//

import UIKit

public protocol UUTableViewHeaderFooterViewDelegate : class {
    
    func uu_tableView(_ tableView: UITableView?, in headerOrFooter: UUTableViewHeaderFooterView, eventData: Any?, actionType: Int)
}

open class UUTableViewHeaderFooterView: UITableViewHeaderFooterView {
    open weak var sectionAdapter: UUSectionAdapter?
    open weak var tableView: UITableView?
    open var section: Int = 0
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        makeUI()
    }
    
    open func makeUI() {
        updateUI()
    }
    
    open func updateUI() {
        setNeedsDisplay()
    }
    
    open func loadData(with sectionAdapter: UUSectionAdapter, for section: Int) {
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }
}
