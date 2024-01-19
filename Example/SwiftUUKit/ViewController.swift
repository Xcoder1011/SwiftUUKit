//
//  ViewController.swift
//  SwiftUUKit
//
//  Created by Xcoder1011 on 01/19/2024.
//  Copyright (c) 2024 Xcoder1011. All rights reserved.
//

import UIKit
import SwiftUUKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: self.view.bounds, style: .plain)
        view.uu_createDelegate()
        view.uu_createDataSource()
        view.uu_registerClassForCell(UITableViewCell.self)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        let secAdapter = UUSectionAdapter.init(cellAdapters: generateRandomData())
        tableView.uu_add([secAdapter])
        tableView.reloadData()
    }
    
    private func generateRandomData() -> [UUCellAdapter] {
        var cellAdapters: [UUCellAdapter] = []
        let randomCount = Int(arc4random_uniform(UInt32(5))) + 2
        let className = String(describing: UITableViewCell.self)
        for i in 0 ..< randomCount {
            let adapter = UUCellAdapter.init(reuseIdentifier: className, data: String(i))
            adapter.cellHeight = 50
            cellAdapters.append(adapter)
        }
        return cellAdapters
    }
}

