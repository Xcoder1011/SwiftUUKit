//
//  HomeCell.swift
//  SwiftUUKit_Example
//
//  Created by KUN on 2024/1/19.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import SwiftUUKit
import SnapKit

class HomeCell: UUCustomTableViewCell {
    
    private lazy var subLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = UUKitTool.randomColor()
        return label
    }()
    
    private lazy var subBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        return btn
    }()
    
    override func makeUI() {
        super.makeUI()
        contentView.addSubview(subLabel)
        contentView.addSubview(subBtn)

        subLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(subBtn.snp.left).offset(-10)
        }
        
        subBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSizeMake(60, 30))
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
        }
    }
    
    @objc func btnClick(_ sender: UIButton) {
        print("cell 按钮被点击:\(sender.tag)")
        if let delegate = cellAdapter?.cellDelegate {
            delegate.uu_tableView(self.tableView, in: self, eventData: "\(sender.tag)", actionType: 0)
        }
    }
    
    override func loadData(with cellAdapter: UUCellAdapter, for indexPath: IndexPath) {
        if let data = cellAdapter.data {
            subLabel.text = "cell row: \(indexPath.row) --  \(data)"
        }
    }
}
