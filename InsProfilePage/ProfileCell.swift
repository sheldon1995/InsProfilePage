//
//  ProfileCell.swift
//  InsProfilePage
//
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
        iv.image = #imageLiteral(resourceName: "2")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
       
        return iv
    }()
    // Lifecycle
    /*
      If the context has a flipped-coordinate space—often the case on iOS—the origin is in the upper-left corner and the rectangle extends towards the lower-right corner.
     */
    override init(frame: CGRect){
        super.init(frame:frame)
        addSubview(cellimageView)
        cellimageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
