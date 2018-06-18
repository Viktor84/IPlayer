//
//  IPlayerTabelViewCell.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 18.06.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import UIKit

class IPlayerTabelViewCell: UITableViewCell {

    @IBOutlet weak var musicalGroupLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var pictureBig: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(song: Song) {
        
       // cellDeviceType = deviceType
        musicalGroupLabel.text = song.musicalGroup
        songLabel.text = song.titleSong
        //pictureBig.image = imageView.url
        //var myImage =  UIImage(data: NSData(contentsOfURL: NSURL(string:"http://upload.wikimedia.org/wikipedia/en/4/43/Apple_Swift_Logo.png")))
       
        
        

    
        
        
        //        equipmentImage.sd_setImage(with: URL(string: deviceType.logo), placeholderImage: nil)
    }

}
