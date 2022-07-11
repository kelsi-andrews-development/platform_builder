// TODO: Implement PlatformTheme
// import './platform_builder.dart';
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PlatformTheme {
  final ThemeData? materialThemeData;
  final CupertinoThemeData? cupertinoThemeData;


  /// Specifies which overscroll indicator to use on [TargetPlatform.android].
  ///
  /// When null, the default value of
  /// [MaterialScrollBehavior.androidOverscrollIndicator] is
  /// [AndroidOverscrollIndicator.glow].
  ///
  /// See also:
  ///
  ///   * [StretchingOverscrollIndicator], a material design edge effect
  ///     that transforms the contents of a scrollable when overscrolled.
  ///   * [GlowingOverscrollIndicator], an edge effect that paints a glow
  ///     over the contents of a scrollable when overscrolled.
  final AndroidOverscrollIndicator? androidOverscrollIndicator;

  /// Apply a semi-transparent overlay color on Material surfaces to indicate
  /// elevation for dark themes.
  ///
  /// Material drop shadows can be difficult to see in a dark theme, so the
  /// elevation of a surface should be portrayed with an "overlay" in addition
  /// to the shadow. As the elevation of the component increases, the
  /// overlay increases in opacity. [applyElevationOverlayColor] turns the
  /// application of this overlay on or off for dark themes.
  ///
  /// If true and [brightness] is [Brightness.dark], a
  /// semi-transparent version of [ColorScheme.onSurface] will be
  /// applied on top of [Material] widgets that have a [ColorScheme.surface]
  /// color. The level of transparency is based on [Material.elevation] as
  /// per the Material Dark theme specification.
  ///
  /// If false the surface color will be used unmodified.
  ///
  /// Defaults to false in order to maintain backwards compatibility with
  /// apps that were built before the Material Dark theme specification
  /// was published. New apps should set this to true for any themes
  /// where [brightness] is [Brightness.dark].
  ///
  /// See also:
  ///
  ///  * [Material.elevation], which effects the level of transparency of the
  ///    overlay color.
  ///  * [ElevationOverlay.applyOverlay], which is used by [Material] to apply
  ///    the overlay color to its surface color.
  ///  * <https://material.io/design/color/dark-theme.html>, which specifies how
  ///    the overlay should be applied.
  final bool? applyElevationOverlayColor;

  /// Components of the [CupertinoThemeData] to override from the Material
  /// [ThemeData] adaptation.
  ///
  /// By default, [cupertinoOverrideTheme] is null and Cupertino widgets
  /// descendant to the Material [Theme] will adhere to a [CupertinoTheme]
  /// derived from the Material [ThemeData]. e.g. [ThemeData]'s [ColorScheme]
  /// will also inform the [CupertinoThemeData]'s `primaryColor` etc.
  ///
  /// This cascading effect for individual attributes of the [CupertinoThemeData]
  /// can be overridden using attributes of this [cupertinoOverrideTheme].
  final NoDefaultCupertinoThemeData? cupertinoOverrideTheme;

  /// The default [InputDecoration] values for [InputDecorator], [TextField],
  /// and [TextFormField] are based on this theme.
  ///
  /// See [InputDecoration.applyDefaults].
  final InputDecorationTheme? inputDecorationTheme;

  /// Configures the hit test size of certain Material widgets.
  ///
  /// Defaults to a [platform]-appropriate size: [MaterialTapTargetSize.padded]
  /// on mobile platforms, [MaterialTapTargetSize.shrinkWrap] on desktop
  /// platforms.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// Default [MaterialPageRoute] transitions per [TargetPlatform].
  ///
  /// [MaterialPageRoute.buildTransitions] delegates to a [platform] specific
  /// [PageTransitionsBuilder]. If a matching builder is not found, a builder
  /// whose platform is null is used.
  final PageTransitionsTheme? pageTransitionsTheme;

  /// The platform the material widgets should adapt to target.
  ///
  /// Defaults to the current platform, as exposed by [defaultTargetPlatform].
  /// This should be used in order to style UI elements according to platform
  /// conventions.
  ///
  /// Widgets from the material library should use this getter (via [Theme.of])
  /// to determine the current platform for the purpose of emulating the
  /// platform behavior (e.g. scrolling or haptic effects). Widgets and render
  /// objects at lower layers that try to emulate the underlying platform
  /// platform can depend on [defaultTargetPlatform] directly, or may require
  /// that the target platform be provided as an argument. The
  /// [dart:io.Platform] object should only be used directly when it's critical
  /// to actually know the current platform, without any overrides possible (for
  /// example, when a system API is about to be called).
  ///
  /// In a test environment, the platform returned is [TargetPlatform.android]
  /// regardless of the host platform. (Android was chosen because the tests
  /// were originally written assuming Android-like behavior, and we added
  /// platform adaptations for other platforms later). Tests can check behavior
  /// for other platforms by setting the [platform] of the [Theme] explicitly to
  /// another [TargetPlatform] value, or by setting
  /// [debugDefaultTargetPlatformOverride].
  ///
  /// Determines the defaults for [typography] and [materialTapTargetSize].
  final TargetPlatform? platform;

  /// A theme for customizing the colors, thickness, and shape of [Scrollbar]s.
  final ScrollbarThemeData? scrollbarTheme;

  /// Defines the appearance of ink splashes produces by [InkWell]
  /// and [InkResponse].
  ///
  /// See also:
  ///
  ///  * [InkSplash.splashFactory], which defines the default splash.
  ///  * [InkRipple.splashFactory], which defines a splash that spreads out
  ///    more aggressively than the default.
  final InteractiveInkFeatureFactory? splashFactory;

  /// The density value for specifying the compactness of various UI components.
  ///
  /// {@template flutter.material.themedata.visualDensity}
  /// Density, in the context of a UI, is the vertical and horizontal
  /// "compactness" of the elements in the UI. It is unitless, since it means
  /// different things to different UI elements. For buttons, it affects the
  /// spacing around the centered label of the button. For lists, it affects the
  /// distance between baselines of entries in the list.
  ///
  /// Typically, density values are integral, but any value in range may be
  /// used. The range includes values from [VisualDensity.minimumDensity] (which
  /// is -4), to [VisualDensity.maximumDensity] (which is 4), inclusive, where
  /// negative values indicate a denser, more compact, UI, and positive values
  /// indicate a less dense, more expanded, UI. If a component doesn't support
  /// the value given, it will clamp to the nearest supported value.
  ///
  /// The default for visual densities is zero for both vertical and horizontal
  /// densities, which corresponds to the default visual density of components
  /// in the Material Design specification.
  ///
  /// As a rule of thumb, a change of 1 or -1 in density corresponds to 4
  /// logical pixels. However, this is not a strict relationship since
  /// components interpret the density values appropriately for their needs.
  ///
  /// A larger value translates to a spacing increase (less dense), and a
  /// smaller value translates to a spacing decrease (more dense).
  /// {@endtemplate}
  final VisualDensity? visualDensity;

  /// A temporary flag used to opt-in to new Material 3 features.
  ///
  /// If true, then components that have been migrated to Material 3 will
  /// start using new colors, typography and other features of Material 3.
  /// If false, they will use the Material 2 look and feel.
  ///
  /// Currently no components have been migrated to support Material 3.
  /// As they are updated to include Material 3 support this documentation
  /// will be modified to indicate exactly what widgets this flag will affect.
  ///
  /// During the migration to Material 3, turning this on may yield
  /// inconsistent look and feel in your app. Some components will be migrated
  /// before others and typography changes will be coming in stages.
  ///
  /// [useMaterial3] defaults to false. After all the migrated components
  /// have landed on stable, we will change this to be true by default. After
  /// that change has landed on stable, we will deprecate this flag and remove
  /// all uses of it. Everything will use the Material 3 look and feel at
  /// that point.
  ///
  /// See also:
  ///
  ///   * [Material Design 3](https://m3.material.io/).
  final bool? useMaterial3;

  // COLOR

  /// A set of twelve colors that can be used to configure the
  /// color properties of most components.
  ///
  /// This property was added much later than the theme's set of highly
  /// specific colors, like [cardColor], [buttonColor], [canvasColor] etc.
  /// New components can be defined exclusively in terms of [colorScheme].
  /// Existing components will gradually migrate to it, to the extent
  /// that is possible without significant backwards compatibility breaks.
  final ColorScheme? colorScheme;

  /// The background color for major parts of the app (toolbars, tab bars, etc)
  ///
  /// The theme's [colorScheme] property contains [ColorScheme.primary], as
  /// well as a color that contrasts well with the primary color called
  /// [ColorScheme.onPrimary]. It might be simpler to just configure an app's
  /// visuals in terms of the theme's [colorScheme].
  final Color? primaryColor;

  /// A lighter version of the [primaryColor].
  final Color? primaryColorLight;

  /// A darker version of the [primaryColor].
  final Color? primaryColorDark;

  /// The focus color used indicate that a component has the input focus.
  final Color? focusColor;

  /// The hover color used to indicate when a pointer is hovering over a
  /// component.
  final Color? hoverColor;

  /// The color that the [Material] widget uses to draw elevation shadows.
  ///
  /// Defaults to fully opaque black.
  ///
  /// Shadows can be difficult to see in a dark theme, so the elevation of a
  /// surface should be rendered with an "overlay" in addition to the shadow.
  /// As the elevation of the component increases, the overlay increases in
  /// opacity. The [applyElevationOverlayColor] property turns the elevation
  /// overlay on or off for dark themes.
  final Color? shadowColor;

  /// The default color of [MaterialType.canvas] [Material].
  final Color? canvasColor;

  /// The default color of the [Material] that underlies the [Scaffold]. The
  /// background color for a typical material app or a page within the app.
  final Color? scaffoldBackgroundColor;

  /// The default color of the [BottomAppBar].
  ///
  /// This can be overridden by specifying [BottomAppBar.color].
  final Color? bottomAppBarColor;

  /// The color of [Material] when it is used as a [Card].
  final Color? cardColor;

  /// The color of [Divider]s and [PopupMenuDivider]s, also used
  /// between [ListTile]s, between rows in [DataTable]s, and so forth.
  ///
  /// To create an appropriate [BorderSide] that uses this color, consider
  /// [Divider.createBorderSide].
  final Color? dividerColor;

  /// The highlight color used during ink splash animations or to
  /// indicate an item in a menu is selected.
  final Color? highlightColor;

  /// The color of ink splashes.
  ///
  /// See also:
  ///  * [splashFactory], which defines the appearance of the splash.
  final Color? splashColor;

  /// The color used to highlight selected rows.
  final Color? selectedRowColor;

  /// The color used for widgets in their inactive (but enabled)
  /// state. For example, an unchecked checkbox. See also [disabledColor].
  final Color? unselectedWidgetColor;

  /// The color used for widgets that are inoperative, regardless of
  /// their state. For example, a disabled checkbox (which may be
  /// checked or unchecked).
  final Color? disabledColor;

  /// The color of the header of a [PaginatedDataTable] when there are selected rows.
  // According to the spec for data tables:
  // https://material.io/archive/guidelines/components/data-tables.html#data-tables-tables-within-cards
  // ...this should be the "50-value of secondary app color".
  final Color? secondaryHeaderColor;

  /// A color that contrasts with the [primaryColor], e.g. used as the
  /// remaining part of a progress bar.
  final Color? backgroundColor;

  /// The background color of [Dialog] elements.
  final Color? dialogBackgroundColor;

  /// The color of the selected tab indicator in a tab bar.
  final Color? indicatorColor;

  /// The color to use for hint text or placeholder text, e.g. in
  /// [TextField] fields.
  final Color? hintColor;

  /// The color to use for input validation errors, e.g. in [TextField] fields.
  final Color? errorColor;

  /// The color used to highlight the active states of toggleable widgets like
  /// [Switch], [Radio], and [Checkbox].
  final Color? toggleableActiveColor;

  // TYPOGRAPHY & ICONOGRAPHY

  /// The color and geometry [TextTheme] values used to configure [materialTextTheme].
  ///
  /// Defaults to a [platform]-appropriate typography.
  final Typography? typography;

  /// Text with a color that contrasts with the card and canvas colors.
  final TextTheme? materialTextTheme;

  /// A text theme that contrasts with the primary color.
  final TextTheme? primaryTextTheme;

  /// An icon theme that contrasts with the card and canvas colors.
  final IconThemeData? iconTheme;

  /// An icon theme that contrasts with the primary color.
  final IconThemeData? primaryIconTheme;

  // COMPONENT THEMES

  /// A theme for customizing the color, elevation, brightness, iconTheme and
  /// textTheme of [AppBar]s.
  final AppBarTheme? appBarTheme;

  /// A theme for customizing the color and text style of a [MaterialBanner].
  final MaterialBannerThemeData? bannerTheme;

  /// A theme for customizing the shape, elevation, and color of a [BottomAppBar].
  final BottomAppBarTheme? bottomAppBarTheme;

  /// A theme for customizing the appearance and layout of [BottomNavigationBar]
  /// widgets.
  final BottomNavigationBarThemeData? bottomNavigationBarTheme;

  /// A theme for customizing the color, elevation, and shape of a bottom sheet.
  final BottomSheetThemeData? bottomSheetTheme;

  /// A theme for customizing the appearance and layout of [ButtonBar] widgets.
  final ButtonBarThemeData? buttonBarTheme;

  /// Defines the default configuration of button widgets, like [ElevatedButton]
  /// and [TextButton].
  final ButtonThemeData? buttonTheme;

  /// The colors and styles used to render [Card].
  ///
  /// This is the value returned from [CardTheme.of].
  final CardTheme? cardTheme;

  /// A theme for customizing the appearance and layout of [Checkbox] widgets.
  final CheckboxThemeData? checkboxTheme;

  /// The colors and styles used to render [Chip]s.
  ///
  /// This is the value returned from [ChipTheme.of].
  final ChipThemeData? chipTheme;

  /// A theme for customizing the appearance and layout of [DataTable]
  /// widgets.
  final DataTableThemeData? dataTableTheme;

  /// A theme for customizing the shape of a dialog.
  final DialogTheme? dialogTheme;

  /// A theme for customizing the color, thickness, and indents of [Divider]s,
  /// [VerticalDivider]s, etc.
  final DividerThemeData? dividerTheme;

  /// A theme for customizing the appearance and layout of [Drawer] widgets.
  final DrawerThemeData? drawerTheme;

  /// A theme for customizing the appearance and internal layout of
  /// [ElevatedButton]s.
  final ElevatedButtonThemeData? elevatedButtonTheme;

  /// A theme for customizing the shape, elevation, and color of a
  /// [FloatingActionButton].
  final FloatingActionButtonThemeData? floatingActionButtonTheme;

  /// A theme for customizing the appearance of [ListTile] widgets.
  final ListTileThemeData? listTileTheme;

  /// A theme for customizing the background color, text style, and icon themes
  /// of a [NavigationBar].
  final NavigationBarThemeData? navigationBarTheme;

  /// A theme for customizing the background color, elevation, text style, and
  /// icon themes of a [NavigationRail].
  final NavigationRailThemeData? navigationRailTheme;

  /// A theme for customizing the appearance and internal layout of
  /// [OutlinedButton]s.
  final OutlinedButtonThemeData? outlinedButtonTheme;

  /// A theme for customizing the color, shape, elevation, and text style of
  /// popup menus.
  final PopupMenuThemeData? popupMenuTheme;

  /// A theme for customizing the appearance and layout of [ProgressIndicator] widgets.
  final ProgressIndicatorThemeData? progressIndicatorTheme;

  /// A theme for customizing the appearance and layout of [Radio] widgets.
  final RadioThemeData? radioTheme;

  /// The colors and shapes used to render [Slider].
  ///
  /// This is the value returned from [SliderTheme.of].
  final SliderThemeData? sliderTheme;

  /// A theme for customizing colors, shape, elevation, and behavior of a [SnackBar].
  final SnackBarThemeData? snackBarTheme;

  /// A theme for customizing the appearance and layout of [Switch] widgets.
  final SwitchThemeData? switchTheme;

  /// A theme for customizing the size, shape, and color of the tab bar indicator.
  final TabBarTheme? tabBarTheme;

  /// A theme for customizing the appearance and internal layout of
  /// [TextButton]s.
  final TextButtonThemeData? textButtonTheme;

  /// A theme for customizing the appearance and layout of [TextField] widgets.
  final TextSelectionThemeData? textSelectionTheme;

  /// A theme for customizing the appearance and layout of time picker widgets.
  final TimePickerThemeData? timePickerTheme;

  /// Defines the default configuration of [ToggleButtons] widgets.
  final ToggleButtonsThemeData? toggleButtonsTheme;

  /// A theme for customizing the visual properties of [Tooltip]s.
  ///
  /// This is the value returned from [TooltipTheme.of].
  final TooltipThemeData? tooltipTheme;

  // ios


  /// The brightness override for Cupertino descendants.
  ///
  /// Defaults to null. If a non-null [Brightness] is specified, the value will
  /// take precedence over the ambient [MediaQueryData.platformBrightness], when
  /// determining the brightness of descendant Cupertino widgets.
  ///
  /// If coming from a Material [Theme] and unspecified, [brightness] will be
  /// derived from the Material [ThemeData]'s `brightness`.
  ///
  /// See also:
  ///
  ///  * [MaterialBasedCupertinoThemeData], a [CupertinoThemeData] that defers
  ///    [brightness] to its Material [Theme] parent if it's unspecified.
  ///
  ///  * [CupertinoTheme.brightnessOf], a method used to retrieve the overall
  ///    [Brightness] from a [BuildContext], for Cupertino widgets.
  final Brightness? brightness;
*/
/*

  /// A color used on interactive elements of the theme.
  ///
  /// This color is generally used on text and icons in buttons and tappable
  /// elements. Defaults to [CupertinoColors.activeBlue].
  ///
  /// If coming from a Material [Theme] and unspecified, [primaryColor] will be
  /// derived from the Material [ThemeData]'s `colorScheme.primary`. However, in
  /// iOS styling, the [primaryColor] is more sparsely used than in Material
  /// Design where the [primaryColor] can appear on non-interactive surfaces like
  /// the [AppBar] background, [TextField] borders etc.
  ///
  /// See also:
  ///
  ///  * [MaterialBasedCupertinoThemeData], a [CupertinoThemeData] that defers
  ///    [primaryColor] to its Material [Theme] parent if it's unspecified.
  final Color? primaryColor;
*/ /*

*/
/*
  /// A color that must be easy to see when rendered on a [primaryColor] background.
  ///
  /// For example, this color is used for a [CupertinoButton]'s text and icons
  /// when the button's background is [primaryColor].
  ///
  /// If coming from a Material [Theme] and unspecified, [primaryContrastingColor]
  /// will be derived from the Material [ThemeData]'s `colorScheme.onPrimary`.
  ///
  /// See also:
  ///
  ///  * [MaterialBasedCupertinoThemeData], a [CupertinoThemeData] that defers
  ///    [primaryContrastingColor] to its Material [Theme] parent if it's unspecified.
  final Color? primaryContrastingColor;

  /// Text styles used by Cupertino widgets.
  ///
  /// Derived from [primaryColor] if unspecified.
  final CupertinoTextThemeData? cupertinoTextTheme;

  /// Background color of the top nav bar and bottom tab bar.
  ///
  /// Defaults to a light gray in light mode, or a dark translucent gray color in
  /// dark mode.
  final Color? barBackgroundColor;*/ /*

*/
/*

  /// Background color of the scaffold.
  ///
  /// Defaults to [CupertinoColors.systemBackground].
  final Color? scaffoldBackgroundColor;
*/ /*



  PlatformTheme({
    this.androidOverscrollIndicator,
    this.applyElevationOverlayColor,
    this.cupertinoOverrideTheme,
    this.inputDecorationTheme,
    this.materialTapTargetSize,
    this.pageTransitionsTheme,
    this.platform,
    this.scrollbarTheme,
    this.splashFactory,
    this.visualDensity,
    this.useMaterial3,
    // COLOR
    // [colorScheme] is the preferred way to configure colors. The other color
    // properties will gradually be phased out, see
    // https://github.com/flutter/flutter/issues/91772.
    this.colorScheme,
    this.primaryColor,
    this.primaryColorLight,
    this.primaryColorDark,
    this.focusColor,
    this.hoverColor,
    this.shadowColor,
    this.canvasColor,
    this.scaffoldBackgroundColor,
    this.bottomAppBarColor,
    this.cardColor,
    this.dividerColor,
    this.highlightColor,
    this.splashColor,
    this.selectedRowColor,
    this.unselectedWidgetColor,
    this.disabledColor,
    this.secondaryHeaderColor,
    this.backgroundColor,
    this.dialogBackgroundColor,
    this.indicatorColor,
    this.hintColor,
    this.errorColor,
    this.toggleableActiveColor,
    // TYPOGRAPHY & ICONOGRAPHY
    this.typography,
    this.materialTextTheme,
    this.primaryTextTheme,
    this.iconTheme,
    this.primaryIconTheme,
    // COMPONENT THEMES
    this.appBarTheme,
    this.bannerTheme,
    this.bottomAppBarTheme,
    this.bottomNavigationBarTheme,
    this.bottomSheetTheme,
    this.buttonBarTheme,
    this.buttonTheme,
    this.cardTheme,
    this.checkboxTheme,
    this.chipTheme,
    this.dataTableTheme,
    this.dialogTheme,
    this.dividerTheme,
    this.drawerTheme,
    this.elevatedButtonTheme,
    this.floatingActionButtonTheme,
    this.listTileTheme,
    this.navigationBarTheme,
    this.navigationRailTheme,
    this.outlinedButtonTheme,
    this.popupMenuTheme,
    this.progressIndicatorTheme,
    this.radioTheme,
    this.sliderTheme,
    this.snackBarTheme,
    this.switchTheme,
    this.tabBarTheme,
    this.textButtonTheme,
    this.textSelectionTheme,
    this.timePickerTheme,
    this.toggleButtonsTheme,
    this.tooltipTheme,
    // ios
    this.brightness,
    */
/*this.primaryColor,*/ /*
*/
/*
    this.primaryContrastingColor,
    this.cupertinoTextTheme,
    this.barBackgroundColor,
    */ /*
*/
/*this.scaffoldBackgroundColor,*/ /*

  }) : materialThemeData = ThemeData(androidOverscrollIndicator: androidOverscrollIndicator,
applyElevationOverlayColor: applyElevationOverlayColor,
cupertinoOverrideTheme: cupertinoOverrideTheme,
inputDecorationTheme: inputDecorationTheme,
materialTapTargetSize: materialTapTargetSize,
pageTransitionsTheme: pageTransitionsTheme,
platform: platform,
scrollbarTheme: scrollbarTheme,
splashFactory: splashFactory,
visualDensity: visualDensity,
useMaterial3: useMaterial3,
colorScheme: colorScheme,
primaryColor: primaryColor,
primaryColorLight: primaryColorLight,
primaryColorDark: primaryColorDark,
focusColor: focusColor,
hoverColor: hoverColor,
shadowColor: shadowColor,
canvasColor: canvasColor,
scaffoldBackgroundColor: scaffoldBackgroundColor,
bottomAppBarColor: bottomAppBarColor,
cardColor: cardColor,
dividerColor: dividerColor,
highlightColor: highlightColor,
splashColor: splashColor,
selectedRowColor: selectedRowColor,
unselectedWidgetColor: unselectedWidgetColor,
disabledColor: disabledColor,
secondaryHeaderColor: secondaryHeaderColor,
backgroundColor: backgroundColor,
dialogBackgroundColor: dialogBackgroundColor,
indicatorColor: indicatorColor,
hintColor: hintColor,
errorColor: errorColor,
toggleableActiveColor: toggleableActiveColor,
typography: typography,
textTheme: materialTextTheme,
primaryTextTheme: primaryTextTheme,
iconTheme: iconTheme,
primaryIconTheme: primaryIconTheme,
appBarTheme: appBarTheme,
bannerTheme: bannerTheme,
bottomAppBarTheme: bottomAppBarTheme,
bottomNavigationBarTheme: bottomNavigationBarTheme,
bottomSheetTheme: bottomSheetTheme,
buttonBarTheme: buttonBarTheme,
buttonTheme: buttonTheme,
cardTheme: cardTheme,
checkboxTheme: checkboxTheme,
chipTheme: chipTheme,
dataTableTheme: dataTableTheme,
dialogTheme: dialogTheme,
dividerTheme: dividerTheme,
drawerTheme: drawerTheme,
elevatedButtonTheme: elevatedButtonTheme,
floatingActionButtonTheme: floatingActionButtonTheme,
listTileTheme: listTileTheme,
navigationBarTheme: navigationBarTheme,
navigationRailTheme: navigationRailTheme,
outlinedButtonTheme: outlinedButtonTheme,
popupMenuTheme: popupMenuTheme,
progressIndicatorTheme: progressIndicatorTheme,
radioTheme: radioTheme,
sliderTheme: sliderTheme,
snackBarTheme: snackBarTheme,
switchTheme: switchTheme,
tabBarTheme: tabBarTheme,
textButtonTheme: textButtonTheme,
textSelectionTheme: textSelectionTheme,
timePickerTheme: timePickerTheme,
toggleButtonsTheme: toggleButtonsTheme,
tooltipTheme: tooltipTheme,
  ),
  cupertinoThemeData = CupertinoThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    primaryContrastingColor: colorScheme!.secondary,
    textTheme: cupertinoTextTheme,
    barBackgroundColor: appBarTheme!.backgroundColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  ),
        super();
}
*/
