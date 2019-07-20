//
//  WordEdit.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 08/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct WordEdit: View {
    @Binding var word: Word
    @Binding var isPresented: Bool
    private var wordCopy: Word

    init(word: Binding<Word>, isPresented: Binding<Bool>) {
        self._word = word
        self._isPresented = isPresented
        self.wordCopy = word.value
    }

    var body: some View {
        Form {
            Section(header: Text("Word")) {
                TextField("Word", text: $word.word)
            }
            Section(header: Text("Pinyin")) {
                TextField("Pinyin", text: $word.pinyin)
            }
            Section(header: Text("Translation")) {
                TextField("Translation", text: $word.translation)
            }
            Button("Save") {
                self.isPresented = false
            }
            Button("Cancel") {
                self.word = self.wordCopy
                self.isPresented = false
            }
        }
    }
}
