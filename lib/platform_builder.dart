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


/// An enum used in the class [PlatformBuilderStatefulWidget] that tells it which [Widget] to build.
enum PlatformBuilderBuild {
  scaffold,
  scrollbarSingleChildScrollView,
  form,
  button,
}

class CustomFormField extends PlatformBuilderStatelessWidget {
  /// The text that is displayed in a form field.
  final String labelText;

  /// Returns [true] if the text in the form field should be hidden, [false] otherwise.
  /// Default value is assigned to [false].
  final bool obscureText;

  /// A [Function] that ensures that what this user typed in the form field meets certain parameters.
  final Function validator;

  /// A [Function] that handles the data typed into the form field.
  ///
  /// Utilizes [onChanged], [onSaved], and [onSubmitted].
  final Function saveField;

  /// A list of text input criteria that needs to be met in the form field when this user is submitting a form.
  final List<TextInputFormatter>? textInputFormatter;

  /// A class that holds all necessary information that a form field needs to utilize.
  CustomFormField({
    required this.labelText,
    this.obscureText = false,
    required this.validator,
    required this.saveField,
    this.textInputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: platform
          ? TextFormField(
              // If text should be hidden as it's typed.
              obscureText: obscureText,
              // Ensures the correct format is used from this user in these fields.
              inputFormatters: textInputFormatter,
              // Label for the form field.
              decoration: InputDecoration(
                label: Text(
                  labelText,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              // Ensures an empty value can't be submitted.
              validator: (String? textValue) {
                return validator(textValue, labelText);
              },
              // Saves the form to memory on a change.
              onChanged: (String? textValue) async {
                await saveField(textValue, labelText);
              },
              // Saves the form to memory on a save.
              onSaved: (String? textValue) async {
                await saveField(textValue, labelText);
              },
              // Saves the form to memory on a submit.
              onFieldSubmitted: (String? textValue) async {
                await saveField(textValue, labelText);
              },
            )
          : CupertinoTextFormFieldRow(
              // If text should be hidden as it's typed.
              obscureText: obscureText,
              // Ensures the correct format is used from this user in these fields.
              inputFormatters: textInputFormatter,
              // Label for the form field.
              prefix: Text(
                labelText,
                style: Theme.of(context).textTheme.headline6,
              ),
              // Ensures an empty value can't be submitted.
              validator: (String? textValue) {
                return validator(textValue, labelText);
              },
              // Saves the form to memory on a change.
              onChanged: (String? textValue) async {
                await saveField(textValue, labelText);
              },
              // Saves the form to memory on a save.
              onSaved: (String? textValue) async {
                await saveField(textValue, labelText);
              },
              // Saves the form to memory on a submit.
              onFieldSubmitted: (String? textValue) async {
                await saveField(textValue, labelText);
              },
            ),
    );
  }
}

// abstract class PlatformBuilderStatelessWidget extends StatelessWidget {
//   // extends StatefulWidget
// //  implements PreferredSizeWidget
// //   // For all Widgets
// //   /// The [BuildContext] passed from the parent Widget.
// //   final BuildContext context;
// //
// //   /// An enum assigned to a value when a [PlatformBuilder] constructor is called.
// //   final PlatformBuilderBuild buildThisWidget;
// //
// //   // For any Widget
// //   /// The content under the parent widget being called if it is a single child.
// //   final Widget? child;
// //
// //   // might not need this
// //   /// A callback function that allows the parent Widget to call [setState((){})] from this [Widget].
// //   final Function? refresh;
// //
// //   // For buildScaffold
// //   // final PreferredSizeWidget? appBar;
// //   /// [true] if an AppBar is wanted, [false] otherwise.
// //   final bool? appBar;
// //
// //   // For buildAppBar
// //   /// The title the bar will display.
// //   final String? title;
// //
// //   // For buildForm
// //   /// A unique [Key] for a form so that the form cannot have more than one instance of itself.
// //   final GlobalKey<FormState>? formKey;
// //
// //   /// Any leading that children need to be in the form.
// //   final List<Widget>? leadingChildren;
// //
// //   /// Any trailing that children need to be in the form.
// //   final List<Widget>? trailingChildren;
// //
// //   // For buildFormField
// //   /// A list of form fields needed to create the form being built.
// //   final List<CustomFormField>? formFieldList;
// //
// //   // For buildButton
// //   /// A function that needs to be executed when the button is pressed.
// //   final VoidCallback? onPressed;
// //
// //   /// Returns a Scaffold Widget based on this user's device's platform.
// //   const PlatformBuilder.buildScaffold(
// //     this.context, {
// //     required this.child,
// //     this.appBar = false,
// //     this.title,
// //     Key? key,
// //   })  : buildThisWidget = PlatformBuilderBuild.scaffold,
// //         refresh = null,
// //         formKey = null,
// //         leadingChildren = null,
// //         trailingChildren = null,
// //         formFieldList = null,
// //         onPressed = null,
// //         assert(child != null),
// //         assert(!(appBar == null && title != null)),
// //         super(key: key);
// //
// //   /// Returns a Scrollbar Widget with a SingleChildScrollView as a child based on this user's device's platform.
// //   const PlatformBuilder.buildScrollbarSingleChildScrollView(
// //     this.context, {
// //     required this.child,
// //     Key? key,
// //   })  : buildThisWidget = PlatformBuilderBuild.scaffold,
// //         title = null,
// //         refresh = null,
// //         appBar = null,
// //         formKey = null,
// //         leadingChildren = null,
// //         trailingChildren = null,
// //         formFieldList = null,
// //         onPressed = null,
// //         super(key: key);
// //
// //   /// Returns a Form Widget based on this user's device's platform.
// //   const PlatformBuilder.buildForm(
// //     this.context, {
// //     required this.formKey,
// //     required this.formFieldList,
// //     this.leadingChildren,
// //     this.trailingChildren,
// //     Key? key,
// //   })  : buildThisWidget = PlatformBuilderBuild.scaffold,
// //         title = null,
// //         child = null,
// //         refresh = null,
// //         appBar = null,
// //         onPressed = null,
// //         assert(formKey != null),
// //         assert(formFieldList != null),
// //         assert(leadingChildren != null),
// //         super(key: key);
// //
// //   /// Returns a Form Widget based on this user's device's platform.
// //   const PlatformBuilder.buildButton(
// //     this.context, {
// //     required this.child,
// //     required this.onPressed,
// //     Key? key,
// //   })  : buildThisWidget = PlatformBuilderBuild.scaffold,
// //         title = null,
// //         refresh = null,
// //         appBar = null,
// //         formKey = null,
// //         formFieldList = null,
// //         leadingChildren = null,
// //         trailingChildren = null,
// //         assert(child != null),
// //         assert(onPressed != null),
// //         super(key: key);
// //
// //   @override
// //   _PlatformBuilderState createState() => _PlatformBuilderState();
// //
// //   @override
// //   Size get preferredSize {
// //     return const Size(double.infinity, kToolbarHeight);
// //   }
// //
// //   /// Builds a scaffold based on this user's device's operating system.
// //   Widget buildPlatformScaffold() {
// //     return platform
// //         ? Scaffold(
// //             appBar: buildPlatformAppBar(),
// //             body: child,
// //           )
// //         : CupertinoPageScaffold(
// //             navigationBar: buildPlatformAppBar(),
// //             child: child!,
// //           );
// //   }
// //
// //   /// Builds an app bar based on this user's device's operating system.
// //   dynamic buildPlatformAppBar() {
// //     return platform
// //         ? AppBar(title: title != null ? Text(title!) : null)
// //         : CupertinoNavigationBar(
// //             middle: title != null ? Text(title!) : null,
// //           );
// //   }
// //
// //   /// Builds a scrollbar based on this user's device's operating system.
// //   Widget buildPlatformScrollbarSingleChildScrollView() {
// //     return platform
// //         ? Scrollbar(
// //             child: SingleChildScrollView(
// //               child: child,
// //             ),
// //           )
// //         : CupertinoScrollbar(
// //             child: SingleChildScrollView(
// //               child: child,
// //             ),
// //           );
// //   }
// //
// //   /// Builds a form based on this user's device's operating system.
// //   Widget buildPlatformForm() {
// //     return platform
// //         ? Form(
// //             key: formKey,
// //             onChanged: () {
// //               Form.of(primaryFocus!.context!)!.save();
// //             },
// //             // Holds the form fields.
// //             child: buildPlatformFormFieldsInColumn(),
// //           )
// //         : CupertinoFormSection(
// //             key: formKey,
// //             // Holds the form fields.
// //             children: buildPlatformFormFieldsWidgets(),
// //           );
// //   }
// //
// //   /// Builds each [CustomFormField] in [formFieldList] as a [Widget] based on this user's device's operating system.
// //   List<Widget> buildPlatformFormFieldsWidgets() {
// //     // A list of each CustomFormField as a Widget. It is initialized with leadingChildren if it is not null.
// //     List<Widget> customFormFieldWidgets = leadingChildren ?? [];
// //     // Creates a Widget from each CustomFormField.
// //     for (CustomFormField customFormField in formFieldList!) {
// //       customFormFieldWidgets.add(customFormField.createFormFieldWidget(context));
// //     }
// //
// //     // Adds trailingChildren if its not null.
// //     customFormFieldWidgets.addAll(trailingChildren ?? []);
// //
// //     // Returns each CustomFormField in its Widget form.
// //     return customFormFieldWidgets;
// //   }
// //
// //   /// Builds all form fields in a [Column] based on this user's device's operating system.
// //   Widget buildPlatformFormFieldsInColumn() {
// //     return Column(
// //       mainAxisSize: MainAxisSize.min,
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: buildPlatformFormFieldsWidgets(),
// //     );
// //
// //     // return Padding(
// //     //   padding: const EdgeInsets.symmetric(vertical: 10),
// //     //   child: ,
// //     // );
// //   }
// //
// //   Widget buildPlatformButton() {
// //     return platform
// //         ? ElevatedButton(
// //             onPressed: onPressed,
// //             child: child,
// //           )
// //         : CupertinoButton(
// //             onPressed: onPressed,
// //             child: child!,
// //           );
// //   }
// // }
// //
// // class _PlatformBuilderState extends State<PlatformBuilder> {
//   /// Helper [bool] to determine the operating system of this user's device.
//   ///
//   /// Returns [true] if Android, [false] if IOS.
//   final bool platform = Platform.isAndroid;
//
//   PlatformBuilderStatelessWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context);
// }

// @override
//   _InitialScreenState createState() => _InitialScreenState();
// }
//
// class _InitialScreenState extends State<InitialScreen> {

/// This is the base class for creating [PlatformBuilderStatelessWidget] as an abstract [StatefulWidget].
/// This class can override any function or variable in the [StatefulWidget] class.
/// [PlatformBuilderWidget] can override any function or variable in this class.
/// This is the last class created.
abstract class PlatformBuilderStatefulWidget extends StatefulWidget {
  /// Helper [bool] to determine the operating system of this user's device.
  ///
  /// Returns [true] if Android, [false] if IOS.
  final bool platform = Platform.isAndroid;

  /// Initializes [key] for subclasses.
  PlatformBuilderStatefulWidget({Key? key}) : super(key: key);

  @override
  PlatformBuilderState createState();
}

/// This class allows [PlatformBuilderStatefulWidget] to be called
/// This class can override any function or variable in the [PlatformBuilderStatefulWidget] class.
/// Any function or variable in this class cannot be overridden.
/// This class is declared as a [StatefulElement] of [PlatformBuilderStatefulWidget],
/// and then its state is created in [PlatformBuilderStatefulWidget].
abstract class PlatformBuilderWidget extends PlatformBuilderStatefulWidget {
  PlatformBuilderWidget({Key? key}) : super(key: key);
}

/// This class needs to extend the State class of any [StatefulWidget] that extends [PlatformBuilderStatefulWidget].
/// This class is a [StatefulElement] of [PlatformBuilderStatefulWidget].
/// This class can override any function or variable in the [State] class.
/// This class does not directly call [PlatformBuilderStatefulWidget],
/// but it takes a class and makes it a [StatefulElement] of [PlatformBuilderStatefulWidget],
/// therefore creating a stateful widget instance.
abstract class PlatformBuilderState<T extends PlatformBuilderStatefulWidget> extends State<T> {
  /// Helper [bool] to determine the operating system of this user's device.
  ///
  /// Returns [true] if Android, [false] if IOS.
  final bool platform = Platform.isAndroid;

  @override
  Widget build(BuildContext context);
}

/// This class needs to be extended from any [StatelessWidget] class that wants to utilize the [PlatformBuilderStatelessWidget] functionality.
/// This class creates an implementation of [PlatformBuilderState] with [PlatformBuilderWidget] as a [StatefulElement].
/// This class can override any function or variable in the [PlatformBuilderState] class.
abstract class PlatformBuilderStatelessWidget extends PlatformBuilderState<PlatformBuilderWidget> {
  @override
  Widget build(BuildContext context);
}

// PlatformBuilder
// PlatformBuilderState<can be any class but the class will use PlatformBuilder> uses State
// PlatformBuilderWidget uses PlatformBuilder
// PlatformBuilderCurrentState uses PlatformBuilderState<PlatformBuilderWidget>
//
// class _PlatformBuilderState extends State<PlatformBuilder> {
//
//   @override
//   Widget build(BuildContext context);
// {
//   switch (widget.buildThisWidget) {
//     case PlatformBuilderBuild.scaffold:
//       {
//         return widget.buildPlatformScaffold();
//       }
//     case PlatformBuilderBuild.scrollbarSingleChildScrollView:
//       {
//         return widget.buildPlatformScrollbarSingleChildScrollView();
//       }
//     case PlatformBuilderBuild.form:
//       {
//         return widget.buildPlatformForm();
//       }
//     case PlatformBuilderBuild.button:
//       {
//         return widget.buildPlatformButton();
//       }
//   }
// }
// }
