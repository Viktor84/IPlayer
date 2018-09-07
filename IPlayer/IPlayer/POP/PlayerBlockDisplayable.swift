//
//  PlayerBlockDisplayable.swift
//  IPlayer
//
//  Created by Svitlana Moiseyenko on 7/15/18.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import Foundation
import UIKit

protocol PlayerBlockDisplayable: class{}

extension PlayerBlockDisplayable where Self: UIView {

    func displayAsGradientView() {
        let gradient = CAGradientLayer()
        
        gradient.frame = self.bounds
        gradient.colors = [UIColor(named: UIColor.AppColor.studioApprox).cgColor,
                           UIColor(named: UIColor.AppColor.cornflowerBlueApprox).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
