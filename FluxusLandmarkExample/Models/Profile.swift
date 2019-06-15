/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 An object that models a user profile.
 */
import Foundation

struct Profile {
  var username: String
  var prefersNotifications: Bool
  var seasonalPhoto: Season
  var goalDate: Date

  static var goalFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy"
    return formatter
  }

  init(username: String, prefersNotifications: Bool = true, seasonalPhoto: Season = .winter) {
    self.username = username
    self.prefersNotifications = prefersNotifications
    self.seasonalPhoto = seasonalPhoto
    self.goalDate = Date()
  }  
}
