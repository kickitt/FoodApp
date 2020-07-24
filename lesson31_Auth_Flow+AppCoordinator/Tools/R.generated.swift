//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 7 storyboards.
  struct storyboard {
    /// Storyboard `Auth`.
    static let auth = _R.storyboard.auth()
    /// Storyboard `Kupons`.
    static let kupons = _R.storyboard.kupons()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Lessons`.
    static let lessons = _R.storyboard.lessons()
    /// Storyboard `MyLessons`.
    static let myLessons = _R.storyboard.myLessons()
    /// Storyboard `Settings`.
    static let settings = _R.storyboard.settings()
    /// Storyboard `Tutorial`.
    static let tutorial = _R.storyboard.tutorial()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Auth", bundle: ...)`
    static func auth(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.auth)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Kupons", bundle: ...)`
    static func kupons(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.kupons)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Lessons", bundle: ...)`
    static func lessons(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.lessons)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "MyLessons", bundle: ...)`
    static func myLessons(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.myLessons)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Settings", bundle: ...)`
    static func settings(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.settings)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Tutorial", bundle: ...)`
    static func tutorial(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.tutorial)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.image` struct is generated, and contains static references to 8 images.
  struct image {
    /// Image `allLessonsIcon`.
    static let allLessonsIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "allLessonsIcon")
    /// Image `kuponIcon`.
    static let kuponIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "kuponIcon")
    /// Image `logoutIcon`.
    static let logoutIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "logoutIcon")
    /// Image `myLessons`.
    static let myLessons = Rswift.ImageResource(bundle: R.hostingBundle, name: "myLessons")
    /// Image `restoreIcon`.
    static let restoreIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "restoreIcon")
    /// Image `settingsIcon`.
    static let settingsIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "settingsIcon")
    /// Image `splash`.
    static let splash = Rswift.ImageResource(bundle: R.hostingBundle, name: "splash")
    /// Image `ups`.
    static let ups = Rswift.ImageResource(bundle: R.hostingBundle, name: "ups")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "allLessonsIcon", bundle: ..., traitCollection: ...)`
    static func allLessonsIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.allLessonsIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "kuponIcon", bundle: ..., traitCollection: ...)`
    static func kuponIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.kuponIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "logoutIcon", bundle: ..., traitCollection: ...)`
    static func logoutIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logoutIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "myLessons", bundle: ..., traitCollection: ...)`
    static func myLessons(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.myLessons, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "restoreIcon", bundle: ..., traitCollection: ...)`
    static func restoreIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.restoreIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "settingsIcon", bundle: ..., traitCollection: ...)`
    static func settingsIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.settingsIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "splash", bundle: ..., traitCollection: ...)`
    static func splash(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.splash, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ups", bundle: ..., traitCollection: ...)`
    static func ups(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ups, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `lessonCell`.
    static let lessonCell: Rswift.ReuseIdentifier<LessonCell> = Rswift.ReuseIdentifier(identifier: "lessonCell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try auth.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try kupons.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try lessons.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try myLessons.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try settings.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try tutorial.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct auth: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = NavigationController

      let bundle = R.hostingBundle
      let loginController = StoryboardViewControllerResource<LoginController>(identifier: "LoginController")
      let name = "Auth"
      let registrationController = StoryboardViewControllerResource<RegistrationController>(identifier: "RegistrationController")
      let restorePasswordController = StoryboardViewControllerResource<RestorePasswordController>(identifier: "RestorePasswordController")

      func loginController(_: Void = ()) -> LoginController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginController)
      }

      func registrationController(_: Void = ()) -> RegistrationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: registrationController)
      }

      func restorePasswordController(_: Void = ()) -> RestorePasswordController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: restorePasswordController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.auth().loginController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginController' could not be loaded from storyboard 'Auth' as 'LoginController'.") }
        if _R.storyboard.auth().registrationController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'registrationController' could not be loaded from storyboard 'Auth' as 'RegistrationController'.") }
        if _R.storyboard.auth().restorePasswordController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'restorePasswordController' could not be loaded from storyboard 'Auth' as 'RestorePasswordController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct kupons: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = NavigationController

      let bundle = R.hostingBundle
      let kuponsController = StoryboardViewControllerResource<KuponsController>(identifier: "KuponsController")
      let name = "Kupons"

      func kuponsController(_: Void = ()) -> KuponsController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: kuponsController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.kupons().kuponsController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'kuponsController' could not be loaded from storyboard 'Kupons' as 'KuponsController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if UIKit.UIImage(named: "splash", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'splash' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct lessons: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = NavigationController

      let bundle = R.hostingBundle
      let lessonDetailedController = StoryboardViewControllerResource<LessonDetailedController>(identifier: "lessonDetailedController")
      let lessonsController = StoryboardViewControllerResource<LessonsController>(identifier: "LessonsController")
      let name = "Lessons"

      func lessonDetailedController(_: Void = ()) -> LessonDetailedController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: lessonDetailedController)
      }

      func lessonsController(_: Void = ()) -> LessonsController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: lessonsController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.lessons().lessonsController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'lessonsController' could not be loaded from storyboard 'Lessons' as 'LessonsController'.") }
        if _R.storyboard.lessons().lessonDetailedController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'lessonDetailedController' could not be loaded from storyboard 'Lessons' as 'LessonDetailedController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct myLessons: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = NavigationController

      let bundle = R.hostingBundle
      let myLessonsController = StoryboardViewControllerResource<MyLessonsController>(identifier: "MyLessonsController")
      let name = "MyLessons"

      func myLessonsController(_: Void = ()) -> MyLessonsController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: myLessonsController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.myLessons().myLessonsController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'myLessonsController' could not be loaded from storyboard 'MyLessons' as 'MyLessonsController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct settings: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = NavigationController

      let bundle = R.hostingBundle
      let name = "Settings"
      let settingsController = StoryboardViewControllerResource<SettingsController>(identifier: "SettingsController")

      func settingsController(_: Void = ()) -> SettingsController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: settingsController)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "logoutIcon", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'logoutIcon' is used in storyboard 'Settings', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.settings().settingsController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'settingsController' could not be loaded from storyboard 'Settings' as 'SettingsController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct tutorial: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = NavigationController

      let bundle = R.hostingBundle
      let name = "Tutorial"
      let tutorialController = StoryboardViewControllerResource<TutorialController>(identifier: "TutorialController")

      func tutorialController(_: Void = ()) -> TutorialController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: tutorialController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.tutorial().tutorialController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'tutorialController' could not be loaded from storyboard 'Tutorial' as 'TutorialController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
