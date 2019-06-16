/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that summarizes a profile.
 */

import SwiftUI
import Fluxus

struct ProfileSummary: View {
  @EnvironmentObject var store: RootStore

  var body: some View {
    List {
      Text(store.state.profile.profile.username)
        .bold()
        .font(.title)

      Text("Notifications: \(store.state.profile.profile.prefersNotifications ? "On": "Off" )")

      Text("Seasonal Photos: \(store.state.profile.profile.seasonalPhoto.rawValue)")

      Text("Goal Date: \(store.state.profile.profile.goalDate, formatter: Profile.goalFormatter)")

      VStack(alignment: .leading) {
        Text("Completed Badges").font(.headline)

        ScrollView {
          HStack {
            HikeBadge(name: "First Hike")

            HikeBadge(name: "Earth Day")
              .hueRotation(Angle(degrees: 90))

            HikeBadge(name: "Tenth Hike")
              .grayscale(0.5)
              .hueRotation(Angle(degrees: 45))
          }
        }.frame(height: 140)
      }

      VStack(alignment: .leading) {
        Text("Recent Hikes")
          .font(.headline)

        HikeView(hike: store.state.hike.hikes[0])
      }
    }
  }
}
