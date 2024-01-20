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
        let view = UUKitTool.createTableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .singleLine
        view.uu_createDelegate()
        view.uu_createDataSource()
        view.uu_registerClassForCell(HomeCell.self)
        view.uu_registerClassForHeaderFooter(HomeTableHeaderView.self)
        view.uu_registerClassForHeaderFooter(HomeTableFooterView.self)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: UUKitTool.statusBarHeight, left: 0, bottom: UUKitTool.safeAreaBottomHeight, right: 0))
        }
        var secAdapters: [UUSectionAdapter] = []
        for i in 0 ..< 5 {
            let secAdapter = UUSectionAdapter.init(cellAdapters: generateRandomData())
            secAdapter.headerClass = HomeTableHeaderView.self
            secAdapter.headerHeight = 50
            secAdapter.headerData = i
            
            secAdapter.footerClass = HomeTableFooterView.self
            secAdapter.footerHeight = 50
            secAdapter.footerData = i
            
            secAdapters.append(secAdapter)
        }
        tableView.uu_add(secAdapters)
        tableView.reloadData()
    }
    
    private func generateRandomData() -> [UUCellAdapter] {
        var cellAdapters: [UUCellAdapter] = []
        let randomCount = Int(arc4random_uniform(UInt32(10))) + 2
        for i in 0 ..< randomCount {
            let adapter = UUCellAdapter.cellAdapter(with: HomeCell.self, data: i+1, cellHeight: 44)
            adapter.cellDelegate = self
            cellAdapters.append(adapter)
        }
        return cellAdapters
    }
    
    private func showAlert(_ info: String) {
        let alertController = UIAlertController(title: "提示", message: info, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK button tapped")
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UUCustomTableViewCellDelegate {
    
    func uu_tableView(_ tableView: UITableView?, in cell: SwiftUUKit.UUCustomTableViewCell, eventData: Any?, actionType: Int) {
        if let eventData = eventData {
            showAlert("controller 按钮被点击:\(eventData)")
        }
    }
    
    func uu_tableView(_ tableView: UITableView?, didSelect cell: UUCustomTableViewCell) {
        if let data = cell.cellAdapter?.data {
            showAlert("cell被点击:\(data)")
        }
    }
}
