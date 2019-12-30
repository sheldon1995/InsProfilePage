//
//  ProfileHear.swift
//  InsProfilePage
//
//

import UIKit

class ProfileHeader: UICollectionReusableView{
    
    // Mark properity
    
    let profileImageView: UIImageView = {
        /*
         Create an ImageView
         Set needed properities
         Return this ImageView
         */
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "15")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        /*
         withRenderingMode?
         Always get us the original form of button, without treating it as a template image
         */
        button.setImage(#imageLiteral(resourceName: "ic_mail_outline_white_2x").withRenderingMode(.alwaysOriginal), for: .normal)
        // Self means the function is going to handle the action for the button
        // Selector is the action handler
        button.addTarget(self, action: #selector(handleMessageUser), for: .touchUpInside)
        return button
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_person_add_white_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleFollowUser), for: .touchUpInside)
        
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sheldon Gege"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "sheldon.love.gg@syr.edu"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Selectors
    /*
     By default Swift generates code that is only available to other Swift code, but if you need to interact with the Objective-C runtime – all of UIKit, for example – you need to tell Swift what to do.

     That’s where the @objc attribute comes in: when you apply it to a class or method it instructs Swift to make those things available to Objective-C as well as Swift code. So, any time you want to call a method from a UIBarButtonItem or a Timer, you’ll need to mark that method using @objc so it’s exposed – both of those, and many others, are Objective-C code.
     */
    @objc func handleMessageUser() {
        print("Message user here..")
    }
    
    @objc func handleFollowUser() {
        print("Follow user here..")
    }
    
    // Init
    override init(frame: CGRect){
        super.init(frame:frame)
        backgroundColor = .red
        addSubview(profileImageView)
        // Let the view at X center place
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.anchor(top: topAnchor, paddingTop: 88, width: 120, height: 120)
        // Let the view rounded up with radius 120/2 at a circle shape.
        profileImageView.layer.cornerRadius = 120 / 2
               
        addSubview(messageButton)
        messageButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 64, paddingLeft: 32, width: 32, height: 32)
               
        addSubview(followButton)
        followButton.anchor(top: topAnchor, right: rightAnchor, paddingTop: 64, paddingRight: 32, width: 32, height: 32)
               
        addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.anchor(top: profileImageView.bottomAnchor, paddingTop: 12)
               
        addSubview(emailLabel)
        emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailLabel.anchor(top: nameLabel.bottomAnchor, paddingTop: 4)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}
