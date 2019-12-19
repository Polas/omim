class FontStyleSheet: IStyleSheet {
  static func register(theme: Theme, colors: IColors, fonts: IFonts) {
    theme.add(className: "regular9") { (s) -> (Void) in
      s.font = fonts.regular9
    }
    theme.add(className: "regular10") { (s) -> (Void) in
      s.font = fonts.regular10

    }
    theme.add(className: "regular11") { (s) -> (Void) in
      s.font = fonts.regular11
    }
    theme.add(className: "regular12") { (s) -> (Void) in
      s.font = fonts.regular12
    }
    theme.add(className: "regular13") { (s) -> (Void) in
      s.font = fonts.regular13
    }
    theme.add(className: "regular14") { (s) -> (Void) in
      s.font = fonts.regular14
    }
    theme.add(className: "regular15") { (s) -> (Void) in
      s.font = fonts.regular15
    }
    theme.add(className: "regular16") { (s) -> (Void) in
      s.font = fonts.regular16
    }
    theme.add(className: "regular17") { (s) -> (Void) in
      s.font = fonts.regular17
    }
    theme.add(className: "regular18") { (s) -> (Void) in
      s.font = fonts.regular18
    }
    theme.add(className: "regular20") { (s) -> (Void) in
      s.font = fonts.regular20
    }
    theme.add(className: "regular24") { (s) -> (Void) in
      s.font = fonts.regular24
    }
    theme.add(className: "regular32") { (s) -> (Void) in
      s.font = fonts.regular32
    }
    theme.add(className: "regular52") { (s) -> (Void) in
      s.font = fonts.regular52
    }
    theme.add(className: "medium9") { (s) -> (Void) in
      s.font = fonts.medium9
    }
    theme.add(className: "medium10") { (s) -> (Void) in
      s.font = fonts.medium10
    }
    theme.add(className: "medium12") { (s) -> (Void) in
      s.font = fonts.medium12
    }
    theme.add(className: "medium14") { (s) -> (Void) in
      s.font = fonts.medium14
    }
    theme.add(className: "medium16") { (s) -> (Void) in
      s.font = fonts.medium16
    }
    theme.add(className: "medium17") { (s) -> (Void) in
      s.font = fonts.medium17
    }
    theme.add(className: "medium18") { (s) -> (Void) in
      s.font = fonts.medium18
    }
    theme.add(className: "medium20") { (s) -> (Void) in
      s.font = fonts.medium20
    }
    theme.add(className: "medium24") { (s) -> (Void) in
      s.font = fonts.medium24
    }
    theme.add(className: "medium28") { (s) -> (Void) in
      s.font = fonts.medium28
    }
    theme.add(className: "medium36") { (s) -> (Void) in
      s.font = fonts.medium36
    }
    theme.add(className: "medium40") { (s) -> (Void) in
      s.font = fonts.medium40
    }
    theme.add(className: "medium44") { (s) -> (Void) in
      s.font = fonts.medium44
    }
    theme.add(className: "light10") { (s) -> (Void) in
      s.font = fonts.light10
    }
    theme.add(className: "light12") { (s) -> (Void) in
      s.font = fonts.light12
    }
    theme.add(className: "light16") { (s) -> (Void) in
      s.font = fonts.light16
    }
    theme.add(className: "light17") { (s) -> (Void) in
      s.font = fonts.light17
    }
    theme.add(className: "bold12") { (s) -> (Void) in
      s.font = fonts.bold12
    }
    theme.add(className: "bold14") { (s) -> (Void) in
      s.font = fonts.bold14
    }
    theme.add(className: "bold16") { (s) -> (Void) in
      s.font = fonts.bold16
    }
    theme.add(className: "bold17") { (s) -> (Void) in
      s.font = fonts.bold17
    }
    theme.add(className: "bold22") { (s) -> (Void) in
      s.font = fonts.bold22
    }
    theme.add(className: "bold24") { (s) -> (Void) in
      s.font = fonts.bold24
    }
    theme.add(className: "bold28") { (s) -> (Void) in
      s.font = fonts.bold28
    }
    theme.add(className: "bold34") { (s) -> (Void) in
      s.font = fonts.bold34
    }
    theme.add(className: "bold36") { (s) -> (Void) in
      s.font = fonts.bold36
    }
    theme.add(className: "bold48") { (s) -> (Void) in
      s.font = fonts.bold48
    }
    theme.add(className: "italic16") { (s) -> (Void) in
      s.font = fonts.italic16
    }
    theme.add(className: "semibold12") { (s) -> (Void) in
      s.font = fonts.semibold12
    }
    theme.add(className: "semibold14") { (s) -> (Void) in
      s.font = fonts.semibold14
    }
    theme.add(className: "semibold15") { (s) -> (Void) in
      s.font = fonts.semibold15
    }
    theme.add(className: "semibold16") { (s) -> (Void) in
      s.font = fonts.semibold16
    }
    theme.add(className: "fredokaRegular25") { (s) -> (Void) in
      s.font = fonts.fredokaRegular25
    }

    theme.add(className: "whitePrimaryText") { (s) -> (Void) in
      s.fontColor = colors.whitePrimaryText
    }
    theme.add(className: "blackSecondaryText") { (s) -> (Void) in
      s.fontColor = colors.blackSecondaryText
    }
    theme.add(className: "blackPrimaryText") { (s) -> (Void) in
      s.fontColor = colors.blackPrimaryText
    }
    theme.add(className: "linkBlueText") { (s) -> (Void) in
      s.fontColor = colors.linkBlue
    }
    theme.add(className: "linkBlueHighlightedText") { (s) -> (Void) in
      s.fontColor = colors.linkBlueHighlighted
    }
    theme.add(className: "whiteText") { (s) -> (Void) in
      s.fontColor = colors.white
    }
    theme.add(className: "blackHintText") { (s) -> (Void) in
      s.fontColor = colors.blackHintText
    }
    theme.add(className: "greenText") { (s) -> (Void) in
      s.fontColor = colors.ratingGreen
    }
    theme.add(className: "redText") { (s) -> (Void) in
      s.fontColor = colors.red
    }
    theme.add(className: "buttonRedText") { (s) -> (Void) in
      s.fontColor = colors.buttonRed
    }
  }
}
