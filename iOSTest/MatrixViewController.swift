//
//  MatrixViewController.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 25/02/2018.
//  Copyright © 2018 Zhu Shengqi. All rights reserved.
//

import UIKit

final class MatrixViewController: UIViewController {
  
  private let scrollView = UIScrollView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(scrollView)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
      ])
    
    let width: CGFloat = 50
    let height: CGFloat = 50
    let depth: CGFloat = 10
    
    let spacing: CGFloat = 10
    
    let horizCount = 25
    let verticalCount = 25
    
    let camera_distance: CGFloat = 500
    
    scrollView.contentSize = CGSize(width: CGFloat(horizCount - 1) * spacing + CGFloat(horizCount) * width, height: CGFloat(verticalCount - 1) * spacing + CGFloat(verticalCount) * height)
    
    var transform = CATransform3DIdentity
    transform.m34 = -1.0 / camera_distance
    
    scrollView.layer.sublayerTransform = transform
    
    for z in stride(from: Int(depth) - 1, through: 0, by: -1) {
      for y in 0..<verticalCount {
        for x in 0..<horizCount {
          let layer = CALayer()
          layer.frame = CGRect(x: CGFloat(x) * (width + spacing), y: CGFloat(y) * (height + spacing), width: width, height: height)
          layer.zPosition = -CGFloat(z) * spacing
          
          layer.backgroundColor = UIColor(white: 1 - CGFloat(z) * (1.0 / depth), alpha: 1).cgColor
          
          scrollView.layer.addSublayer(layer)
        }
      }
    }
  }
  
}
