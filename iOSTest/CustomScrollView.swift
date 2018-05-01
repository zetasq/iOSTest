//
//  CustomScrollView.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 2018/5/1.
//  Copyright © 2018 Zhu Shengqi. All rights reserved.
//

import UIKit

final class CustomScrollView: UIScrollView, UIGestureRecognizerDelegate {
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
  
}
