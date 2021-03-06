//
//  RootViewController.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 01.05.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import UIKit


class RootViewController: UIViewController, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController?
    
    func initNotification() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        self.pageViewController!.delegate = self
        let startingViewController = self.modelController.viewControllerAtIndex(1, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        self.pageViewController!.dataSource = self.modelController
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        self.pageViewController!.didMove(toParentViewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var modelController: ModelController {
        if _modelController == nil {
            _modelController = ModelController()
        }
        _modelController?.delegate = self
        return _modelController!
    }
    
    var _modelController: ModelController? = nil
    
    // MARK: - UIPageViewController delegate methods
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .portrait) || (orientation == .portraitUpsideDown) || (UIDevice.current.userInterfaceIdiom == .phone) {
            
            let currentViewController = self.pageViewController!.viewControllers![0]
            let viewControllers = [currentViewController]
            self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
            self.pageViewController!.isDoubleSided = false
            return .min
        }
        
        let currentViewController = self.pageViewController!.viewControllers![0] 
        var viewControllers: [UIViewController]
        let indexOfCurrentViewController = self.modelController.indexOfViewController(currentViewController)
        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
            let nextViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerAfter: currentViewController)
            viewControllers = [currentViewController, nextViewController!]
        } else {
            let previousViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerBefore: currentViewController)
            viewControllers = [previousViewController!, currentViewController]
        }
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
        return .mid
    }
    
    private func slideToPage(index: Int, completion: (() -> Void)?) {
        let count = 3
        
        let currentPageIndex = self.modelController.indexCarentViewController
        if index < count {
            if index > currentPageIndex {
                if let vc = self.modelController.viewControllerAtIndex(index, storyboard: self.storyboard!) {
                    self.pageViewController?.setViewControllers([vc], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: { (complete) -> Void in
                        completion?()
                    })
                }
            } else if index < currentPageIndex {
                if let vc = self.modelController.viewControllerAtIndex(index, storyboard: self.storyboard!) {
                    self.pageViewController?.setViewControllers([vc], direction: UIPageViewControllerNavigationDirection.reverse, animated: true, completion: { (complete) -> Void in
                        completion?()
                    })
                }
            }
        }
    }
}

extension RootViewController: ModelControllerDelegate {
    func moveToControler() {
        slideToPage(index: 1, completion: {
        })
    }
}

