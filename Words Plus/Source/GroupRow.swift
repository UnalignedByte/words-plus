//
//  GroupRow.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 08/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI
import Combine

struct GroupRow: View {
    let group: Group
    var contextAction: AnyPublisher<Void, Never> {
        return longPressSubject.eraseToAnyPublisher()
    }
    private let longPressSubject = PassthroughSubject<Void, Never>()

    var body: some View {
        GroupView(group: group)
        .gesture(LongPressGesture(minimumDuration: 1.0)
            .onEnded { _ in
                self.longPressSubject.send()
            }
        )
    }
}

private struct GroupView: View {
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
