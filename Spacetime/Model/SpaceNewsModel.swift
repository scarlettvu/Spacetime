//
//  SpaceNewsModel.swift
//  Spacetime
//
//  Created by Scarlett  on 4/10/23.
//

import Foundation
struct SpacetimeNews: Codable{
    let id: Int
    let title: String
    let url: String
    let imageUrl: String
    let summary: String
    let newsSite: String
}
