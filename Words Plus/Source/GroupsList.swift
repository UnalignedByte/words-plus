//
//  GroupsList.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 08/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct GroupsList: View {
    @ObjectBinding var wordsStore: WordsStore

    var body: some View {
        NavigationView {
            List {
                ForEach(wordsStore.groups.identified(by: \.self)) { group  in
                    NavigationButton(destination: WordsList(group: group)) {
                        GroupRow(group: group)
                    }
                }
            }.navigationBarTitle(Text("Word Groups"))
        }
    }
}
