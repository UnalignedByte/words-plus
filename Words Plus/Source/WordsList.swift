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
    @State private var selectedWordIndex = 0
    @State private var shouldShowEdit = false

    var body: some View {
        List {
            SegmentedControl(selection: $displayOption) {
                ForEach(0...group.language.valuesCount) { i in
                    Text(self.group.language.titles[i]).tag(i)
                }
            }
            ForEach(0..<group.words.count) { i in
                WordRow(word: self.group.words[i], displayOption: self.displayOption)
                    /*.tapAction {
                        self.displayOption = 0
                }*/
                /*.longPressAction({
                    self.selectedWordIndex = i
                    self.shouldShowEdit = true
                })*/
                    /*.gesture(LongPressGesture(minimumDuration: 1.0, maximumDistance: 0.0).onChanged({ b in
                        print("XX Long press \(b)")
                    }).onEnded({ b in
                        print("XX Long Press Ended \(b)")
                    }))*/
                    /*.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                        .onChanged({ _ in
                            print("began drag")
                    }).onEnded({ _ in
                        print("ended drag")
                    }))*/
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
        }.navigationBarTitle(Text(group.name))
        .sheet(isPresented: $shouldShowEdit) {
            WordEdit(word: self.$group.words[self.selectedWordIndex], isPresented: self.$shouldShowEdit)
        }
    }
}
