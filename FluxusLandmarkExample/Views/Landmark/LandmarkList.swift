//
//  LandmarkList.swift
//  FluxusLandmarkExample
//
//  Created by John Susek on 6/13/19.
//  Copyright © 2019 John Susek. All rights reserved.
//

import SwiftUI
import Fluxus
import Combine

struct LandmarkList : View {
  @EnvironmentObject var store: RootStore

  var body: some View {
    List {
      Toggle(isOn: $store.state.preferences.showFavoritesOnly) {
        Text("Favorites only")
      }

      ForEach(store.state.landmark.landmarks) { landmark in
        if !self.store.state.preferences.showFavoritesOnly || landmark.isFavorite {
          NavigationButton(destination: LandmarkDetail(landmarkId: landmark.id)) {
            LandmarkRow(landmark: landmark)
          }
        }
      }
    }.navigationBarTitle(Text("Landmarks"))
  }
}
