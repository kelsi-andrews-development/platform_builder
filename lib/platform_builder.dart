library platform_builder;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

/// Base class for implementing [PlatformBuilder] as a [StatefulWidget].
///
/// ***This class will never be directly called, but it is used in every [PlatformBuilder] class or widget.***
abstract class PlatformBuilderStatefulWidget extends StatefulWidget {
  /// Initializes [key] for subclasses.
  const PlatformBuilderStatefulWidget({Key? key}) : super(key: key);

  @override
  PlatformBuilderState createState();
}

/// Base element for implementing a [StatefulElement] or [StatelessElement] of [PlatformBuilder].
///
/// ***Does not implement the [State] of [PlatformBuilder]***
abstract class PlatformBuilderWidget extends PlatformBuilderStatefulWidget {
  const PlatformBuilderWidget({Key? key}) : super(key: key);
}

/// Base class for implementing a [StatefulElement] or [StatelessElement] for [PlatformBuilder] as a [State].
abstract class PlatformBuilderState<T extends PlatformBuilderStatefulWidget> extends State<T> {
  /// Helps determine the operating system of this user's device.
  /// * [true] - Device is Android operating system
  /// * [false] - Device is IOS operating system
  final bool platform = Platform.isAndroid;

  @override
  Widget build(BuildContext context);
}

/// Base class for implementing [PlatformBuilder] as a [StatelessWidget].
abstract class PlatformBuilderStatelessWidget extends PlatformBuilderState<PlatformBuilderWidget> {
  @override
  Widget build(BuildContext context);
}
