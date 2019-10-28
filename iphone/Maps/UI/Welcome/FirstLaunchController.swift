final class FirstLaunchController: WelcomeViewController {

  private enum Permission {
    case location
    case notifications
    case nothing
  }
  
  private struct FirstLaunchConfig: WelcomeConfig {
    let image: UIImage
    let title: String
    let text: String
    let buttonTitle: String
    let requestPermission: Permission
  }
  
  static var welcomeConfigs: [WelcomeConfig] {
    return [
      FirstLaunchConfig(image: #imageLiteral(resourceName: "img_onboarding_dreamnplan"),
                        title: "new_onboarding_step2_header",
                        text: "new_onboarding_step2_message",
                        buttonTitle: "new_onboarding_button",
                        requestPermission: .nothing),
      FirstLaunchConfig(image: #imageLiteral(resourceName: "img_onboarding_offlinemaps"),
                        title: "new_onboarding_step3_header",
                        text: "new_onboarding_step3_message",
                        buttonTitle: "new_onboarding_button",
                        requestPermission: .location),
      FirstLaunchConfig(image: #imageLiteral(resourceName: "img_onboarding_sharebookmarks"),
                        title: "new_onboarding_step4_header",
                        text: "new_onboarding_step4_message",
                        buttonTitle: "new_onboarding_button_2",
                        requestPermission: .notifications),
    ]
  }

  override class var key: String { return toString(self) }
  
  static func controllers() -> [FirstLaunchController] {
    var result = [FirstLaunchController]()
    let sb = UIStoryboard.instance(.welcome)
    FirstLaunchController.welcomeConfigs.forEach { (config) in
      let vc = sb.instantiateViewController(withIdentifier: toString(self)) as! FirstLaunchController
      vc.pageConfig = config
      result.append(vc)
    }
    return result
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let config = pageConfig as! FirstLaunchConfig
    switch config.requestPermission {
    case .location:
      MWMLocationManager.start()
    case .notifications:
      MWMPushNotifications.setup()
    case .nothing:
      break
    }
  }
}
