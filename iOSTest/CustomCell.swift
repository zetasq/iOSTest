//
//  CustomCell.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 19/01/2018.
//  Copyright © 2018 Zhu Shengqi. All rights reserved.
//

import UIKit

final class CustomCell: UITableViewCell {
  
  private let customView = CustomView()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    self.backgroundColor = .clear
    
    addSubview(customView)
    customView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      customView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      customView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      customView.topAnchor.constraint(equalTo: self.topAnchor),
      customView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      ])
    
  }
  
}

