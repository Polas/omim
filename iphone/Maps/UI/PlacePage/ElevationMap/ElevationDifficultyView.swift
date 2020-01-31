class ElevationDifficultyView: UIView {
  let stackView = UIStackView()
  private(set) var views:[UIView] = []
  var difficulty: ElevationDifficulty = .easy {
    didSet {
      updateView()
    }
  }
  var difficultyColors: [ElevationDifficulty:UIColor] = [.easy:UIColor.green,
                                                         .moderate: UIColor.orange,
                                                         .hard: UIColor.red]
    {
    didSet {
      updateView()
    }
  }
  var emptyColor: UIColor = UIColor.gray {
    didSet {
      updateView()
    }
  }
  
  private let bulletSize = CGSize(width: 10, height: 10)
  private let bulletSpacing: CGFloat = 5
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.addSubview(stackView)
    stackView.frame = bounds
    stackView.distribution = .fillEqually
    stackView.axis = .horizontal
    stackView.spacing = bulletSpacing
    stackView.alignment = .fill
    
    for _ in 0..<ElevationDifficulty.count.rawValue {
      let view = UIView()
      stackView.addArrangedSubview(view)
      views.append(view)
    }
  }
  
  private func updateView() {
    guard let fillColor = difficultyColors[difficulty] else {
      LOG(.error, "No fill color");
      return
    }
    for (idx, view) in views.enumerated() {
      if idx <= difficulty.rawValue {
        view.backgroundColor = fillColor
      } else {
        view.backgroundColor = emptyColor
      }
    }
  }
}
