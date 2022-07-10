import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './platform_builder.dart';

/// ## Both Android and IOS
/// ---
/// **Material's MaterialApp's documentation:**<br>
/// ---
/// **Cupertino's CupertinoApp's documentation:**<br>

/// Returns an app Widget depending on this user's devices' operating system.
class PlatformApp extends PlatformBuilderStatefulWidget {
  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.navigatorKey}
  final GlobalKey<NavigatorState>? navigatorKey;

  /// ## Both Android and IOS
  /// A key to use when building the [ScaffoldMessenger].
  ///
  /// If a [scaffoldMessengerKey] is specified, the [ScaffoldMessenger] can be
  /// directly manipulated without first obtaining it from a [BuildContext] via
  /// [ScaffoldMessenger.of]: from the [scaffoldMessengerKey], use the
  /// [GlobalKey.currentState] getter.
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.home}
  final Widget? home;

  /// ## Both Android and IOS
  /// ---
  /// **Material's MaterialApp's documentation:**<br>
  /// The application's top-level routing table.
  ///
  /// When a named route is pushed with [Navigator.pushNamed], the route name is
  /// looked up in this map. If the name is present, the associated
  /// [widgets.WidgetBuilder] is used to construct a [MaterialPageRoute] that
  /// performs an appropriate transition, including [Hero] animations, to the
  /// new route.
  ///
  /// {@macro flutter.widgets.widgetsApp.routes}
  /// ---
  /// **Cupertino's CupertinoApp's documentation:**<br>
  /// The application's top-level routing table.
  ///
  /// When a named route is pushed with [Navigator.pushNamed], the route name is
  /// looked up in this map. If the name is present, the associated
  /// [widgets.WidgetBuilder] is used to construct a [MaterialPageRoute] that
  /// performs an appropriate transition, including [Hero] animations, to the
  /// new route.
  ///
  /// {@macro flutter.widgets.widgetsApp.routes}
  final Map<String, WidgetBuilder>? routes;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.initialRoute}
  final String? initialRoute;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.onGenerateRoute}
  final RouteFactory? onGenerateRoute;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.onGenerateInitialRoutes}
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.onUnknownRoute}
  final RouteFactory? onUnknownRoute;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver>? navigatorObservers;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.builder}
  ///
  /// Material specific features such as [showDialog] and [showMenu], and widgets
  /// such as [Tooltip], [PopupMenuButton], also require a [Navigator] to properly
  /// function.
  final TransitionBuilder? builder;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.title}
  ///
  /// This value is passed unmodified to [WidgetsApp.title].
  final String title;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.onGenerateTitle}
  ///
  /// This value is passed unmodified to [WidgetsApp.onGenerateTitle].
  final GenerateAppTitle? onGenerateTitle;

  /// ## Both Android and IOS
  /// You can use either [materialThemeData] or [cupertinoThemeData].
  /// You do not have to define both, although defining [materialThemeData] over [cupertinoThemeData] is preferred.
  /// ---
  /// Default visual properties, like colors fonts and shapes, for this app's
  /// material widgets.
  ///
  /// A second [darkTheme] [ThemeData] value, which is used to provide a dark
  /// version of the user interface can also be specified. [themeMode] will
  /// control which theme will be used if a [darkTheme] is provided.
  ///
  /// The default value of this property is the value of [ThemeData.light()].
  ///
  /// See also:
  ///
  ///  * [themeMode], which controls which theme to use.
  ///  * [MediaQueryData.platformBrightness], which indicates the platform's
  ///    desired brightness and is used to automatically toggle between [theme]
  ///    and [darkTheme] in [MaterialApp].
  ///  * [ThemeData.brightness], which indicates the [Brightness] of a theme's
  ///    colors.
  final ThemeData? materialThemeData;

  /*/// ## Both Android and IOS
  /// You can use either [materialThemeData] or [cupertinoThemeData].
  /// You do not have to define both, although defining [materialThemeData] over [cupertinoThemeData] is preferred.
  /// ---
  /// The top-level [CupertinoTheme] styling.
  ///
  /// A null [materialThemeData] or unspecified [materialThemeData] attributes will default to iOS
  /// system values.
  final CupertinoThemeData? cupertinoThemeData;*/

  /// ## Both Android and IOS
  /// The [ThemeData] to use when a 'dark mode' is requested by the system.
  ///
  /// Some host platforms allow the users to select a system-wide 'dark mode',
  /// or the application may want to offer the user the ability to choose a
  /// dark theme just for this application. This is theme that will be used for
  /// such cases. [themeMode] will control which theme will be used.
  ///
  /// This theme should have a [ThemeData.brightness] set to [Brightness.dark].
  ///
  /// Uses [materialThemeData] instead when null. Defaults to the value of
  /// [ThemeData.light()] when both [darkTheme] and [materialThemeData] are null.
  ///
  /// See also:
  ///
  ///  * [themeMode], which controls which theme to use.
  ///  * [MediaQueryData.platformBrightness], which indicates the platform's
  ///    desired brightness and is used to automatically toggle between [theme]
  ///    and [darkTheme] in [MaterialApp].
  ///  * [ThemeData.brightness], which is typically set to the value of
  ///    [MediaQueryData.platformBrightness].
  final ThemeData? darkTheme;

  /// ## Both Android and IOS
  /// The [ThemeData] to use when 'high contrast' is requested by the system.
  ///
  /// Some host platforms (for example, iOS) allow the users to increase
  /// contrast through an accessibility setting.
  ///
  /// Uses [materialThemeData] instead when null.
  ///
  /// See also:
  ///
  ///  * [MediaQueryData.highContrast], which indicates the platform's
  ///    desire to increase contrast.
  final ThemeData? highContrastTheme;

  /// ## Both Android and IOS
  /// The [ThemeData] to use when a 'dark mode' and 'high contrast' is requested
  /// by the system.
  ///
  /// Some host platforms (for example, iOS) allow the users to increase
  /// contrast through an accessibility setting.
  ///
  /// This theme should have a [ThemeData.brightness] set to [Brightness.dark].
  ///
  /// Uses [darkTheme] instead when null.
  ///
  /// See also:
  ///
  ///  * [MediaQueryData.highContrast], which indicates the platform's
  ///    desire to increase contrast.
  final ThemeData? highContrastDarkTheme;

  /// ## Both Android and IOS
  /// Determines which theme will be used by the application if both [materialThemeData]
  /// and [darkTheme] are provided.
  ///
  /// If set to [ThemeMode.system], the choice of which theme to use will
  /// be based on the user's system preferences. If the [MediaQuery.platformBrightnessOf]
  /// is [Brightness.light], [materialThemeData] will be used. If it is [Brightness.dark],
  /// [darkTheme] will be used (unless it is null, in which case [materialThemeData]
  /// will be used.
  ///
  /// If set to [ThemeMode.light] the [materialThemeData] will always be used,
  /// regardless of the user's system preference.
  ///
  /// If set to [ThemeMode.dark] the [darkTheme] will be used
  /// regardless of the user's system preference. If [darkTheme] is null
  /// then it will fallback to using [materialThemeData].
  ///
  /// The default value is [ThemeMode.system].
  ///
  /// See also:
  ///
  ///  * [materialThemeData], which is used when a light mode is selected.
  ///  * [darkTheme], which is used when a dark mode is selected.
  ///  * [ThemeData.brightness], which indicates to various parts of the
  ///    system what kind of theme is being used.
  final ThemeMode? themeMode;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.color}
  final Color? color;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  ///
  /// Internationalized apps that require translations for one of the locales
  /// listed in [GlobalMaterialLocalizations] should specify this parameter
  /// and list the [supportedLocales] that the application can handle.
  ///
  /// ```dart
  /// import 'package:flutter_localizations/flutter_localizations.dart';
  /// MaterialApp(
  ///   localizationsDelegates: [
  ///     // ... app-specific localization delegate[s] here
  ///     GlobalMaterialLocalizations.delegate,
  ///     GlobalWidgetsLocalizations.delegate,
  ///   ],
  ///   supportedLocales: [
  ///     const Locale('en', 'US'), // English
  ///     const Locale('he', 'IL'), // Hebrew
  ///     // ... other locales the app supports
  ///   ],
  ///   // ...
  /// )
  /// ```
  ///
  /// ## Adding localizations for a new locale
  ///
  /// The information that follows applies to the unusual case of an app
  /// adding translations for a language not already supported by
  /// [GlobalMaterialLocalizations].
  ///
  /// Delegates that produce [WidgetsLocalizations] and [MaterialLocalizations]
  /// are included automatically. Apps can provide their own versions of these
  /// localizations by creating implementations of
  /// [LocalizationsDelegate<WidgetsLocalizations>] or
  /// [LocalizationsDelegate<MaterialLocalizations>] whose load methods return
  /// custom versions of [WidgetsLocalizations] or [MaterialLocalizations].
  ///
  /// For example: to add support to [MaterialLocalizations] for a
  /// locale it doesn't already support, say `const Locale('foo', 'BR')`,
  /// one could just extend [DefaultMaterialLocalizations]:
  ///
  /// ```dart
  /// class FooLocalizations extends DefaultMaterialLocalizations {
  ///   FooLocalizations(Locale locale) : super(locale);
  ///   @override
  ///   String get okButtonLabel {
  ///     if (locale == const Locale('foo', 'BR'))
  ///       return 'foo';
  ///     return super.okButtonLabel;
  ///   }
  /// }
  ///
  /// ```
  ///
  /// A `FooLocalizationsDelegate` is essentially just a method that constructs
  /// a `FooLocalizations` object. We return a [SynchronousFuture] here because
  /// no asynchronous work takes place upon "loading" the localizations object.
  ///
  /// ```dart
  /// class FooLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  ///   const FooLocalizationsDelegate();
  ///   @override
  ///   Future<FooLocalizations> load(Locale locale) {
  ///     return SynchronousFuture(FooLocalizations(locale));
  ///   }
  ///   @override
  ///   bool shouldReload(FooLocalizationsDelegate old) => false;
  /// }
  /// ```
  ///
  /// Constructing a [MaterialApp] with a `FooLocalizationsDelegate` overrides
  /// the automatically included delegate for [MaterialLocalizations] because
  /// only the first delegate of each [LocalizationsDelegate.type] is used and
  /// the automatically included delegates are added to the end of the app's
  /// [localizationsDelegates] list.
  ///
  /// ```dart
  /// MaterialApp(
  ///   localizationsDelegates: [
  ///     const FooLocalizationsDelegate(),
  ///   ],
  ///   // ...
  /// )
  /// ```
  /// See also:
  ///
  ///  * [supportedLocales], which must be specified along with
  ///    [localizationsDelegates].
  ///  * [GlobalMaterialLocalizations], a [localizationsDelegates] value
  ///    which provides material localizations for many languages.
  ///  * The Flutter Internationalization Tutorial,
  ///    <https://flutter.dev/tutorials/internationalization/>.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.localeListResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.LocaleResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleResolutionCallback? localeResolutionCallback;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  ///
  /// It is passed along unmodified to the [WidgetsApp] built by this widget.
  ///
  /// See also:
  ///
  ///  * [localizationsDelegates], which must be specified for localized
  ///    applications.
  ///  * [GlobalMaterialLocalizations], a [localizationsDelegates] value
  ///    which provides material localizations for many languages.
  ///  * The Flutter Internationalization Tutorial,
  ///    <https://flutter.dev/tutorials/internationalization/>.
  final Iterable<Locale> supportedLocales;

  /// ## Both Android and IOS
  /// Turns on a performance overlay.
  ///
  /// See also:
  ///
  ///  * <https://flutter.dev/debugging/#performanceoverlay>
  final bool showPerformanceOverlay;

  /// ## Both Android and IOS
  /// Turns on checkerboarding of raster cache images.
  final bool checkerboardRasterCacheImages;

  /// ## Both Android and IOS
  /// Turns on checkerboarding of layers rendered to offscreen bitmaps.
  final bool checkerboardOffscreenLayers;

  /// ## Both Android and IOS
  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  final bool showSemanticsDebugger;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.debugShowCheckedModeBanner}
  final bool debugShowCheckedModeBanner;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.shortcuts}
  /// {@tool snippet}
  /// This example shows how to add a single shortcut for
  /// [LogicalKeyboardKey.select] to the default shortcuts without needing to
  /// add your own [Shortcuts] widget.
  ///
  /// Alternatively, you could insert a [Shortcuts] widget with just the mapping
  /// you want to add between the [WidgetsApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return WidgetsApp(
  ///     shortcuts: <ShortcutActivator, Intent>{
  ///       ... WidgetsApp.defaultShortcuts,
  ///       const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
  ///     },
  ///     color: const Color(0xFFFF0000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.shortcuts.seeAlso}
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// {@macro flutter.widgets.widgetsApp.actions}
  /// {@tool snippet}
  /// This example shows how to add a single action handling an
  /// [ActivateAction] to the default actions without needing to
  /// add your own [Actions] widget.
  ///
  /// Alternatively, you could insert a [Actions] widget with just the mapping
  /// you want to add between the [WidgetsApp] and its child and get the same
  /// effect.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return WidgetsApp(
  ///     actions: <Type, Action<Intent>>{
  ///       ... WidgetsApp.defaultActions,
  ///       ActivateAction: CallbackAction<Intent>(
  ///         onInvoke: (Intent intent) {
  ///           // Do something here...
  ///           return null;
  ///         },
  ///       ),
  ///     },
  ///     color: const Color(0xFFFF0000),
  ///     builder: (BuildContext context, Widget? child) {
  ///       return const Placeholder();
  ///     },
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  /// {@macro flutter.widgets.widgetsApp.actions.seeAlso}
  final Map<Type, Action<Intent>>? actions;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.restorationScopeId}
  final String? restorationScopeId;

  /// ## Both Android and IOS
  /// {@template flutter.material.materialApp.scrollBehavior}
  /// The default [ScrollBehavior] for the application.
  ///
  /// [ScrollBehavior]s describe how [Scrollable] widgets behave. Providing
  /// a [ScrollBehavior] can set the default [ScrollPhysics] across
  /// an application, and manage [Scrollable] decorations like [Scrollbar]s and
  /// [GlowingOverscrollIndicator]s.
  /// {@endtemplate}
  ///
  /// When null, defaults to [MaterialScrollBehavior].
  ///
  /// See also:
  ///
  ///  * [ScrollConfiguration], which controls how [Scrollable] widgets behave
  ///    in a subtree.
  final ScrollBehavior? scrollBehavior;

  /// ## Both Android and IOS
  /// Turns on a [GridPaper] overlay that paints a baseline grid
  /// Material apps.
  ///
  /// Only available in debug mode.
  ///
  /// See also:
  ///
  ///  * <https://material.io/design/layout/spacing-methods.html>
  final bool debugShowMaterialGrid;

  /// ## Both Android and IOS
  /// {@macro flutter.widgets.widgetsApp.useInheritedMediaQuery}
  final bool useInheritedMediaQuery;

  //ios

  PlatformApp({
    Key? key,
    this.navigatorKey, // android and ios
    this.scaffoldMessengerKey,
    this.home, // android and ios
    Map<String, WidgetBuilder> this.routes = const <String, WidgetBuilder>{}, // android
    // Map<String, Widget Function(BuildContext)> this.routes = const <String, WidgetBuilder>{}, // ios
    this.initialRoute, // android and ios
    this.onGenerateRoute, // android and ios
    this.onGenerateInitialRoutes, // android and ios
    this.onUnknownRoute, // android and ios
    List<NavigatorObserver> this.navigatorObservers = const <NavigatorObserver>[], // android and ios
    this.builder, // android and ios
    this.title = '', // android and ios
    this.onGenerateTitle, // android and ios
    this.color, // android and ios
    this.materialThemeData, // android
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.locale, // android and ios
    this.localizationsDelegates, // android and ios
    this.localeListResolutionCallback, // android and ios
    this.localeResolutionCallback, // android and ios
    this.supportedLocales = const <Locale>[Locale('en', 'US')], // android and ios
    this.debugShowMaterialGrid = false, // android only
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery = false,
    //ios
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        super(key: key);

  @override
  PlatformMaterialAppState createState() => PlatformMaterialAppState();
}

class PlatformMaterialAppState extends PlatformBuilderState<PlatformApp> {
  @override
  Widget build(BuildContext context) {
    return platform
        ? MaterialApp(
            title: "VX Alert HC",
            theme: widget.materialThemeData,
            initialRoute: widget.initialRoute,
            routes: widget.routes!,
            onUnknownRoute: widget.onUnknownRoute,
          )
        : CupertinoApp(
            title: "VX Alert HC",
            theme: CupertinoThemeData(
              brightness: widget.materialThemeData!.brightness,
              primaryColor: widget.materialThemeData!.primaryColor,
              primaryContrastingColor: widget.materialThemeData!.colorScheme.secondary,
              textTheme: CupertinoTextThemeData(textStyle: widget.materialThemeData!.textTheme.bodyText2),
              barBackgroundColor: widget.materialThemeData!.appBarTheme.backgroundColor,
              scaffoldBackgroundColor: widget.materialThemeData!.colorScheme.background,
            ),
            initialRoute: widget.initialRoute,
            routes: widget.routes!,
            onUnknownRoute: widget.onUnknownRoute,
          );
  }
}
