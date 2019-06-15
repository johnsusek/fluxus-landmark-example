//
//  LandmarkList.swift
//  FluxusLandmarkExample
//
//  Created by John Susek on 6/13/19.
//  Copyright © 2019 John Susek. All rights reserved.
//

import SwiftUI
import Fluxus

struct LandmarkList : View {
  @EnvironmentObject var landmarkState: LandmarkState
  @EnvironmentObject var preferencesState: PreferencesState

  var body: some View {
    List {
      Toggle(isOn: $preferencesState.showFavoritesOnly) {
        Text("Favorites only")
      }

      ForEach(landmarkState.landmarks) { landmark in
        if !self.preferencesState.showFavoritesOnly || landmark.isFavorite {
          NavigationButton(destination: LandmarkDetail(landmarkId: landmark.id)) {
            LandmarkRow(landmark: landmark)
          }
        }
      }
    }.navigationBarTitle(Text("Landmarks"))
  }
}
