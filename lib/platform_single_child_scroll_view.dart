import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './platform_builder.dart';

/// ## Both Android and IOS
/// ---
/// **SingleChildScrollView's documentation:**<br>
/// ---
/// **Material ScrollBar's documentation:**<br>
/// ---
/// **Cupertino's CupertinoScrollBar's documentation:**<br>

/// Returns a [SingleChildScrollView] Widget wrapped in the appropriate scrollbar depending on this user's devices' operating system.
class PlatformSingleChildScrollView extends PlatformBuilderStatefulWidget {
  /// The axis along which the scroll view scrolls.
  ///
  /// Defaults to [Axis.vertical].
  final Axis scrollDirection;

  /// Whether the scroll view scrolls in the reading direction.
  ///
  /// For example, if the reading direction is left-to-right and
  /// [scrollDirection] is [Axis.horizontal], then the scroll view scrolls from
  /// left to right when [reverse] is false and from right to left when
  /// [reverse] is true.
  ///
  /// Similarly, if [scrollDirection] is [Axis.vertical], then the scroll view
  /// scrolls from top to bottom when [reverse] is false and from bottom to top
  /// when [reverse] is true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// The amount of space by which to inset the child.
  final EdgeInsetsGeometry? padding;

  /// ## Both Android and IOS
  /// The [ScrollController] of the [SingleChildScrollView].
  /// This is being passed to [SingleChildScrollView], not [Scrollbar] or [CupertinoScrollbar].
  /// ---
  /// **SingleChildScrollView's documentation:**<br>
  /// An object that can be used to control the position to which this scroll
  /// view is scrolled.
  ///
  /// Must be null if [primary] is true.
  ///
  /// A [ScrollController] serves several purposes. It can be used to control
  /// the initial scroll position (see [ScrollController.initialScrollOffset]).
  /// It can be used to control whether the scroll view should automatically
  /// save and restore its scroll position in the [PageStorage] (see
  /// [ScrollController.keepScrollOffset]). It can be used to read the current
  /// scroll position (see [ScrollController.offset]), or change it (see
  /// [ScrollController.animateTo]).
  final ScrollController? controller;

  /// Whether this is the primary scroll view associated with the parent
  /// [PrimaryScrollController].
  ///
  /// When true, the scroll view is used for default [ScrollAction]s. If a
  /// ScrollAction is not handled by an otherwise focused part of the application,
  /// the ScrollAction will be evaluated using this scroll view, for example,
  /// when executing [Shortcuts] key events like page up and down.
  ///
  /// On iOS, this identifies the scroll view that will scroll to top in
  /// response to a tap in the status bar.
  ///
  /// Defaults to true when [scrollDirection] is vertical and [controller] is
  /// not specified.
  final bool primary;

  /// How the scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to animate after the
  /// user stops dragging the scroll view.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// ## Both Android and IOS
  /// The main content of what is being scrolled.
  /// This is being passed to [SingleChildScrollView], not [Scrollbar] or [CupertinoScrollbar].
  /// ---
  /// **SingleChildScrollView's documentation:**<br>
  /// The widget that scrolls.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// {@macro flutter.widgets.scrollable.restorationId}
  final String? restorationId;

  /// {@macro flutter.widgets.scroll_view.keyboardDismissBehavior}
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  // android

  /// {@macro flutter.widgets.Scrollbar.isAlwaysShown}
  final bool? isAlwaysShown;

  /// Controls the track visibility.
  ///
  /// If this property is null, then [ScrollbarThemeData.trackVisibility] of
  /// [ThemeData.scrollbarTheme] is used. If that is also null, the default value
  /// is false.
  ///
  /// If the track visibility is related to the scrollbar's material state,
  /// use the global [ScrollbarThemeData.trackVisibility] or override the
  /// sub-tree's theme data.
  ///
  /// [showTrackOnHover] can be replaced by this and will be deprecated.
  final bool? trackVisibility;

  /// Controls if the track will show on hover and remain, including during drag.
  ///
  /// If this property is null, then [ScrollbarThemeData.showTrackOnHover] of
  /// [ThemeData.scrollbarTheme] is used. If that is also null, the default value
  /// is false.
  ///
  /// This will be deprecated, and [trackVisibility] is recommended.
  final bool? showTrackOnHover;

  /// The thickness of the scrollbar when a hover state is active and
  /// [showTrackOnHover] is true.
  ///
  /// If this property is null, then [ScrollbarThemeData.thickness] of
  /// [ThemeData.scrollbarTheme] is used to resolve a thickness. If that is also
  /// null, the default value is 12.0 pixels.
  final double? hoverThickness;

