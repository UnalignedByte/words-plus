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
            List(wordsStore.groups, id: \.self) { group in
                NavigationLink(destination: WordsList(group: group)) {
                    GroupRow(group: group)
                }
            }.navigationBarTitle(Text("Word Groups"))
        }
    }
}
