//
//  GroupEdit.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 24/07/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct GroupEdit: View {
    @Binding var group: Group
    @Binding var isPresented: Bool
    private var groupCopy: Group

    init(group: Binding<Group>, isPresented: Binding<Bool>) {
        self._group = group
        self._isPresented = isPresented
        self.groupCopy = group.value
    }

    var body: some View {
        Form {
            Section(header: Text("Group Name")) {
                TextField("Group Name", text: $group.name)
            }
            Button("Save") {
                self.isPresented = false
            }
            Button("Cancel") {
                self.group = self.groupCopy
                self.isPresented = false
            }
        }
    }
}
