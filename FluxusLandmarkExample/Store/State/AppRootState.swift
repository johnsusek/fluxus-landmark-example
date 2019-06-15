import Fluxus

class AppRootState: RootState {
  let landmarkState = LandmarkState()
  let hikeState = HikeState()
  let preferencesState = PreferencesState()
  let profileState = ProfileState()
}
