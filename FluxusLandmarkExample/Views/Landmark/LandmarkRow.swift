//
//  LandmarkRow.swift
//  FluxusLandmarkExample
//
//  Created by John Susek on 6/13/19.
//  Copyright © 2019 John Susek. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark

  var body: some View {
    HStack {
      landmark.image(forSize: 50)

      Text(landmark.name)

      Spacer()

      if landmark.isFavorite {
        Text("⭐️")
      }
    }
  }
}
