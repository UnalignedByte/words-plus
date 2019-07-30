//
//  WordAdd.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 28/07/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct WordAdd: View {
    let language: Language
    @Binding var isPresented: Bool

    var body: some View {
        Form {
            ForEach(0..<language.valuesCount) { i in
                Section(header: Text(self.language.titles[i+1])) {
                    //TextField(self.language.titles[i], text: "")
                    Text(self.language.titles[i+1])
                }
            }
            Button("Add Word") {
                self.isPresented = false
            }
            Button("Cancel") {
                self.isPresented = false
            }
        }
    }
}
