//
//  CircleImage.swift
//  FluxusLandmarkExample
//
//  Created by John Susek on 6/13/19.
//  Copyright © 2019 John Susek. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
  var image: Image
  
  var body: some View {
    image
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.white, lineWidth: 4))
      .shadow(radius: 10)
  }
}
