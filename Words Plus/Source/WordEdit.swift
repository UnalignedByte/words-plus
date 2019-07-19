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
        }
    }
}
