//
//  MyLessonsController.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit
import ProgressHUD

class MyLessonsController: BaseViewController {

    var onSelectedLesson: ((Lesson) -> ())?
    var myLessonsViewModel: MyLessonsViewModel?
    
    @IBOutlet private var tableView: UITableView?
    private var dataSource: [Lesson] = []
    
    //MARK: - Setup Controller
    override func setupController() {
        self.title = "My lessons"
        self.tabBarItem = UITabBarItem(title: "My lessons",
                                       image: R.image.myLessons(),
                                       tag: 0)
    }
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pull to refresh
        let refreshControl = UIRefreshControl()
        tableView?.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        
        // setup view model
        myLessonsViewModel?.onLoading = {
            ProgressHUD.show()
        }
        myLessonsViewModel?.onLoadedFailed = { [weak self] errorMessage in
            self?.tableView?.refreshControl?.endRefreshing()
            ProgressHUD.showError(errorMessage)
        }
        myLessonsViewModel?.onLoadedSuccess = { [weak self] dataSource in
            self?.tableView?.refreshControl?.endRefreshing()
            ProgressHUD.dismiss()
            if let dataSource = dataSource as? [Lesson] {
                self?.dataSource = dataSource
                self?.tableView?.reloadData()
            }
        }
        myLessonsViewModel?.fetchData()

    }
    
    //MARK: - Actions
    @objc private func refreshData() {
        myLessonsViewModel?.fetchData()
 
    }
}

extension MyLessonsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.lessonCell, for: indexPath)!
        
        cell.model = dataSource[indexPath.row]
        
        return cell
    }
}

extension MyLessonsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
