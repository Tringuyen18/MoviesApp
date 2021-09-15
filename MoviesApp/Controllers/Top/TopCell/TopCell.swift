//
//  TopCell.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import UIKit

class TopCell: UITableViewCell {

    
    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
