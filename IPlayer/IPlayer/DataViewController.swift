//
//  DataViewController.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 01.05.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    //@IBOutlet weak var dataLabel: UILabel!
    var dataObject: UIViewController?  // dataObject ?
        


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.dataLabel!.text = dataObject
    }


}

