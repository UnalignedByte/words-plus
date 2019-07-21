//
//  Language.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 20/07/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import Foundation

enum Language {
    case general
    case chinese
}

extension Language {
    var valuesCount: Int {
        switch self {
        case .general:
            return 2
        case .chinese:
            return 3
        }
    }
    var titles: [String] {
        switch self {
        case .general:
            return ["Both", "Word", "Translation"]
        case .chinese:
            return ["所以", "汉字", "拼音", "翻译"]
        }
    }
    var name: String {
        switch self {
        case .general:
            return "General"
        case .chinese:
            return "中文"
        }
    }
}
