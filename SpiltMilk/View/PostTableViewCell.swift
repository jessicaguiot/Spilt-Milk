//
//  PostTableViewCell.swift
//  Bookshelf
//
//  Created by Hiago Chagas on 13/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //sets the data from the model post inside the table cell
    var post: Post?{
        didSet{
            userImageView.image = post?.userImage
            userNameLabel.text = post?.userName
            dateLabel.text = post?.date
            postImageView.image = post?.postImage
            postDescriptionLabel.text = post?.postDescription
            likeLabel.text =  post?.getLikeCount()
            commentsLabel.text = post?.getCommentsCount()
        }
    }
    //the data displayed in the table view cell
    
    private var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 2
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let userImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.heightAnchor.constraint(equalToConstant: 52).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 52).isActive = true
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 26
        
        return imgView
    }()
    
    private let userNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let dateLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 11)
        return lbl
    }()
    
    private let postImageView: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    private let postDescriptionLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .justified
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.numberOfLines = 0
        return lbl
    }()
    private var grayBar: UIView = {
        let bar = UIView()
        bar.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bar.backgroundColor = .lightGray
        return bar
    }()
    
    private var likeButton: UIButton = {
       var button = UIButton()
        button.tintColor = .lightGray
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        return button
    }()
    private var likeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    private var commentsButton: UIButton = {
       var button = UIButton()
        button.tintColor = .lightGray
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()
    private var commentsLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    private var bookmarkButton: UIButton = {
        var btn = UIButton()
        btn.tintColor = .lightGray
        btn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        btn.setImage(UIImage(systemName: "bookmark.fill"), for: .selected)
        return btn
    }()
    
    //adds an UIView to View and sets its constraints
    func addToView(view: UIView, topAnchor: NSLayoutYAxisAnchor?, botAnchor: NSLayoutYAxisAnchor?, leftAnchor: NSLayoutXAxisAnchor?, rightAnchor: NSLayoutXAxisAnchor?, topSpacing: CGFloat, leftSpacing: CGFloat, rightSpacing: CGFloat, downSpacing: CGFloat){
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        if ((leftAnchor) != nil){
            view.leftAnchor.constraint(equalTo: leftAnchor!, constant: leftSpacing).isActive = true
        }
        if ((rightAnchor) != nil){
            view.rightAnchor.constraint(equalTo: rightAnchor!, constant: rightSpacing).isActive = true
        }
        if ((topAnchor) != nil){
            view.topAnchor.constraint(equalTo: topAnchor!, constant: topSpacing).isActive = true
        }
        if ((botAnchor) != nil){
            view.bottomAnchor.constraint(equalTo: botAnchor!, constant: downSpacing).isActive = true
        }
    }
    
    @objc func likeButtonAction(){
        if likeButton.isSelected == false{
            likeButton.isSelected = true
            likeButton.tintColor = .red
            post?.setLikeCount(value: 1)
        }else if likeButton.isSelected == true{
            likeButton.isSelected = false
            likeButton.tintColor = .lightGray
            post?.setLikeCount(value: -1)
        }
    }
    
    @objc func bookmarkButtonAction(){
        if bookmarkButton.isSelected == false{
            bookmarkButton.isSelected = true
            bookmarkButton.tintColor = #colorLiteral(red: 0, green: 0.5137254902, blue: 0.5607843137, alpha: 1)
        }
        else{
            bookmarkButton.isSelected = false
            bookmarkButton.tintColor = .lightGray
        }
    }
    
    
    
    //adds the cell components inside of it
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Adding to View and setting constraints
        addToView(view: bgView, topAnchor: topAnchor, botAnchor: bottomAnchor, leftAnchor: leftAnchor, rightAnchor: rightAnchor, topSpacing: 12, leftSpacing: 16, rightSpacing: -19, downSpacing: -5)
        addToView(view: userImageView, topAnchor: bgView.topAnchor, botAnchor: nil, leftAnchor: bgView.leftAnchor, rightAnchor: nil, topSpacing: 5, leftSpacing: 11, rightSpacing: 0, downSpacing: 0)
        addToView(view: userNameLabel, topAnchor: userImageView.topAnchor, botAnchor: nil, leftAnchor: userImageView.rightAnchor, rightAnchor: nil, topSpacing: 9, leftSpacing: 7.5, rightSpacing: 0, downSpacing: 0)
        addToView(view: dateLabel, topAnchor: userNameLabel.bottomAnchor, botAnchor: nil, leftAnchor: userNameLabel.leftAnchor, rightAnchor: nil, topSpacing: 0.3, leftSpacing: 0, rightSpacing: 0, downSpacing: 0)
        addToView(view: postImageView, topAnchor: dateLabel.bottomAnchor, botAnchor: nil, leftAnchor: dateLabel.leftAnchor, rightAnchor: bgView.rightAnchor, topSpacing: 16, leftSpacing: 0, rightSpacing: -17, downSpacing: 0)
        addToView(view: postDescriptionLabel, topAnchor: postImageView.bottomAnchor, botAnchor: nil, leftAnchor: postImageView.leftAnchor, rightAnchor: postImageView.rightAnchor, topSpacing: 10, leftSpacing: 0, rightSpacing: 0, downSpacing: 0)
        addToView(view: grayBar, topAnchor: postDescriptionLabel.bottomAnchor, botAnchor: nil, leftAnchor: postDescriptionLabel.leftAnchor, rightAnchor: postDescriptionLabel.rightAnchor, topSpacing: 6.5, leftSpacing: 0, rightSpacing: 0, downSpacing: 0)
        addToView(view: likeButton, topAnchor: grayBar.bottomAnchor, botAnchor: bgView.bottomAnchor, leftAnchor: grayBar.leftAnchor, rightAnchor: nil, topSpacing: 4, leftSpacing: 0, rightSpacing: 0, downSpacing: -10)
        addToView(view: likeLabel, topAnchor: nil, botAnchor: nil, leftAnchor: likeButton.rightAnchor, rightAnchor: nil, topSpacing: 0, leftSpacing: 2, rightSpacing: 0, downSpacing: 0)
        addToView(view: commentsButton, topAnchor: likeButton.topAnchor, botAnchor: nil, leftAnchor: likeLabel.rightAnchor, rightAnchor: nil, topSpacing: 0, leftSpacing: 5, rightSpacing: 0, downSpacing: 0)
        addToView(view: commentsLabel, topAnchor: nil, botAnchor: nil, leftAnchor: commentsButton.rightAnchor, rightAnchor: nil, topSpacing: 0, leftSpacing: 2, rightSpacing: 0, downSpacing: 0)
        addToView(view: bookmarkButton, topAnchor: likeButton.topAnchor, botAnchor: nil, leftAnchor: nil, rightAnchor: grayBar.rightAnchor, topSpacing: 0, leftSpacing: 0, rightSpacing: 0, downSpacing: 0)
       
        //center labels vertically with their buttons
        likeLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        commentsLabel.centerYAnchor.constraint(equalTo: commentsButton.centerYAnchor).isActive = true
        
        //adds actions to buttons
        likeButton.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
        bookmarkButton.addTarget(self, action: #selector(bookmarkButtonAction), for: .touchUpInside)
        
        //removes the gray background when the cell is clicked
        self.selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

