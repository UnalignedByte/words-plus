//
//  WordRow.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 07/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct WordRow: View {
    let word: Word
    let displayOption: Int
    @State private var shouldShowAll = false

    var body: some View {
        let valuesView = self.valuesView(forWord: word)
        return valuesView.gesture(DragGesture(minimumDistance: 0.0)
            .onChanged { _ in
                self.shouldShowAll = true
            }.onEnded { _ in
                self.shouldShowAll = false
            })
    }

    private func valuesView(forWord word: Word) -> some View {
        switch word.language.valuesCount {
        case 3:
            let view = ThreeValuesView(displayOption: displayOption, shouldShowAll: shouldShowAll, value1: word.values[0], value2: word.values[1], value3: word.values[2])
            return AnyView(view)
        default:
            let view = TwoValuesView(displayOption: displayOption, shouldShowAll: shouldShowAll, value1: word.values[0], value2: word.values[1])
            return AnyView(view)
        }
    }
}

private struct TwoValuesView: View {
    let displayOption: Int
    let shouldShowAll: Bool
    let value1: String
    let value2: String

    var body: some View {
        let showAll = (displayOption == 0 || shouldShowAll)

        return HStack {
            Spacer()
            if displayOption == 1 || showAll {
                Text(value1)
                    .font(.title)
                    .minimumScaleFactor(0.5)
            }
            if showAll {
                Spacer()
            }
            if displayOption == 2 || showAll {
                Text(value2)
                    .font(.title)
                    .minimumScaleFactor(0.5)
            }
            Spacer()
        }.frame(height: 80)
    }
}

private struct ThreeValuesView: View {
    let displayOption: Int
    let shouldShowAll: Bool
    let value1: String
    let value2: String
    let value3: String

    var body: some View {
        let showAll = (displayOption == 0 || shouldShowAll)

        return HStack {
            Spacer()
            if displayOption == 1 || showAll {
                Text(value1)
                    .font(.title)
                    .minimumScaleFactor(0.5)
            }
            if displayOption == 0 {
                Spacer()
            }
            VStack {
                if displayOption == 2 || showAll {
                    Text(value2)
                        .padding(.top, 8)
                        .font(.title)
                        .minimumScaleFactor(0.5)
                }
                if displayOption == 3 || showAll {
                    Text(value3)
                        .padding(.bottom, 8)
                        .font(.title)
                        .minimumScaleFactor(0.5)
                }
            }
            Spacer()
        }.frame(height: 80)
    }
}
