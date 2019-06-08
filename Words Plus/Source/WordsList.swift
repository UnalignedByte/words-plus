//
//  WordsList.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 07/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct WordsList: View {
    @ObjectBinding var wordsStore: WordsStore
    @State var displayOption: DisplayOption = .everything

    var body: some View {
        NavigationView {
            List {
                SegmentedControl(selection: $displayOption) {
                    ForEach(DisplayOption.allCases.identified(by: \.self)) { option in
                        Text(option.name).tag(option)
                    }
                }
                ForEach(wordsStore.words) { word in
                    WordRow(word: word, displayOption: self.displayOption)
                }.onDelete { indexSet in
                    if let index = indexSet.first {
                        self.wordsStore.words.remove(at: index)
                    }
                }.onMove { (indexSet, targetIndex) in
                    if let index = indexSet.first {
                        let element = self.wordsStore.words.remove(at: index)
                        self.wordsStore.words.insert(element, at: targetIndex)
                    }
                }
            }.navigationBarItems(trailing: EditButton())
        }
    }
}
