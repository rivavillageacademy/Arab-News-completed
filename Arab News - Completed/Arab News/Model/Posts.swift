//
//  Posts.swift
//  Arab News
//
//  Created by Muhamed Alkhatib on 29/08/2020.
//

import Foundation

struct Posts: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let title:String
    let url: String
}
