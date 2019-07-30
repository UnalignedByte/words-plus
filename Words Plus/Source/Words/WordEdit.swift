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
            ForEach(0..<word.language.valuesCount) { i in
                Section(header: Text(self.word.language.titles[i+1])) {
                    TextField(self.word.language.titles[i+1], text: self.$word.values[i])
                }
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
