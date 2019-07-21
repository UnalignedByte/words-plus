//
//  WordsStore.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 08/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI
import Combine

final class WordsStore: BindableObject {
    var willChange = PassthroughSubject<Void, Never>()

    var groups = [Group]() {
        willSet {
            willChange.send(())
        }
    }

    func load() {
        let testWordsGeneric = [Word(language: .general, values: ["Word 0", "Translation 0"]),
                         Word(language: .general, values: ["Word 1", "Translation 1"]),
                         Word(language: .general, values: ["Word 2", "Translation 2"])]
        let testWordsChinese = [Word(language: .chinese, values: ["词语 0", "拼音 0", "Translation 0"]),
                                Word(language: .chinese, values: ["词语 1", "拼音 1", "Translation 1"]),
                                Word(language: .chinese, values: ["词语 2", "拼音 2", "Translation 2"])]
        let testGroups = [Group(language: .general, name: "Group General", words: testWordsGeneric),
                          Group(language: .chinese, name: "Group 中文", words: testWordsChinese)]
        self.groups = testGroups
    }
}
