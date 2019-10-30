import UIKit

@objc class PromoButton: UIButton {

  private let coordinator: PromoCoordinator
  private var timer: Timer?
  private let buttonSize: CGSize = CGSize(width: 48, height: 48)

  @objc init(coordinator: PromoCoordinator) {
    self.coordinator = coordinator
    super.init(frame: CGRect(x: 0, y: 0, width: buttonSize.width, height: buttonSize.height))
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure(){
    removeTarget(self, action: nil, for: .touchUpInside)
    timer?.invalidate()
    timer = nil

    switch coordinator.type {
    case .discoveryGuide,
         .discoverySubscribe,
         .discoveryFree:
      configureDiscovery()
    case .crown:
      configureCrown()
    }
  }

  private func configureDiscovery(){
    if UIColor.isNightMode(){
      setImage(UIImage.init(named: "promo_discovery_button_night"), for: .normal)
    }else{
      setImage(UIImage.init(named: "promo_discovery_button_day"), for: .normal)
    }
    addTarget(self, action: #selector(onButtonPress), for: .touchUpInside)

    let view = UIView(frame: CGRect(x: buttonSize.width - 14, y: 0, width: 12, height: 12))
    view.layer.cornerRadius = view.size.width/2
    view.backgroundColor = UIColor.red
    addSubview(view)

    imageView?.clipsToBounds = false
    imageView?.contentMode = .center

    timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: {[weak self] (timer) in
            UIView.animate(withDuration: 0.5,
                     animations: {
                      self?.imageView?.transform = CGAffineTransform(rotationAngle: -30 * .pi / 180)
      }) { (conmplete) in
        UIView.animate(withDuration: 0.5) {
          self?.imageView?.transform = CGAffineTransform(rotationAngle: 0)
        }
      }
    })
  }

  private func configureCrown(){
    setImage(UIImage.init(named: "bookmarksSubscriptionPromo"), for: .normal)
    addTarget(self, action: #selector(onButtonPress), for: .touchUpInside)
  }

  @objc private func onButtonPress(sender: UIButton){
    coordinator.onPromoButtonPress(completion: {[weak self] in
      self?.isHidden = true;
      self?.timer?.invalidate()
      self?.timer = nil
    })
  }

  override func mwm_refreshUI(){
    super.mwm_refreshUI()
    configure()
  }
}
