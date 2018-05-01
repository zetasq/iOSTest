//
//  CustomView.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 19/01/2018.
//  Copyright © 2018 Zhu Shengqi. All rights reserved.
//

import UIKit

final class CustomView: UIView {
    
  private lazy var roundView: RoundView = {
    let roundView = RoundView()
    
    return roundView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    
    addSubview(roundView)
    
    roundView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      roundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
      roundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      roundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      roundView.widthAnchor.constraint(equalToConstant: 50),
      roundView.heightAnchor.constraint(equalToConstant: 50)
      ])
    
  }
    
}
