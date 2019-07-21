//
//  Word.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 07/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import Foundation

struct Word {
    let language: Language
    var values: [String] { didSet {
        guard values.count == language.valuesCount else {
            fatalError()
        }
    }}
}
