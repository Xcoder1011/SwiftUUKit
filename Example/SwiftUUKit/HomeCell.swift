//
//  HomeCell.swift
//  SwiftUUKit_Example
//
//  Created by KUN on 2024/1/19.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import SwiftUUKit

class HomeCell: UUCustomTableViewCell {
    
    private lazy var subLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    override func makeUI() {
        super.makeUI()
        contentView.addSubview(subLabel)
    }
    
    override func loadData(with cellAdapter: UUCellAdapter, for indexPath: IndexPath) {
        if let data = cellAdapter.data {
            if data is String {
                
            }
        }
    }
}
