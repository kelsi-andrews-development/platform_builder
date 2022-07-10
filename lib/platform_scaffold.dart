import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './platform_builder.dart';

/// ## Both Android and IOS
/// ---
/// **Material Scaffold's documentation:**<br>
/// ---
/// **Cupertino's CupertinoPageScaffold's documentation:**<br>

/// Returns a scaffold Widget depending on this user's devices' operating system.
class PlatformScaffold extends PlatformBuilderStatefulWidget {
  /// ## Both Android and IOS
  /// The primary content of this Widget.
  /// Android has more customization abilities from the Scaffold Widget alone, but it will be implemented for IOS as well if you choose to use them.
  /// Keep in mind that Android devices and IOS devices have different design standards.
  /// TODO: Create bool for onlyAndroid implementation..?
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// The primary content of the scaffold.
  ///
  /// Displayed below the [appBar], above the bottom of the ambient
  /// [MediaQuery]'s [MediaQueryData.viewInsets], and behind the
  /// [floatingActionButton] and [drawer]. If [resizeToAvoidBottomInset] is
  /// false then the body is not resized when the onscreen keyboard appears,
  /// i.e. it is not inset by `viewInsets.bottom`.
  ///
  /// The widget in the body of the scaffold is positioned at the top-left of
  /// the available space between the app bar and the bottom of the scaffold. To
  /// center this widget instead, consider putting it in a [Center] widget and
  /// having that be the body. To expand this widget instead, consider
  /// putting it in a [SizedBox.expand].
  ///
  /// If you have a column of widgets that should normally fit on the screen,
  /// but may overflow and would in such cases need to scroll, consider using a
  /// [ListView] as the body of the scaffold. This is also a good choice for
  /// the case where your body is a scrollable list.
  /// ---
  /// **Cupertino's CupertinoPageScaffold's documentation:**<br>
  /// Widget to show in the main content area.
  ///
  /// Content can slide under the [navigationBar] when they're translucent.
  /// In that case, the child's [BuildContext]'s [MediaQuery] will have a
  /// top padding indicating the area of obstructing overlap from the
  /// [navigationBar].
  final Widget? child;

  /// ## Both Android and IOS
  /// Android uses a [PreferredSizeWidget] and IOS uses an [ObstructingPreferredSizeWidget].
  /// You do not need to provide either Widget unless you plan to not use [PlatformBuilderStatefulWidget.buildAppBar] constructor.
  /// If this is the case, you will need to provide your own platform check in order to properly use an appBar/navigationBar on each platform.
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// An app bar to display at the top of the scaffold.
  /// ---
  /// **Cupertino's CupertinoPageScaffold's documentation:**<br>
  /// The [navigationBar], typically a [CupertinoNavigationBar], is drawn at the
  /// top of the screen.
  ///
  /// If translucent, the main content may slide behind it.
  /// Otherwise, the main content's top margin will be offset by its height.
  ///
  /// The scaffold assumes the navigation bar will account for the [MediaQuery]
  /// top padding, also consume it if the navigation bar is opaque.
  ///
  /// By default `navigationBar` has its text scale factor set to 1.0 and does
  /// not respond to text scale factor changes from the operating system, to match
  /// the native iOS behavior. To override such behavior, wrap each of the `navigationBar`'s
  /// components inside a [MediaQuery] with the desired [MediaQueryData.textScaleFactor]
  /// value. The text scale factor value from the operating system can be retrieved
  /// in many ways, such as querying [MediaQuery.textScaleFactorOf] against
  /// [CupertinoApp]'s [BuildContext].
  final dynamic appBar;

