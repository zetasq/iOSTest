//
//  RoundView.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 20/01/2018.
//  Copyright © 2018 Zhu Shengqi. All rights reserved.
//

import UIKit

final class RoundView: UIView {
  
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    
    imageView.image = UIImage(named: "beast_wars_rampage")
    imageView.contentMode = .scaleAspectFill
    
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    backgroundColor = .red
    layer.cornerRadius = 5
//    clipsToBounds = true
    
//    addSubview(imageView)
//    imageView.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//      imageView.topAnchor.constraint(equalTo: topAnchor),
//      imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
//      ])
  }
    
}
