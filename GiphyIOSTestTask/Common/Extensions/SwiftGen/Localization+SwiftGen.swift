// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum L10n {
  /// Error
  internal static let alertDefaultErrorTile = L10n.tr("Localizable", "alert_default_error_tile")
  /// Information
  internal static let alertDefaultInfoTile = L10n.tr("Localizable", "alert_default_info_tile")
  /// Success
  internal static let alertDefaultSuccessTile = L10n.tr("Localizable", "alert_default_success_tile")
  /// Browse
  internal static let browseTitle = L10n.tr("Localizable", "browse_title")
  /// Cannot login, please try again later
  internal static let errorCannotLogin = L10n.tr("Localizable", "error_cannot_login")
  /// Something went wrong, please try again later
  internal static let errorUndefined = L10n.tr("Localizable", "error_undefined")
  /// OK
  internal static let commonButtonsOkButtonTitle = L10n.tr("Localizable", "common_buttons.ok_button.title")
  /// Save
  internal static let commonButtonsSaveButtonTitle = L10n.tr("Localizable", "common_buttons.save_button.title")
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
