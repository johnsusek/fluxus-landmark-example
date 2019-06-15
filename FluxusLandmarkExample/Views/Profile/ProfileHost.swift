/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A view that hosts the profile viewer and editor.
 */

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) var editMode
  @EnvironmentObject var profileState: ProfileState

  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        if self.editMode?.value == .active {
          Button(action: {
            // Save the draft to the actual profile since user tapped Done
            self.profileState.profile = self.profileState.draftProfile
            self.editMode?.animation().value = .inactive
          }) {
            Text("Done")
          }
        }

        Spacer()

        EditButton()
      }

      if self.editMode?.value == .inactive {
        ProfileSummary()
      } else {
        ProfileEditor(profile: $profileState.draftProfile)
          .onDisappear {
            self.profileState.draftProfile = self.profileState.profile
        }
      }
    }
    .padding()
  }
}

#if DEBUG
struct ProfileHost_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHost()
  }
}
#endif
