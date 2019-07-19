//
//  GroupsList.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 08/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct GroupsList: View {
    @EnvironmentObject var wordsStore: WordsStore

    var body: some View {
        NavigationView {
            List(0..<wordsStore.groups.count) { i in
                NavigationLink(destination: WordsList(group: self.$wordsStore.groups[i])) {
                    GroupRow(group: self.wordsStore.groups[i])
                }
            }.navigationBarTitle(Text("Word Groups"))
        }
    }
}
