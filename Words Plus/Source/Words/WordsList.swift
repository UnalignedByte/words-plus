//
//  WordsList.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 07/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct WordsList: View {
    @Binding var group: Group
    @State private var displayOption = 0
    @State private var selectedIndex = 0
    @State private var shouldShowEdit = false

    var body: some View {
        ZStack {
            List {
                SegmentedControl(selection: $displayOption) {
                    ForEach(0..<(group.language.valuesCount+1)) { i in
                        Text(self.group.language.titles[i]).tag(i)
                    }
                }
                ForEach(0..<group.words.count) { i -> WordRow in
                    let wordRow =  WordRow(word: self.group.words[i], displayOption: self.displayOption)
                    _ = wordRow.longPressSubject.sink { _ in
                        self.selectedIndex = i
                        self.shouldShowEdit = true
                    }
                    return wordRow
                }
                /*.onDelete { indexSet in
                    if let index = indexSet.first {
                        group.words.remove(at: index)
                    }
                }.onMove { (indexSet, targetIndex) in
                    if let index = indexSet.first {
                        let element = self.group.words.remove(at: index)
                        self.wordsStore.words.insert(element, at: targetIndex)
                    }
                }*/
            }
            VStack {
                Spacer()
                Button(action: {
                    print("XX Add pressed")
                }) {
                    Text("+")
                        .font(Font.custom("Futura Medium", size: 45.0))
                        .bold()
                        .foregroundColor(Color.white)
                    .minimumScaleFactor(0.5)
                }.frame(width: 40.0, height: 40.0)
                .background(Color.accentColor)
                .cornerRadius(20.0)
                .shadow(radius: 5.0)
            }
        }.navigationBarTitle(Text(group.name))
        .sheet(isPresented: $shouldShowEdit) {
            WordEdit(word: self.$group.words[self.selectedIndex], isPresented: self.$shouldShowEdit)
        }
    }
}
