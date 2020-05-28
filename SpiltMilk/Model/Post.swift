//
//  Post.swift
//  Bookshelf
//
//  Created by Hiago Chagas on 14/05/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

struct Post{
    var userName: String
    var userImage: UIImage
    var date: String
    var postImage: UIImage
    var postDescription: String
    var likesCount: Int
    var commentsCount: Int = 0
    
    func getLikeCount() -> String{
        return String(likesCount)
    }
    
    mutating func setLikeCount(value: Int){
        self.likesCount += value
    }
    
    func getCommentsCount() -> String{
        return String(commentsCount)
    }
    
}

func getPosts() -> [Post]{
    let lorem1 = "Lorem ipsum dolor sit amet lorem ipsum dolor sit amet"
    let lorem2 = "Lorem ipsum dolor sit amet lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet"
    let lorem3 = "Lorem ipsum dolor sit amet lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet Lorem ipsum dolor sit amet lorem ipsum dolor sit amet"
    var posts = [Post]()
    posts.append(Post(userName: "João da Silva", userImage: UIImage(named: "joao")!, date: "27/04/2020", postImage: UIImage(named: "post")!, postDescription: lorem1, likesCount: 10))
    posts.append(Post(userName: "Joana da Silva", userImage: UIImage(named: "joana")!, date: "25/03/2020", postImage: UIImage(named: "post")!, postDescription: lorem2, likesCount: 25))
    posts.append(Post(userName: "Hiago Chagas", userImage: UIImage(named: "hiago")!, date: "22/04/2020", postImage: UIImage(named: "post")!, postDescription: lorem3, likesCount: 1))
    return posts
}
