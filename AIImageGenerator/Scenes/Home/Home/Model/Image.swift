//
//  Image.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 08.03.2024.
//

import Foundation

struct AiImage: Hashable {
    let status: String
    let id: Int
    let eta: Int?
    let output: [URL]
    let proxyLinks: [URL]
    
    
    static let mockImage = AiImage(
        status: "succes",
        id: 123456789,
        eta: nil,
        output: [URL(string:         "https://pub-3626123a908346a7a8be8d9295f44e26.r2.dev/generations/0-a068c493-a5c4-48a2-8c6c-88c616db7f0c.png")!],
        proxyLinks: [URL(string:         "https://cdn2.stablediffusionapi.com/generations/0-a068c493-a5c4-48a2-8c6c-88c616db7f0c.png")!]
    )
}
