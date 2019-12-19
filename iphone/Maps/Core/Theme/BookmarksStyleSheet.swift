import Foundation

class BookmarksStyleSheet: IStyleSheet {
  static func register(theme: Theme, colors: IColors, fonts: IFonts) {
    theme.add(className: "BookmarksCategoryTextView") { (s) -> (Void) in
      s.font = fonts.regular16
      s.fontColor = colors.blackPrimaryText
      s.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    theme.add(className: "BookmarksCategoryDeleteButton") { (s) -> (Void) in
      s.font = fonts.regular17
      s.fontColor = colors.red
      s.fontColorDisabled = colors.blackHintText
    }

    theme.add(className: "BookmarksActionCreateIcon") { (s) -> (Void) in
      s.tintColor = colors.linkBlue
    }

    theme.add(className: "BookmarkSharingLicense", from: "TermsOfUseText") { (s) -> (Void) in
      s.fontColor = colors.blackSecondaryText
      s.font = fonts.regular14
    }
  }
}
