//
//  GroupRow.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 08/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct GroupRow: View {
    let group: Group

    var body: some View {
        HStack {
            Text(group.name)
            Spacer()
            VStack {
                Spacer()
                Text("\(group.words.count) words")
            }
        }.frame(height: 60)
    }
}
