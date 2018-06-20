//
//  IPlayerTabelViewCell.swift
//  IPlayer
//
//  Created by Viktor Pechersky on 18.06.2018.
//  Copyright © 2018 Viktor Pechersky. All rights reserved.
//

import UIKit
import SDWebImage

protocol IPlayerTabelViewCellDelegate: class {
    func playSong(song: Song)
}
class IPlayerTabelViewCell: UITableViewCell {

    @IBOutlet weak var musicalGroupLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var pictureBig: UIImageView!
    
    weak var delegate: IPlayerTabelViewCellDelegate?
    private var currentSong: Song?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(song: Song) {
        currentSong = song
        musicalGroupLabel.text = song.musicalGroup
        songLabel.text = song.titleSong
        pictureBig.sd_setImage(with: URL(string: song.pictureBig!), placeholderImage: nil)
    }

    func cancelCellImageLoad() {
        pictureBig.sd_cancelCurrentImageLoad()
        pictureBig.image = nil
    }
    
    @IBAction func onPlayClick(_ sender: UIButton) {
        guard let _song = currentSong else {
            return
        }
        delegate?.playSong(song: _song)
        //PlayerViewController.playStopButton
        
    }

}
