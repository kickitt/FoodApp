//
//  SlideModel.swift
//  lesson31_Auth_Flow+AppCoordinator
//
//  Created by Олег Чудновский on 23.07.2020.
//  Copyright © 2020 Bosov. All rights reserved.
//

import Foundation

struct SlideModel {
    private var title: String
    private var image: String
    private var icon: String
    
    //MARK: - Getters
    func getTitle() -> String {
        return title
    }
    
    func getImage() -> String {
        return image
    }
    
    func getIcon() -> String {
        return icon
    }

    //MARK: - Create SlideModel
    static func createSlides() -> [SlideModel] {
        let slide1 = SlideModel(title: "Выбирете блюдо, продукт или французский специалитет, который Вас интересует", image: "1", icon: "FoodAndWine")

        let slide2 = SlideModel(title: "Найдите и посетите самые вкусные места с Фпвнцузскими специалистами вокруг Вас", image: "2", icon: "Marker")
        
        let slide3 = SlideModel(title: "Практикуй свой французский, учи слова и фразы, чтобы свободно изъясняться", image: "3", icon: "EiffelTower")
        
        let slide4: SlideModel = SlideModel(title: "Получай баллы за ответы на вопросы и комментарии. Баллы меня на призы.", image: "4", icon: "VoiceRecognition")
        
        return [slide1, slide2, slide3, slide4]
    }
}
