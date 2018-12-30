import Foundation
import Vapor

final class DriverController {
  // MARK: API methods.

  func index(_ req: Request) throws -> Future<[Driver]> {
    return Driver.query(on: req).all()
  }

  func create(_ req: Request) throws -> Future<Driver> {
    return try req.content.decode(Driver.self).flatMap { driver in
      return driver.save(on: req)
    }
  }

  func update(_ req: Request) throws -> Future<Driver> {
    return try req.parameters.next(Driver.self).flatMap { driver in
      return try req.content.decode(Driver.self).flatMap { updatedContent in
        driver.name = updatedContent.name
        driver.team = updatedContent.team
        return driver.save(on: req)
      }
    }
  }

  func delete(_ req: Request) throws -> Future<HTTPStatus> {
    return try req.parameters.next(Driver.self).flatMap { driver in
      return driver.delete(on: req)
    }.transform(to: .noContent)
  }

  // MARK: Client methods.

  func show(_ req: Request) throws -> Future<View> {
    return Driver.query(on: req).all().flatMap { drivers in
      let data = ["drivers" : drivers]
      return try req.view().render("client/drivers/show", data)
    }
  }
}
