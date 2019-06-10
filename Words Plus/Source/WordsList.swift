//
//  WordsList.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 07/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct WordsList: View {
    @EnvironmentObject var wordsStore: WordsStore
    let group: Group

    @State var displayOption: DisplayOption = .everything
    @State var showPopup: Bool = false
    @State var groupIndex = 0
    @State var wordIndex = 0

    var body: some View {
        return NavigationView {
            List {
                SegmentedControl(selection: $displayOption) {
                    ForEach(DisplayOption.allCases.identified(by: \.self)) { option in
                        Text(option.name).tag(option)
                    }
                }
                ForEach(group.words) { word in
                    WordRow(word: word, displayOption: self.displayOption)
                        .longPressAction({
                            self.groupIndex = self.wordsStore.groups.firstIndex { $0 == self.group }!
                            self.wordIndex = self.wordsStore.groups[self.groupIndex].words.firstIndex { $0 == word }!
                            self.showPopup = true
                        })
                }/*.onDelete { indexSet in
                    if let index = indexSet.first {
                        group.words.remove(at: index)
                    }
                }.onMove { (indexSet, targetIndex) in
                    if let index = indexSet.first {
                        let element = self.group.words.remove(at: index)
                        self.wordsStore.words.insert(element, at: targetIndex)
                    }
                }*/
            }.navigationBarTitle(Text(group.name))
            .presentation(self.showPopup ? Modal(WordEdit(word: $wordsStore.groups[groupIndex].words[wordIndex])) { self.showPopup = false } : nil)
        }
    }
}
