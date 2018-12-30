import Foundation
import Vapor
import FluentPostgreSQL


final class Driver: PostgreSQLModel {
  var id: Int?
  var name: String

  init(name: String) {
    self.name = name
  }
}

extension Driver: Migration { }
extension Driver: Content { }
extension Driver: Parameter { }
