import Foundation

class PromoDiscoveryBuilder {
  static func build(rootViewController:MWMViewController?,
                    type: PromoCoordinator.PromoType) -> UIViewController{
    let sb = UIStoryboard.instance(.welcome)
    let vc = sb.instantiateViewController(ofType: WelcomeViewController.self);

    let router = PromoDiscoveryRouter(viewController: vc,
                                      rootViewController: rootViewController,
                                      type: type)
    let presenter = PromoDiscoveryPresenter(viewController: vc,
                                            router: router,
                                            type: type)
    vc.presenter = presenter

    return vc
  }
}
