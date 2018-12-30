import Foundation
import Vapor

final class DriverController {
  func index(_ req: Request) throws -> Future<[Driver]> {
    return Driver.query(on: req).all()
  }

  // MARK: API

  func create(_ req: Request) throws -> Future<Driver> {
    return try req.content.decode(Driver.self).flatMap { driver in
      return driver.save(on: req)
    }
  }

  func update(_ req: Request) throws -> Future<Driver> {
    return try req.parameters.next(Driver.self).flatMap { driver in
      return try req.content.decode(Driver.self).flatMap { updatedContent in
        driver.name = updatedContent.name
        return driver.save(on: req)
      }
    }
  }

  func delete(_ req: Request) throws -> Future<HTTPStatus> {
    return try req.parameters.next(Driver.self).flatMap { driver in
      return driver.delete(on: req)
    }.transform(to: .noContent)
  }
}
