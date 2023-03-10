//
//  TodayFullscreenController.swift
//  AppStoreJSON
//
//  Created by Mederbek on 10/3/23.
//

import UIKit

class TodayFullscreenController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = TodayCell()
    return header
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 450
  }
}
