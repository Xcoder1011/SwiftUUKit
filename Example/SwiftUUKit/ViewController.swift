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
        view.uu_registerClassForCell(HomeCell.self)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        var secAdapters: [UUSectionAdapter] = []
        for _ in 0 ..< 3 {
            let secAdapter = UUSectionAdapter.init(cellAdapters: generateRandomData())
            secAdapters.append(secAdapter)
        }
        tableView.uu_add(secAdapters)
        tableView.reloadData()
    }
    
    private func generateRandomData() -> [UUCellAdapter] {
        var cellAdapters: [UUCellAdapter] = []
        let randomCount = Int(arc4random_uniform(UInt32(5))) + 2
        for i in 0 ..< randomCount {
            let adapter = UUCellAdapter.cellAdapter(with: HomeCell.self, data: i+1, cellHeight: 50)
            adapter.cellDelegate = self
            cellAdapters.append(adapter)
        }
        return cellAdapters
    }
}

extension ViewController: UUCustomTableViewCellDelegate {
    
    func uu_tableView(_ tableView: UITableView?, in cell: SwiftUUKit.UUCustomTableViewCell, eventData: Any?, actionType: Int) {
        if let eventData = eventData {
            print("controller 按钮被点击:\(eventData)")
        }
    }
}
