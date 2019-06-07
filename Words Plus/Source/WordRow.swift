//
//  WordRow.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 07/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

enum DisplayOption: CaseIterable, Equatable {
    case everything
    case word
    case translation
    case pinyin

    var name: String {
        switch self {
        case .everything:
            return "Everything"
        case .word:
            return "Word"
        case .translation:
            return "Translation"
        case .pinyin:
            return "Pinyin"
        }
    }
}

struct WordRow: View {
    let word: Word
    var displayOption: DisplayOption

    var body: some View {
        return HStack {
            Spacer()
            if displayOption == DisplayOption.word || displayOption == DisplayOption.everything {
                Text(self.word.word).font(.title)
            }
            if displayOption == .everything {
                Spacer()
            }
            VStack {
                if displayOption == DisplayOption.pinyin || displayOption == DisplayOption.everything {
                    Text(self.word.pinyin)
                        .padding(.top, 8)
                        .font(.title)
                }
                if displayOption == DisplayOption.translation || displayOption == DisplayOption.everything {
                    Text(self.word.translation)
                        .padding(.bottom, 8)
                        .font(.title)
                }
            }
            Spacer()
        }.frame(height: 80)
    }
}
