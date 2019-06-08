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
        VStack {
            Text("Word")
            TextField($word.word)
            Text("Pinyin")
            TextField($word.pinyin)
            Text("Translation")
            TextField($word.translation)
            Spacer()
        }.padding()
    }
}
