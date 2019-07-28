//
//  GroupsList.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 08/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct GroupsList: View {
    @Binding var groups: [Group]
    @State private var selectedIndex = 0
    @State private var shouldShowEdit = false

    var body: some View {
        List(0..<groups.count) { i -> NavigationLink<GroupRow> in
            NavigationLink(destination: WordsList(group: self.$groups[i])) {
                let groupRow = GroupRow(group: self.groups[i])
                _ = groupRow.contextAction.sink { _ in
                    self.selectedIndex = i
                    self.shouldShowEdit = true
                }
                return groupRow
            }
        }.navigationBarTitle(Text("Word Groups"))
        .sheet(isPresented: $shouldShowEdit) {
            GroupEdit(group: self.$groups[self.selectedIndex], isPresented: self.$shouldShowEdit)
        }
    }
}
