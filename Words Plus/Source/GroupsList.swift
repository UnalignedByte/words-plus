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

    var body: some View {
        List(0..<groups.count) { i in
            NavigationLink(destination: WordsList(group: self.$groups[i])) {
                GroupRow(group: self.groups[i])
            }
        }.navigationBarTitle(Text("Word Groups"))
    }
}
