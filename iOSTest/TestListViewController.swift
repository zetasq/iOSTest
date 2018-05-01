//
//  ViewController.swift
//  iOSTest
//
//  Created by Zhu Shengqi on 28/08/2017.
//  Copyright © 2017 Zhu Shengqi. All rights reserved.
//

import UIKit

class TestListViewController: UIViewController {

  private lazy var testButtonItem: UIBarButtonItem = {
    let button = UIButton(type: .system)
    button.setTitle("120", for: [])
    button.setTitleColor(.blue, for: [])
    let testButtonItem = UIBarButtonItem(customView: button)
    
    return testButtonItem
  }()
  
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    
    imageView.image = UIImage(named: "beast_wars_rampage")
    imageView.contentMode = .scaleAspectFill
    
    return imageView
  }()
  
  var scrollView: UIScrollView {
    return tableView
  }
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.backgroundColor = .clear
    tableView.tableFooterView = UIView()
    
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    
//    let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: nil)
//    
    
    return tableView
  }()
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: - UI setup
  private func setupUI() {
//    title = "Guest"
//
    view.backgroundColor = .white

    navigationItem.rightBarButtonItem = testButtonItem

    view.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
  }

}

extension TestListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
    return cell
  }
}

extension TestListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
//
//extension TestListViewController: UIGestureRecognizerDelegate {
//
//  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//    return true
//  }
//
//}

