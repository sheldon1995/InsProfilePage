//
//  ViewController.swift
//  InsProfilePage
//
//

import UIKit

private let headIdentifier = "ProfileHeader"
private let cellIdentifier = "ProfileCell"

/*
 Change UIViewController to UICollectionViewController
 But to make it works, change code in AppDelegate.swift
 */

class ProfileController: UICollectionViewController {
    
    // MARK: - Properties
    // Array of images
    
    let images:[UIImage] = [#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "10"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "14"),#imageLiteral(resourceName: "7"),#imageLiteral(resourceName: "13"),#imageLiteral(resourceName: "11"),#imageLiteral(resourceName: "14"),#imageLiteral(resourceName: "15"),#imageLiteral(resourceName: "8"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "5"),#imageLiteral(resourceName: "9")]
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background color of collection view
        collectionView.backgroundColor = .white
        view.backgroundColor = .white       
        
        
        // Register header
        // Registers a class for use in creating supplementary views for the collection view.
        // elementKindSectionHeader: A supplementary view that identifies the header for a given section.
        collectionView!.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headIdentifier)
        
        // Register cell
        // Register a class for use in creating new collection view cells.
        collectionView!.register(ProfileCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        // Fill the white space for Iphone X and later, since these has a black rectangle area.
        // Never: Do not adjust the scroll view insets.
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    /*
     preferredStatusBarStyle is a new var on UIViewController .
     It has to be overriden in your custom view-controller
     which means that here you can control the styling of its status bar, black or white
     */
    // lightContent. A light status bar, intended for use on dark backgrounds.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension ProfileController{
    /*
     Asks your data source object to provide a supplementary view to display in the collection view.
     By dequeue.
     */
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headIdentifier, for: indexPath) as! ProfileHeader
        return header
    }
    /*
     Asks your data source object for the number of items in the specified section.
     */
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Cast
        // indexPath: The index path specifying the location of the cell.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ProfileCell
        cell.image = images[indexPath.row]
        return cell
    }
    
}
extension ProfileController:UICollectionViewDelegateFlowLayout{
    // Asks the delegate for the size of the header view in the specified section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Return the size of the header. If you return a value of size (0, 0), no header is added.
        return CGSize(width: view.frame.width, height: 300)
    }
    
    // Adjust assignment of cells
    /*
     MinimumLineSpace: Asks the delegate for the spacing between successive rows or columns of a section.
     
     For a vertically scrolling grid, this value represents the minimum spacing between successive rows. For a horizontally scrolling grid, this value represents the minimum spacing between successive columns.
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    // The minimum space (measured in points) to apply between successive items in the lines of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    /*
     We want three cells at each row, which means we need two pixel of space lines.
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 2 is two pixels
        // 3 means we want three cells.
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
}
// Customize the blue background
/*
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainBlue = UIColor.rgb(red: 0, green: 150, blue: 255)
}
*/
// Reuseable function
extension UIView {
    /*
     Left-top corner of screen
     xxxxxx
     y
     y
     y
     y
     */
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
                paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        // This is the way to activate programmatic constrains
        translatesAutoresizingMaskIntoConstraints = false
        
        // If the top anchor exists
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

