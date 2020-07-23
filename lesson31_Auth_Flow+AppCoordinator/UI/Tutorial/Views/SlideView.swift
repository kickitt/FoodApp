//
//  Slide.swift
//  TutorialSlider
//
//  Created by OlegChudnovskiy on 17.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import UIKit

class SlideView: UIView {
    
    @IBOutlet weak var contentView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var iconImageView: UIImageView?
    @IBOutlet weak var leadingIconLayoutConstraint: NSLayoutConstraint?

    //MARK: - private func
    static func createSlides() -> [SlideView] {
        let slideModel: [SlideModel] = SlideModel.createSlides()
        var slideView: [SlideView] = []
        
        for i in 0..<slideModel.count {
            let slide: SlideView = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! SlideView
            slide.iconImageView?.image = UIImage(named: slideModel[i].getIcon())
            slide.imageView?.image = UIImage(named: slideModel[i].getImage())
            slide.titleLabel?.text = slideModel[i].getTitle()
            slide.leadingIconLayoutConstraint?.constant = slide.calculationIconLayoutConstraint(slideNumber: i)
            slideView.append(slide)
        }
        return slideView
    }
    
    //MARK: - private func
    private func calculationIconLayoutConstraint(slideNumber: Int) -> CGFloat {
        var result = CGFloat()
        switch slideNumber {
        case 1:
            let frameWidth = Float(self.frame.width * 0.3)
            result = CGFloat(frameWidth + 16)
            break
        case 2:
            let frameWidth = Float(self.frame.width - (self.frame.width * 0.44))
            result = CGFloat(frameWidth + 16)
            break
        case 3:
            let frameWidth = Float(self.frame.width * 0.28)
            result = CGFloat(frameWidth - 31)
            break
        default:
            let frameWidth = Float(self.frame.width / 2)
            result = CGFloat(frameWidth - 34)
            break
        }
        return result
    }
}