  // final PreferredSizeWidget? appBar = AppBar();
  // final ObstructingPreferredSizeWidget? navigationBar;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  final Widget? floatingActionButton;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**
  /// Responsible for determining where the [floatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location, [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  ///
  /// If null, the [ScaffoldState] will use the default animator, [FloatingActionButtonAnimator.scaling].
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Typically this is a list of [TextButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in an [OverflowBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget>? persistentFooterButtons;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
  /// right-to-left ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openDrawer] function.
  ///
  /// To close the drawer, use [Navigator.pop].
  ///
  /// {@tool dartpad}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.drawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openDrawer] to open the drawer and [Navigator.pop] to close
  /// it.
  ///
  /// ** See code in examples/api/lib/material/scaffold/scaffold.drawer.0.dart **
  /// {@end-tool}
  final Widget? drawer;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// Optional callback that is called when the [Scaffold.drawer] is opened or closed.
  final DrawerCallback? onDrawerChanged;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from right-to-left ([TextDirection.ltr]) or
  /// left-to-right ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openEndDrawer] function.
  ///
  /// To close the drawer, use [Navigator.pop].
  ///
  /// {@tool dartpad}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.endDrawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openEndDrawer] to open the drawer and [Navigator.pop] to
  /// close it.
  ///
  /// ** See code in examples/api/lib/material/scaffold/scaffold.end_drawer.0.dart **
  /// {@end-tool}
  final Widget? endDrawer;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// Optional callback that is called when the [Scaffold.endDrawer] is opened or closed.
  final DrawerCallback? onEndDrawerChanged;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// The color to use for the scrim that obscures primary content while a drawer is open.
  ///
  /// If this is null, then [DrawerThemeData.scrimColor] is used. If that
  /// is also null, then it defaults to [Colors.black54].
  final Color? drawerScrimColor;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  ///
  /// By default, the value used is 20.0 added to the padding edge of
  /// `MediaQuery.of(context).padding` that corresponds to the surrounding
  /// [TextDirection]. This ensures that the drag area for notched devices is
  /// not obscured. For example, if `TextDirection.of(context)` is set to
  /// [TextDirection.ltr], 20.0 will be added to
  /// `MediaQuery.of(context).padding.left`.
  final double? drawerEdgeDragWidth;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// Determines if the [Scaffold.drawer] can be opened with a drag
  /// gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool drawerEnableOpenDragGesture;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// Determines if the [Scaffold.endDrawer] can be opened with a
  /// drag gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool endDrawerEnableOpenDragGesture;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// {@macro flutter.material.DrawerController.dragStartBehavior}
  final DragStartBehavior drawerDragStartBehavior;

  /// ## Both Android and IOS
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  ///
  /// ---
  /// **Cupertino's CupertinoPageScaffold's documentation:**<br>
  /// Whether the [child] should size itself to avoid the window's bottom inset.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true and cannot be null.
  final bool resizeToAvoidBottomInset;

  /// ## Both Android and IOS
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// The color of the [Material] widget that underlies the entire Scaffold.
  ///
  /// The theme's [ThemeData.scaffoldBackgroundColor] by default.
  /// ---
  /// **Cupertino's CupertinoPageScaffold's documentation:**<br>
  /// /// The color of the widget that underlies the entire scaffold.
  ///
  /// By default uses [CupertinoTheme]'s `scaffoldBackgroundColor` when null.
  final Color? backgroundColor;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  ///
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget? bottomNavigationBar;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// The persistent bottom sheet to display.
  ///
  /// A persistent bottom sheet shows information that supplements the primary
  /// content of the app. A persistent bottom sheet remains visible even when
  /// the user interacts with other parts of the app.
  ///
  /// A closely related widget is a modal bottom sheet, which is an alternative
  /// to a menu or a dialog and prevents the user from interacting with the rest
  /// of the app. Modal bottom sheets can be created and displayed with the
  /// [showModalBottomSheet] function.
  ///
  /// Unlike the persistent bottom sheet displayed by [showBottomSheet]
  /// this bottom sheet is not a [LocalHistoryEntry] and cannot be dismissed
  /// with the scaffold appbar's back button.
  ///
  /// If a persistent bottom sheet created with [showBottomSheet] is already
  /// visible, it must be closed before building the Scaffold with a new
  /// [bottomSheet].
  ///
  /// The value of [bottomSheet] can be any widget at all. It's unlikely to
  /// actually be a [BottomSheet], which is used by the implementations of
  /// [showBottomSheet] and [showModalBottomSheet]. Typically it's a widget
  /// that includes [Material].
  ///
  /// See also:
  ///
  ///  * [showBottomSheet], which displays a bottom sheet as a route that can
  ///    be dismissed with the scaffold's back button.
  ///  * [showModalBottomSheet], which displays a modal bottom sheet.
  final Widget? bottomSheet;

  /// ## Android Only
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// Whether this scaffold is being displayed at the top of the screen.
  ///
  /// If true then the height of the [appBar] will be extended by the height
  /// of the screen's status bar, i.e. the top padding for [MediaQuery].
  ///
  /// The default value of this property, like the default value of
  /// [AppBar.primary], is true.
  final bool primary;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// If true, and [bottomNavigationBar] or [persistentFooterButtons]
  /// is specified, then the [body] extends to the bottom of the Scaffold,
  /// instead of only extending to the top of the [bottomNavigationBar]
  /// or the [persistentFooterButtons].
  ///
  /// If true, a [MediaQuery] widget whose bottom padding matches the height
  /// of the [bottomNavigationBar] will be added above the scaffold's [body].
  ///
  /// This property is often useful when the [bottomNavigationBar] has
  /// a non-rectangular shape, like [CircularNotchedRectangle], which
  /// adds a [FloatingActionButton] sized notch to the top edge of the bar.
  /// In this case specifying `extendBody: true` ensures that scaffold's
  /// body will be visible through the bottom navigation bar's notch.
  ///
  /// See also:
  ///
  ///  * [extendBodyBehindAppBar], which extends the height of the body
  ///    to the top of the scaffold.
  final bool extendBody;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// If true, and an [appBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  ///
  /// This is useful if the app bar's [AppBar.backgroundColor] is not
  /// completely opaque.
  ///
  /// This property is false by default. It must not be null.
  ///
  /// See also:
  ///
  ///  * [extendBody], which extends the height of the body to the bottom
  ///    of the scaffold.
  final bool extendBodyBehindAppBar;

  /// ## Android Only:
  /// ---
  /// **Material Scaffold's documentation:**<br>
  /// Restoration ID to save and restore the state of the [Scaffold].
  ///
  /// If it is non-null, the scaffold will persist and restore whether the
  /// [drawer] and [endDrawer] was open or closed.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  // /// Helper [bool] to determine the operating system of this user's device.
  // ///
  // /// Returns [true] if Android, [false] if IOS.
  // final bool platform = Platform.isAndroid;

  PlatformScaffold({
    Key? key,
    required this.child,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.resizeToAvoidBottomInset = true, // both ios and android - Scaffold by default has this false and CupertinoPageScaffold has it true by default
    this.backgroundColor, // both ios and android
    this.bottomNavigationBar,
    this.bottomSheet,
    this.primary = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.restorationId,
    // ios
  }) : super(key: key);

  @override
  PlatformScaffoldState createState() => PlatformScaffoldState();
}

class PlatformScaffoldState extends PlatformBuilderState<PlatformScaffold> {
  @override
  Widget build(BuildContext context) {
    return platform
        ? Scaffold(
            appBar: widget.appBar,
            key: widget.key,
            body: widget.child,
            floatingActionButton: widget.floatingActionButton,
            floatingActionButtonLocation: widget.floatingActionButtonLocation,
            floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
            persistentFooterButtons: widget.persistentFooterButtons,
            drawer: widget.drawer,
            onDrawerChanged: widget.onDrawerChanged,
            endDrawer: widget.endDrawer,
            onEndDrawerChanged: widget.onEndDrawerChanged,
            bottomNavigationBar: widget.bottomNavigationBar,
            bottomSheet: widget.bottomSheet,
            backgroundColor: widget.backgroundColor,
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
            primary: widget.primary,
            drawerDragStartBehavior: widget.drawerDragStartBehavior,
            extendBody: widget.extendBody,
            extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
            drawerScrimColor: widget.drawerScrimColor,
            drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
            drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
            endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
            restorationId: widget.restorationId,
          )
        : CupertinoPageScaffold(
            key: widget.key,
            child: widget.child!,
            navigationBar: widget.appBar,
            backgroundColor: widget.backgroundColor,
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          );
  }
}
