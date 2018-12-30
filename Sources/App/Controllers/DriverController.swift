import Foundation
import Vapor

final class DriverController {
  func index(_ req: Request) throws -> Future<[Driver]> {
    return Driver.query(on: req).all()
  }

  func create(_ req: Request) throws -> Future<Driver> {
    return try req.content.decode(Driver.self).flatMap { driver in
      return driver.save(on: req)
    }
  }
}
