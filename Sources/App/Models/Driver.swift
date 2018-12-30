import Foundation
import Vapor
import FluentPostgreSQL

final class Driver: PostgreSQLModel {
  var id: Int?
  var name: String
  var team: String?

  init(name: String, team: String? = nil) {
    self.name = name
    self.team = team
  }
}

extension Driver: Migration { }
extension Driver: Content { }
extension Driver: Parameter { }
