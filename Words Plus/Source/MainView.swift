//
//  MainView.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 24/07/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var wordsStore: WordsStore

    var body: some View {
        NavigationView {
            GroupsList(groups: $wordsStore.groups)
        }.onAppear {
            self.wordsStore.load()
        }
    }
}
