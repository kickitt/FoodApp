//
//  TutorialController.swift
//  TutorialSlider
//
//  Created by OlegChudnovskiy on 17.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import UIKit

class TutorialController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView? {
        didSet{
            if let scrollView = scrollView {
                scrollView.delegate = self
            }
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl?
    @IBOutlet weak var customButton: TutorialButton?
    
    var onAppStarted: ((TutorialController?) -> ())?

    
    var slides = SlideView.createSlides()
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupSlideScrollView(slides: slides)
        setupPageControl()
        setupButtonAction()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true //false
    }
    
    //MARK: - Private
    private func setupSlideScrollView(slides : [SlideView]) {
        if let scrollView = scrollView {
            scrollView.frame = CGRect(x: 0,
                                      y: 0,
                                      width: view.frame.width,
                                      height: scrollView.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                            height: scrollView.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                         y: 0,
                                         width: view.frame.width,
                                         height: scrollView.frame.height)
                scrollView.addSubview(slides[i])
                slides[i].layoutIfNeeded()
            }
            scrollView.contentSize.height = 1.0 // disable vertical scroll
            scrollView.showsVerticalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
        }
    }
    
    private func setupPageControl() {
        if let pageControl = pageControl {
            pageControl.numberOfPages = slides.count
            pageControl.currentPage = 0
            pageControl.pageIndicatorTintColor = UIColor(red: 53/255, green: 132/255, blue: 159/255, alpha: 1)
            pageControl.currentPageIndicatorTintColor = UIColor(red: 125/255, green: 189/255, blue: 211/255, alpha: 1)
            
            view.bringSubviewToFront(pageControl)
        }
    }
    
    private func setupButtonAction() {
        if let customButton = customButton {
            customButton.onButtonClicked = { [weak self] _ in
                if
                    let pageControl = self?.pageControl,
                    let slideCount = self?.slides.count,
                    let scrollView = self?.scrollView
                {
                    if pageControl.currentPage < slideCount - 1 {
                    pageControl.currentPage = pageControl.currentPage + 1
                    if
                        let x = self?.slides[pageControl.currentPage].frame.origin.x,
                        let y = self?.slides[pageControl.currentPage].frame.origin.y
                    {
                        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: true)
                    }
                } else {
                        // Start Login
                        debugPrint("Start Login")
                        self?.onAppStarted?(self)
                    }
                }
            }
        }
}
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        if let pageControl = pageControl {
            pageControl.currentPage = Int(pageIndex)
            if pageControl.currentPage == slides.count - 1 {
                customButton?.textToButtonLabel = "Приступить"
            } else {
                customButton?.textToButtonLabel = "Далее"
            }
        }
    }
}
