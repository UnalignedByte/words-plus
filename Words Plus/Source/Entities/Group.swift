//
//  Group.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 08/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import Foundation

struct Group {
    let language: Language
    var name: String
    var words: [Word] { didSet {
        let containsWrongWords = words.filter { word in
            word.language != language
        }.count > 0
        guard !containsWrongWords else {
            fatalError()
        }
    } }
}
