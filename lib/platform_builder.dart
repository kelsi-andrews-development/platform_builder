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
/// ***This class will never be directly called, but it is used in every [PlatformBuilder Widget]
/// <br><br>
/// ***Dev Notes - Keep on dev branch, remove upon publishing***
/// - This class can override any function or variable in the [StatefulWidget] class.
/// - [PlatformBuilderWidget] can override any function or variable in this class.
/// - This is the last class created.
abstract class PlatformBuilderStatefulWidget extends StatefulWidget {
  /// Helps determine the operating system of this user's device.
  /// * [true] - Device is Android operating system
  /// * [false] - Device is IOS operating system
  final bool platform = Platform.isAndroid;

  /// Initializes [key] for subclasses.
  PlatformBuilderStatefulWidget({Key? key}) : super(key: key);

  @override
  PlatformBuilderState createState();
}

/// The [StatefulElement] or [StatelessElement] of [PlatformBuilder]
///
/// ***Does not implement the [State] of [PlatformBuilder]***
/// <br><br>
/// ***Dev Notes - Keep on dev branch, remove upon publishing***
///
/// * This class allows [PlatformBuilderStatefulWidget] to be called
/// * This class can override any function or variable in the [PlatformBuilderStatefulWidget] class.
/// * Any function or variable in this class cannot be overridden.
/// * This class is declared as a [StatefulElement] of [PlatformBuilderStatefulWidget],
/// and then its state is created in [PlatformBuilderStatefulWidget].
abstract class PlatformBuilderWidget extends PlatformBuilderStatefulWidget {
  PlatformBuilderWidget({Key? key}) : super(key: key);
}

/// Base class for implementing a [StatefulElement] or [StatelessElement] for [PlatformBuilder] as a [State]
/// <br><br>
/// ***Dev Notes - Keep on dev branch, remove upon publishing***
/// This class needs to extend the State class of any [StatefulWidget] that extends [PlatformBuilderStatefulWidget].
/// This class is a [StatefulElement] of [PlatformBuilderStatefulWidget].
/// This class can override any function or variable in the [State] class.
/// This class does not directly call [PlatformBuilderStatefulWidget],
/// but it takes the class and makes it a [StatefulElement] of [PlatformBuilderStatefulWidget],
/// therefore creating a stateful widget instance. (replace with: creating a state for a widget instance..?)
abstract class PlatformBuilderState<T extends PlatformBuilderStatefulWidget> extends State<T> {
  /// Helper [bool] to determine the operating system of this user's device.
  ///
  /// Returns [true] if Android, [false] if IOS.
  final bool platform = Platform.isAndroid;

  @override
  Widget build(BuildContext context);
}

/// Base class for implementing [PlatformBuilder] as a [StatelessWidget]
/// <br><br>
/// ***Dev Notes - Keep on dev branch, remove upon publishing***
/// This class needs to be extended from any [StatelessWidget] class that wants to utilize the [PlatformBuilderStatelessWidget] functionality.
/// This class creates an implementation of [PlatformBuilderState] with [PlatformBuilderWidget] as a [StatefulElement].
/// This class can override any function or variable in the [PlatformBuilderState] class.
abstract class PlatformBuilderStatelessWidget extends PlatformBuilderState<PlatformBuilderWidget> {
  @override
  Widget build(BuildContext context);
}
