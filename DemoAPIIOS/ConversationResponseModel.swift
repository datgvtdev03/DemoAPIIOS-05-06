//
//  ConversationResponseModel.swift
//  DemoAPIIOS
//
//  Created by Thanh Dat on 06/06/2023.
//

import Foundation
struct ConversationResponse: Decodable {
    let name: String
    let avatar: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case avatar = "avatar"
        case id = "id"
    }
}

typealias Conversations = [ConversationResponse]
