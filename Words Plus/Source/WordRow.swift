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

    var body: some View {
        switch word.language.valuesCount {
        case 3:
            return AnyView(ThreeValuesView(displayOption: displayOption,
                                           value1: word.values[0],
                                           value2: word.values[1],
                                           value3: word.values[2]))
        default:
            return AnyView(TwoValuesView(displayOption: displayOption,
                                         value1: word.values[0],
                                         value2: word.values[1]))
        }
    }
}

private struct TwoValuesView: View {
    let displayOption: Int
    let value1: String
    let value2: String

    var body: some View {
        HStack {
            Spacer()
            if displayOption == 1 || displayOption == 0 {
                Text(value1)
                    .font(.title)
            }
            if displayOption == 0 {
                Spacer()
            }
            if displayOption == 2 || displayOption == 0 {
                Text(value2)
                    .font(.title)
            }
            Spacer()
        }.frame(height: 80)
    }
}

private struct ThreeValuesView: View {
    let displayOption: Int
    let value1: String
    let value2: String
    let value3: String

    var body: some View {
        HStack {
            Spacer()
            if displayOption == 1 || displayOption == 0 {
                Text(value1)
                    .font(.title)
            }
            if displayOption == 0 {
                Spacer()
            }
            VStack {
                if displayOption == 2 || displayOption == 0 {
                    Text(value2)
                        .padding(.top, 8)
                        .font(.title)
                }
                if displayOption == 3 || displayOption == 0 {
                    Text(value3)
                        .padding(.bottom, 8)
                        .font(.title)
                }
            }
            Spacer()
        }.frame(height: 80)
    }
}
