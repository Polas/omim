private class ThemeTestButtonWindow: UIWindow {
  var button: UIButton?

  var floatingButtonController: ThemeTestButtonController?

  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = nil
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  fileprivate override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    guard let button = button else { return false }
    let buttonPoint = convert(point, to: button)
    return button.point(inside: buttonPoint, with: event)
  }
}

@objc class ThemeTestButtonController: UIViewController {
  enum ThemeType {
    case night, day
  }
  private(set) var button: UIButton!
  private var theme: ThemeType = .day

  private let window = ThemeTestButtonWindow()

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  @objc init() {
    super.init(nibName: nil, bundle: nil)
    window.windowLevel = UIWindow.Level(rawValue: CGFloat.greatestFiniteMagnitude)
    window.isHidden = false
    window.rootViewController = self
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIWindow.keyboardWillShowNotification, object: nil)
  }

  @objc func keyboardDidShow(note: NSNotification) {
    window.windowLevel = UIWindow.Level(rawValue: 0)
    window.windowLevel = UIWindow.Level(rawValue: CGFloat.greatestFiniteMagnitude)
  }

  override func loadView() {
    let view = UIView()
    let button = UIButton(type: .custom)
    button.setTitle("Theme", for: .normal)
    button.setTitleColor(UIColor.green, for: .normal)
    button.backgroundColor = UIColor.white
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowRadius = 3
    button.layer.shadowOpacity = 0.8
    button.layer.shadowOffset = CGSize.zero
    button.sizeToFit()
    button.frame = CGRect(origin: CGPoint(x: 10, y: 100), size: button.bounds.size)
    button.autoresizingMask = []
    view.addSubview(button)
    button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
    self.view = view
    self.button = button
    window.button = button


    let panner = UIPanGestureRecognizer(target: self, action: #selector(panDidFire))
    button.addGestureRecognizer(panner)
  }

  @objc func onButtonTapped() {
    if theme == .day {
      theme = .night
//      let theme = MainTheme(colors: NightColors(), fonts: Fonts())
//      TManager.instance().setTheme(theme)

      MWMSettings.setTheme(.night)
    } else {
      theme = .day
//      let theme = MainTheme(colors: DayColors(), fonts: Fonts())
//      TManager.instance().setTheme(theme)
      MWMSettings.setTheme(.day)

    }
  }

  @objc func panDidFire(panner: UIPanGestureRecognizer) {
    let offset = panner.translation(in: view)
    panner.setTranslation(CGPoint.zero, in: view)
    var center = button.center
    center.x += offset.x
    center.y += offset.y
    button.center = center

    if panner.state == .ended || panner.state == .cancelled {
      UIView.animate(withDuration: 0.3) {
        self.snapButtonToSocket()
      }
    }
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    snapButtonToSocket()
  }

  private var sockets: [CGPoint] {
    let buttonSize = button.bounds.size
    let rect = view.bounds.insetBy(dx: 4 + buttonSize.width / 2, dy: 4 + buttonSize.height / 2)
    let sockets: [CGPoint] = [
      CGPoint(x: rect.minX, y: rect.minY+30),
      CGPoint(x: rect.minX, y: rect.maxY),
      CGPoint(x: rect.maxX, y: rect.minY+30),
      CGPoint(x: rect.maxX, y: rect.maxY),
      CGPoint(x: rect.midX, y: rect.midY)
    ]
    return sockets
  }

  private func snapButtonToSocket() {
    var bestSocket = CGPoint.zero
    var distanceToBestSocket = CGFloat.infinity
    let center = button.center
    for socket in sockets {
      let distance = hypot(center.x - socket.x, center.y - socket.y)
      if distance < distanceToBestSocket {
        distanceToBestSocket = distance
        bestSocket = socket
      }
    }
    button.center = bestSocket
  }
}