  /// The thickness of the scrollbar in the cross axis of the scrollable.
  ///
  /// If null, the default value is platform dependent. On [TargetPlatform.android],
  /// the default thickness is 4.0 pixels. On [TargetPlatform.iOS],
  /// [CupertinoScrollbar.defaultThickness] is used. The remaining platforms have a
  /// default thickness of 8.0 pixels.
  final double? thickness;

  /// The [Radius] of the scrollbar thumb's rounded rectangle corners.
  ///
  /// If null, the default value is platform dependent. On [TargetPlatform.android],
  /// no radius is applied to the scrollbar thumb. On [TargetPlatform.iOS],
  /// [CupertinoScrollbar.defaultRadius] is used. The remaining platforms have a
  /// default [Radius.circular] of 8.0 pixels.
  final Radius? radius;

  /// {@macro flutter.widgets.Scrollbar.interactive}
  final bool? interactive;

  /// ## Both Android and IOS
  /// ---
  /// **Material ScrollBar's documentation:**<br>
  /// {@macro flutter.widgets.Scrollbar.notificationPredicate}
  /// ---
  /// **Cupertino's CupertinoScrollBar's documentation:**<br>
  /// No documentation provided.
  /// This is not part of the [CupertinoScrollBar] class but this can still be passed to it.
  final ScrollNotificationPredicate? notificationPredicate;

  /// ## Both Android and IOS
  /// ---
  /// **Material ScrollBar's documentation:**<br>
  /// {@macro flutter.widgets.Scrollbar.scrollbarOrientation}
  /// ---
  /// **Cupertino's CupertinoScrollBar's documentation:**<br>
  /// No documentation provided.
  /// This is not part of the [CupertinoScrollBar] class but this can still be passed to it.
  final ScrollbarOrientation? scrollbarOrientation;

  // ios

  /// Default value for [thickness] if it's not specified in [CupertinoScrollbar].
  static const double defaultThickness = 3;

  /// Default value for [thicknessWhileDragging] if it's not specified in
  /// [CupertinoScrollbar].
  static const double defaultThicknessWhileDragging = 8.0;

  /// Default value for [radius] if it's not specified in [CupertinoScrollbar].
  static const Radius defaultRadius = Radius.circular(1.5);

  /// Default value for [radiusWhileDragging] if it's not specified in
  /// [CupertinoScrollbar].
  static const Radius defaultRadiusWhileDragging = Radius.circular(4.0);

  /// The thickness of the scrollbar when it's being dragged by the user.
  ///
  /// When the user starts dragging the scrollbar, the thickness will animate
  /// from [thickness] to this value, then animate back when the user stops
  /// dragging the scrollbar.
  final double thicknessWhileDragging;

  /// The radius of the scrollbar edges when the scrollbar is being dragged by
  /// the user.
  ///
  /// When the user starts dragging the scrollbar, the radius will animate
  /// from [radius] to this value, then animate back when the user stops
  /// dragging the scrollbar.
  final Radius radiusWhileDragging;

  PlatformSingleChildScrollView({
    // single child scroll view
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    bool? primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    // android scroll bar
    this.isAlwaysShown = false, // ios and android
    this.trackVisibility,
    this.showTrackOnHover,
    this.hoverThickness,
    this.thickness = defaultThickness, // android and ios
    this.radius = defaultRadius, // android and ios
    this.notificationPredicate,
    this.interactive,
    this.scrollbarOrientation,
    //ios scroll bar
    this.thicknessWhileDragging = defaultThicknessWhileDragging,
    this.radiusWhileDragging = defaultRadiusWhileDragging,
  })  : assert(
          !(controller != null && primary == true),
          'Primary ScrollViews obtain their ScrollController via inheritance from a PrimaryScrollController widget. '
          'You cannot both set primary to true and pass an explicit controller.',
        ),
        primary = primary ?? controller == null && identical(scrollDirection, Axis.vertical),
        // ios
        assert(thickness != null && thickness < double.infinity),
        assert(thicknessWhileDragging < double.infinity),
        assert(radius != null),
        super(key: key);

  @override
  PlatformSingleChildScrollViewState createState() => PlatformSingleChildScrollViewState();
}

class PlatformSingleChildScrollViewState extends PlatformBuilderState<PlatformSingleChildScrollView> {
  @override
  Widget build(BuildContext context) {
    return platform
        ? Scrollbar(
            child: SingleChildScrollView(
              child: widget.child,
            ),
          )
        : CupertinoScrollbar(
            child: SingleChildScrollView(
              child: widget.child,
            ),
          );
  }
}
