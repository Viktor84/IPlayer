//
//  ModelController.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 01.05.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import UIKit

protocol ModelControllerDelegate: class {
    func moveToControler()
}

class ModelController: NSObject {
    
    weak var delegate: ModelControllerDelegate?
    var pageData: [UIViewController] = []
    var indexCarentViewController = 0
    
    override init() {
        super.init()
    }
}

extension ModelController: UIPageViewControllerDataSource {
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> UIViewController? {
        indexCarentViewController = index
        
        switch  indexCarentViewController {
        case  0 :
            let equalizerViewController = storyboard.instantiateViewController(withIdentifier: "EqualizerViewController") as! EqualizerViewController
            return equalizerViewController
        case  1:
            let playerViewController = storyboard.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
            return playerViewController
        case 2:
            let playlistViewController = storyboard.instantiateViewController(withIdentifier: "PlaylistViewController") as! PlaylistViewController
            playlistViewController.delegate = self
            return playlistViewController
        default:
            return nil
        }
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        
        if viewController is PlayerViewController {
            return 1
        }
        if viewController is EqualizerViewController {
            return 0
        }
        if viewController is PlaylistViewController {
            return 2
        }
        return NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        
        if index == NSNotFound {
            return nil
        }
        index += 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
}

extension ModelController: PlaylistViewControllerDelegate {
    func moveToPlayerControler() {
        delegate?.moveToControler()
    }
}


