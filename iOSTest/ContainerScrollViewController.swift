//
//  ContainerScrollViewController.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 2018/5/1.
//  Copyright © 2018 Zhu Shengqi. All rights reserved.
//

import UIKit

final class ContainerScrollViewController: UIViewController {
  
  private let backgroundImageView: UIImageView = {
    let backgroundImageView = UIImageView()
    
    backgroundImageView.image = UIImage(named: "mountain")
    backgroundImageView.contentMode = .scaleAspectFill
    
    return backgroundImageView
  }()
  
  private let containerScrollView: CustomScrollView = {
    let containerScrollView = CustomScrollView()
    
    return containerScrollView
  }()
  
  private let headerViewHeight: CGFloat = 150
  
  private let testListViewController: TestListViewController = {
    let testListViewController = TestListViewController()
    
    return testListViewController
  }()
  
  private var testListContentOffsetObservation: NSKeyValueObservation!
  
  private var containerContentOffsetObservation: NSKeyValueObservation!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupBinding()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    containerScrollView.contentSize = view.bounds.size
    
    let yOffset = testListViewController.view.frame.origin.y
    testListViewController.view.frame = CGRect(x: 0, y: yOffset, width: containerScrollView.contentSize.width, height: containerScrollView.contentSize.height)
  }
  
  private func setupUI() {
    view.addSubview(backgroundImageView)
    backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
      ])
    
    containerScrollView.contentInset = UIEdgeInsets(top: headerViewHeight, left: 0, bottom: 0, right: 0)
    
    view.addSubview(containerScrollView)
    
    containerScrollView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      containerScrollView.topAnchor.constraint(equalTo: view.topAnchor),
      containerScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      containerScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      containerScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
      ])
    
    addChildViewController(testListViewController)
    
    containerScrollView.addSubview(testListViewController.view)
    
    testListViewController.didMove(toParentViewController: self)
  }
  
  private func setupBinding() {
    containerContentOffsetObservation = containerScrollView.observe(\.contentOffset, options: [.new]) { [weak self] scrollView, change in
      guard let `self` = self else { return }
      
      if self.testListViewController.scrollView.contentOffset.y > 0.0 || self.containerScrollView.contentOffset.y > 0 {
        if self.containerScrollView.contentOffset.y != 0 {
          self.containerScrollView.contentOffset.y = 0
        }
      }
    }
    
    //    testListViewController.scrollView.panGestureRecognizer.isEnabled = false
    
    
    testListContentOffsetObservation = testListViewController.scrollView.observe(\.contentOffset, options: [.new]) { [weak self] scrollView, change in
      guard let `self` = self else { return }
      
      if self.containerScrollView.contentOffset.y < 0 {
        if self.testListViewController.scrollView.contentOffset.y != 0 {
          self.testListViewController.scrollView.contentOffset.y = 0
        }
      }
      
//      if self.testListViewController.scrollView.contentOffset.y < 0 || self.containerScrollView.contentOffset.y > 0 {
//        if self.testListViewController.scrollView.contentOffset.y != 0 {
//          self.testListViewController.scrollView.contentOffset.y = 0
//        }
//      } else {
//        if self.containerScrollView.contentOffset.y > 0 {
//          self.containerScrollView.contentOffset.y = 0
//        }
//      }
//      if self.containerScrollView.contentOffset.y < 0
//        && self.testListViewController.scrollView.contentOffset.y != 0 {
//
//        self.testListViewController.scrollView.contentOffset.y = 0
//      }
//      if currentOffset.y < 0 {
//        self?.testListViewController.scrollView.panGestureRecognizer.isEnabled = false
//        self?.testListViewController.scrollView.contentOffset = CGPoint(x: 0, y: 0)
//      } else {
//        self?.testListViewController.scrollView.panGestureRecognizer.isEnabled = true
//      }
    }
    
  }
  
}

