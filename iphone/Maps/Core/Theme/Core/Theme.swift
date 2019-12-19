@objc class Theme: NSObject {
  enum ThemeType {
    case dark
    case light
  }
  typealias ClassName = String
  typealias Resolver = ((Style) -> (Void))

  @objc let colors: IColors
  @objc let fonts: IFonts
  private var themeType: ThemeType
  private var components: [ClassName: Style] = [:]
  private var resolvers: [ClassName: Resolver] = [:]

  init (type: ThemeType, colors: IColors, fonts: IFonts) {
    self.colors = colors
    self.fonts = fonts
    self.themeType = type
    super.init()
    self.register()
  }

  func registerStyleSheet<U: IStyleSheet> (_ type: U.Type) {
    U.register(theme: self, colors: colors, fonts: fonts)
  }


  @discardableResult func add(className: ClassName,
                              _ resolver:@escaping Resolver) -> Style {
    let style = Style()
    components[className] = style
    resolver(style)
    return style
  }

  @discardableResult func add(className: ClassName,
                              from: ClassName,
                              _ resolver:@escaping Resolver) -> Style {
    let style = Style()
    components[className] = style
    for fromStyle in get(from) {
      style.append(fromStyle)
    }
    resolver(style)
    return style
  }

  @discardableResult func add(className: ClassName,
                              forType: ThemeType,
                              _ resolver:@escaping Resolver) -> Style {
    guard themeType == forType else {
      return Style()
    }
    let style = Style()
    components[className] = style
    resolver(style)
    return style
  }

  @discardableResult func add(className: ClassName,
                              from: ClassName,
                              forType: ThemeType,
                              _ resolver:@escaping Resolver) -> Style {
    guard themeType == forType else {
      return Style()
    }
    let style = Style()
    components[className] = style
    for fromStyle in get(from) {
      style.append(fromStyle)
    }
    resolver(style)
    return style
  }

  func get(_ styleName: ClassName) -> [Style] {
    let styleNames = styleName.split(separator: ":")
    var result = [Style]()
    for name in styleNames {
      if !styleName.isEmpty, let style = components[String(name)] {
        result.append(style)
      } else {
        assertionFailure("Style Not found:\(name)")
      }
    }
    return result
  }

  func register() {

  }
}
