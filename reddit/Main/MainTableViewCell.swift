//
//  MainTableViewCell.swift
//  reddit
//
//  Created by Philip Starner on 3/20/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {

    var imageThumb: UIImageView!
    var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let theContentView = self.contentView
        let marginGuide = theContentView.layoutMarginsGuide
        
        self.titleLabel = UILabel(frame: CGRect(x: 80, y: 80, width: 250, height: 70))
        self.titleLabel.numberOfLines = 0
        theContentView.addSubview(titleLabel!)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 84).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: theContentView.trailingAnchor).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        self.titleLabel.heightAnchor.constraint(equalTo: marginGuide.heightAnchor).isActive = true
        
        
        self.imageThumb = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        theContentView.addSubview(imageThumb!)
        self.imageThumb.clipsToBounds = true
        self.imageThumb.contentMode = .scaleAspectFit
        
        self.imageThumb.translatesAutoresizingMaskIntoConstraints = false
        self.imageThumb.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        self.imageThumb.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        self.imageThumb.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        self.imageThumb.trailingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: -6).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.imageThumb.image = nil
        self.titleLabel.text = nil
    }
    
    func loadModel(data: Data?) {
        if let data = data {
            if let thumbnail = data.thumbnail {
                if thumbnail.hasPrefix("http") {
                    let url = URL(string: thumbnail)
                    self.imageThumb.sd_setImage(with: url)
                } else {
                    showDefaultThumb()
                }
            } else {
                showDefaultThumb()
            }
            
            self.titleLabel.text = data.title
        }
    }
    
    func showDefaultThumb() {
        let rand = arc4random_uniform(8)
        let imageString = "o\(rand+1)"
        self.imageThumb.image = UIImage(named: imageString)
    }
    

}
