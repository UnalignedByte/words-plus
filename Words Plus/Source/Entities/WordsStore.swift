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

    var groups = WordsStore.testGroups {
        willSet {
            willChange.send(())
        }
    }

    var words = WordsStore.testWords {
        willSet {
            willChange.send(())
        }
    }

    private static let testWords = [Word(id: "0", word: "word 0", translation: "translation 0", pinyin: "pinyin 0"),
                                    Word(id: "1", word: "word 1", translation: "translation 1", pinyin: "pinyin 1"),
                                    Word(id: "2", word: "word 2", translation: "translation 2", pinyin: "pinyin 2")]

    private static let testGroups = [Group(name: "Group 0", words: testWords),
                                     Group(name: "Group 1", words: testWords),
                                     Group(name: "Group 2", words: testWords)]
}
