//
//  IPlayerTabelViewCell.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 18.06.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import UIKit
import SDWebImage

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
        musicalGroupLabel.text = song.musicalGroup
        songLabel.text = song.titleSong
        pictureBig.sd_setImage(with: URL(string: song.pictureBig!), placeholderImage: nil)
    }

    func cancelCellImageLoad() {
        pictureBig.sd_cancelCurrentImageLoad()
        pictureBig.image = nil
    }

}
