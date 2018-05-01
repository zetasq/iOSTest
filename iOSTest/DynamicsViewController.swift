//
//  DynamicsViewController.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 29/01/2018.
//  Copyright © 2018 Zhu Shengqi. All rights reserved.
//

import UIKit

class DynamicsViewController: UIViewController {
  
  private lazy var squareView: UIView = {
    let squareView = UIView()
    squareView.backgroundColor = .red
    return squareView
  }()
  
  private lazy var barrier: UIView = {
    let barrier = UIView()
    barrier.backgroundColor = .green
    return barrier
  }()
  
  private lazy var animator: UIDynamicAnimator = {
    let animator = UIDynamicAnimator(referenceView: self.view)
    return animator
  }()
  
  private lazy var gravityBehavior: UIGravityBehavior = {
    let gravityBehavior = UIGravityBehavior()
    return gravityBehavior
  }()
  
  private lazy var collisionBehavior: UICollisionBehavior = {
    let collisionBehavior = UICollisionBehavior()
    collisionBehavior.translatesReferenceBoundsIntoBoundary = true
    return collisionBehavior
  }()
  
  private lazy var itemBehavior: UIDynamicItemBehavior = {
    let itemBehavior = UIDynamicItemBehavior()
    itemBehavior.elasticity = 0.6
    return itemBehavior
  }()
  
  private lazy var view1: UIView = {
    let view1 = UIView()
    view1.backgroundColor = .red
    return view1
  }()
  
  private lazy var view2: UIView = {
    let view2 = UIView()
    view2.backgroundColor = .green
    return view2
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let transition = CATransition()
    transition.startProgress = 0
    transition.endProgress = 1.0
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFromRight
    transition.duration = 3.0
    
    // Add the transition animation to both layers
    view1.layer.add(transition, forKey: "transition")
    view2.layer.add(transition, forKey: "transition")

    view1.isHidden = true
    view2.isHidden = false
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    
    view.addSubview(view1)
    view1.isHidden = false
    view1.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    view.addSubview(view2)
    view2.isHidden = true
    view2.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    
    return
    squareView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    view.addSubview(squareView)
    
    barrier.frame = CGRect(x: 0, y: 300, width: 130, height: 20)
    view.addSubview(barrier)
    
    animator.addBehavior(gravityBehavior)
    animator.addBehavior(collisionBehavior)
    animator.addBehavior(itemBehavior)
    
    gravityBehavior.addItem(squareView)
    collisionBehavior.addItem(squareView)
    collisionBehavior.addItem(barrier)
    itemBehavior.addItem(squareView)
  }
}
