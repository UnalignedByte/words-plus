//
//  WordsList.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 07/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct WordsList: View {
    @State var displayOption: DisplayOption = .everything

    var body: some View {
        List {
            SegmentedControl(selection: $displayOption) {
                ForEach(DisplayOption.allCases.identified(by: \.self)) { option in
                    Text(option.name).tag(option)
                }
            }
            WordRow(word: Word(id: "a", word: "word1", translation: "translation1", pinyin: "pinyin1"), displayOption: displayOption)
            WordRow(word: Word(id: "b", word: "word2", translation: "translation2", pinyin: "pinyin2"), displayOption: displayOption)
            WordRow(word: Word(id: "c", word: "word3", translation: "translation3", pinyin: "pinyin3"), displayOption: displayOption)
            WordRow(word: Word(id: "d", word: "word4", translation: "translation4", pinyin: "pinyin4"), displayOption: displayOption)
        }
    }
}
