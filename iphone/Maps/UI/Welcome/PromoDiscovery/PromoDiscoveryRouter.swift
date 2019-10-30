import Foundation

class PromoDiscoveryRouter{
  private weak var viewController: UIViewController?
  private weak var rootViewController: MWMViewController?
  private var type: PromoCoordinator.PromoType

  init(viewController: UIViewController,
       rootViewController: MWMViewController?,
       type: PromoCoordinator.PromoType){
    self.viewController = viewController
    self.rootViewController = rootViewController
    self.type = type
  }

  func dissmiss(){
    viewController?.dismiss(animated: true, completion: nil)
  }

  func presentNext(){
    switch type {
    case .crown:
      print("err")
    case .discoveryGuide:
      presentPromoDiscoveryGuide()
    case .discoverySubscribe:
      presentPromoDiscoverySubscribe()
    case .discoveryFree:
      presentPromoDiscoveryFree()
    }
  }

  private func presentPromoDiscoveryGuide() {
    rootViewController?.dismiss(animated: true, completion: nil)
    let webViewController = CatalogWebViewController.catalogFromAbsoluteUrl(nil, utm: .bookmarksPageCatalogButton)
    rootViewController?.navigationController?.pushViewController(webViewController, animated: true)
  }

  private func presentPromoDiscoverySubscribe() {
    let subscribeViewController = AllPassSubscriptionViewController()
    subscribeViewController.onSubscribe = { [weak self] in
      self?.rootViewController?.dismiss(animated: true)
      let successDialog = SubscriptionSuccessViewController { [weak self] in
        self?.rootViewController?.dismiss(animated: true)
      }
      self?.rootViewController?.present(successDialog, animated: true)
    }
    subscribeViewController.onCancel = { [weak self] in
      self?.rootViewController?.dismiss(animated: true)
    }

    viewController?.present(subscribeViewController, animated: true)
  }

  private func presentPromoDiscoveryFree() {
    rootViewController?.dismiss(animated: true, completion: nil)
    let webViewController = CatalogWebViewController.catalogFromAbsoluteUrl(nil, utm: .bookmarksPageCatalogButton)
    rootViewController?.navigationController?.pushViewController(webViewController, animated: true)
  }
}
