//
//  ProfileCell.swift
//  InsProfilePage
//
//  Created by 谢文韬 on 12/28/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class ProfileCell:UICollectionViewCell{
    // Properties
    var image:UIImage?{
        /*
         when the action executed, this didSet get called.
         Guard statement, make sure image exists
         */
        didSet{
            guard let image = image else {return}
            cellimageView.image = image
        }
    }
    let cellimageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "venom")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
       
        return iv
    }()
    // Lifecycle
    override init(frame: CGRect){
        super.init(frame:frame)
        addSubview(cellimageView)
        cellimageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
