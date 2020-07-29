//
//  LessonsController.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 17.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import UIKit

class LessonsController: BaseViewController {

    var onSelectedLesson: ((Lesson)->())?
    
    @IBOutlet private var tableView: UITableView?
    private let dataSource: [Lesson] = Lesson.testData()
    
    override func setupController() {
        self.title = "All lessons"
        self.tabBarItem = UITabBarItem(title: "Lessons",
                                       image: R.image.allLessonsIcon(),
                                       tag: 0)
       
    }
}

extension LessonsController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.lessonCell, for: indexPath)!
        cell.model = dataSource[indexPath.row]
        self.tableView?.tableFooterView = UIView()
        
        return cell
    }
}

extension LessonsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        onSelectedLesson?(dataSource[indexPath.row])
       // print("section = \(indexPath.section), row = \(indexPath.row)")
        
    }
   
}
