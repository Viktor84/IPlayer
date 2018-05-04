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


class ModelController: NSObject, UIPageViewControllerDataSource {

    var pageData: [String] = []


    override init() {
        super.init()
        // Create the data model.
        //let dateFormatter = DateFormatter()
        //pageData = dateFormatter.monthSymbols
        let dataForView = ["1", "2", "3"]
        pageData = dataForView
    }

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        //Верните контроллер просмотра данных для данного индекса.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        // создать новый контроллер представления и передать подходящие данные.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index] //данные
        return dataViewController
    }

    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // Верните индекс данного контроллера представления данных.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        //Для простоты эта реализация использует статический массив объектов модели, а контроллер вида хранит объект модели; поэтому вы можете использовать объект модели для идентификации индекса.
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
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


