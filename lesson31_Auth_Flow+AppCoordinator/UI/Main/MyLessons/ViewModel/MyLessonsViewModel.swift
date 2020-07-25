//
//  MyLessonsViewModel.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Yurii Bosov on 24.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import Foundation

class MyLessonsViewModel: ViewModelProtocol {
    
    var onLoading: (() -> ())?
    var onLoadedSuccess: ((Any) -> ())?
    var onLoadedFailed: ((String) -> ())?
    
    func fetchData() {
        onLoading?()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { [weak self] in
            
            self?.onLoadedSuccess?([
                Lesson(title: "1"),
                Lesson(title: "2"),
                Lesson(title: "3"),
                Lesson(title: "4"),
                Lesson(title: "5")
            ])
            // or
//            self?.onLoadedFailed?("Errore message")
        }
    }
}

class MyLessonsViewModelMock: MyLessonsViewModel {
    override func fetchData() {
        
    }
}
