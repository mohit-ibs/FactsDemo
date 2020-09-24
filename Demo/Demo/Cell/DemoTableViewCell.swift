//
//  DemoTableViewCell.swift
//  Demo
//
//  Created by Mohit Gupta on 24/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    //Title Label initialize
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //detail Label initialize
    let detailLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
            label.textColor =  .lightGray
            label.layer.cornerRadius = 5
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.sizeToFit()
            return label
    }()
    //Image view initialize
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false 
        img.layer.cornerRadius = 22
        img.clipsToBounds = true
        return img
    }()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        // configure titleLabel
        contentView.addSubview(profileImageView)
        profileImageView.centerYAnchor.constraint(equalTo:marginGuide.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:marginGuide.leadingAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:44).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:44).isActive = true
        
        // configure titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant:10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true

        // configure authorLabel
        contentView.addSubview(detailLabel)
        detailLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant:10).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func displayAlbumInCell(row: Row) {
        self.titleLabel.text = row.title ?? ""
        self.detailLabel.text = row.rowDescription ?? ""
        if let imageURL = row.imageHref {
            profileImageView.loadImageUsingCacheWithURLString(imageURL, placeHolder: nil) { (bool) in
                //Do any Additional Stuff if needed
            }
        }
    }

}
