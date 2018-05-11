//
//  ModelController.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 01.05.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

class ModelController: NSObject {

    var pageData: [UIViewController] = []


    override init() {
        super.init()
        // Create the data model.
    }
}

    extension ModelController: UIPageViewControllerDataSource {
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> UIViewController? {
        // Return the data view controller for the given index.
        //Верните контроллер просмотра данных для данного индекса.
       // if (self.pageData.count == 0) || (index >= self.pageData.count) { //прорверка
        //    return nil
        //}
        // Create a new view controller and pass suitable data.
        // создать новый контроллер представления и передать подходящие данные.
        
        let indexCarentViewController = index  //[0, 1, 2]
        
         switch  indexCarentViewController {
         
         case  0 :
            let equalizerViewController = storyboard.instantiateViewController(withIdentifier: "EqualizerViewController") as! EqualizerViewController
         
         return equalizerViewController
         
         case  1:
            let playerViewController = storyboard.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
         
         return playerViewController
         
         case 2:
            let playlistViewController = storyboard.instantiateViewController(withIdentifier: "PlaylistViewController") as! PlaylistViewController

         return playlistViewController
         
         default:
         return nil
         }
    }


    func indexOfViewController(_ viewController: UIViewController) -> Int {
        // Return the index of the given data view controller.
        // Верните индекс данного контроллера представления данных.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        //Для простоты эта реализация использует статический массив объектов модели, а контроллер вида хранит объект модели; поэтому вы можете использовать объект модели для идентификации индекса.
        
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

//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//      return pageData.count
//    }
//    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
    
}


