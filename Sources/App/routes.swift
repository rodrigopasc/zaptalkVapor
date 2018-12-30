import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
  let driverController = DriverController()

  // "It works" page.
  router.get { req in
      return try req.view().render("welcome")
  }

  // MARK: Drivers Client.
  router.get("client/drivers", use: driverController.show)

  // MARK: Drivers API.
  router.get("api/drivers", use: driverController.index)
  router.post("api/drivers", use: driverController.create)
  router.patch("api/drivers", Driver.parameter, use: driverController.update)
  router.delete("api/drivers", Driver.parameter, use: driverController.delete)
}
