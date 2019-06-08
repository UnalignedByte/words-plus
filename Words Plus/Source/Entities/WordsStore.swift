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
    let didChange = PassthroughSubject<Void, Never>()

    var words = WordsStore.testWords {
        didSet {
            didChange.send(())
        }
    }

    private static let testWords = [Word(id: "0", word: "word 0", translation: "translation 0", pinyin: "pinyin 0"),
                                    Word(id: "1", word: "word 1", translation: "translation 1", pinyin: "pinyin 1"),
                                    Word(id: "2", word: "word 2", translation: "translation 2", pinyin: "pinyin 2")]
}
