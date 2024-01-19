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
    
    override func makeUI() {
        super.makeUI()
        contentView.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10))
        }
    }
    
    override func loadData(with cellAdapter: UUCellAdapter, for indexPath: IndexPath) {
        if let data = cellAdapter.data {
            subLabel.text = "cell row: \(indexPath.row) --  \(data)"
        }
    }
}
