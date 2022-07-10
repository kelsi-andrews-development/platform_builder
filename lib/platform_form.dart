import 'package:flutter/cupertino.dart';
import './platform_builder.dart';
import './platform_form_field.dart';

/// ## Both Android and IOS
/// ---
/// **Form's documentation:**<br>
/// ---
/// **Cupertino's CupertinoFormSection's documentation:**<br>

/// Returns a form Widget depending on this user's devices' operating system.
class PlatformForm extends PlatformBuilderStatefulWidget {
  /// The content you want above the form fields.
  final List<Widget>? leadingChildren;

  /// The content you want below the form fields.
  final List<Widget>? trailingChildren;

  /// ## Both Android and IOS
  /// The content of the form.
  /// Both Android and IOS originally had a child or children for the form content.
  /// The main content of this form will be [PlatformFormField] Widgets.
  /// ---
  /// **Form's documentation:**<br>
  /// The widget below this widget in the tree.
  ///
  /// This is the root of the widget hierarchy that contains this form.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  /// ---
  /// **Cupertino's CupertinoFormSection's documentation:**<br>
  /// The list of rows in the section.
  ///
  /// This takes a list, as opposed to a more efficient builder function that
  /// lazy builds, because forms are intended to be short in row count. It is
  /// recommended that only [CupertinoFormRow] and [CupertinoTextFormFieldRow]
  /// widgets be included in the [children] list in order to retain the iOS look.
  final List<PlatformFormField> formFieldList;

  /// Enables the form to veto attempts by the user to dismiss the [ModalRoute]
  /// that contains the form.
  ///
  /// If the callback returns a Future that resolves to false, the form's route
  /// will not be popped.
  ///
  /// See also:
  ///
  ///  * [WillPopScope], another widget that provides a way to intercept the
  ///    back button.
  final WillPopCallback? onWillPop;

  /// Called when one of the form fields changes.
  ///
  /// In addition to this callback being invoked, all the form fields themselves
  /// will rebuild.
  final VoidCallback? onChanged;

  /// Used to enable/disable form fields auto validation and update their error
  /// text.
  ///
  /// {@macro flutter.widgets.FormField.autovalidateMode}
  final AutovalidateMode autoValidateMode;

  // ios

  /// Sets the form section header. The section header lies above the
  /// [children] rows.
  final Widget? header;

  /// Sets the form section footer. The section footer lies below the
  /// [children] rows.
  final Widget? footer;

  /// Margin around the content area of the section encapsulating [children].
  ///
  /// Defaults to zero padding if constructed with standard
  /// [CupertinoFormSection] constructor. Defaults to the standard notched-style
  /// iOS margin when constructing with [CupertinoFormSection.insetGrouped].
  final EdgeInsetsGeometry margin;

  /// Sets the decoration around [children].
  ///
  /// If null, background color defaults to
  /// [CupertinoColors.secondarySystemGroupedBackground].
  ///
  /// If null, border radius defaults to 10.0 circular radius when constructing
  /// with [CupertinoFormSection.insetGrouped]. Defaults to zero radius for the
  /// standard [CupertinoFormSection] constructor.
  final BoxDecoration? decoration;

  /// Sets the background color behind the section.
  ///
  /// Defaults to [CupertinoColors.systemGroupedBackground].
  final Color backgroundColor;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// A unique [Key] for a form so that the form cannot have more than one instance of itself.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PlatformForm({
    Key? key,
    this.onWillPop,
    this.onChanged,
    this.leadingChildren,
    required this.formFieldList,
    this.trailingChildren,
    AutovalidateMode? autoValidateMode,
    // ios
    // required this.children,
    this.header,
    this.footer,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = CupertinoColors.systemGroupedBackground,
    this.decoration,
    this.clipBehavior = Clip.none,
  })  : assert(
          formFieldList.isNotEmpty,
          "A form must have form fields or there is no reason to add a form.",
        ),
        autoValidateMode = autoValidateMode ?? AutovalidateMode.disabled,
        super(key: key);

  /// Builds each [CustomFormField] in [formFieldList] as a [Widget] based on this user's device's operating system.
  List<Widget> buildPlatformFormFieldsWidgets() {
    // A list of each CustomFormField as a Widget. It is initialized with leadingChildren if it is not null.
    List<Widget> customFormFieldWidgets = leadingChildren ?? [];
    // Creates a Widget from each CustomFormField.
    for (PlatformFormField platformField in formFieldList) {
      customFormFieldWidgets.add(platformField);
    }

    // Adds trailingChildren if its not null.
    customFormFieldWidgets.addAll(trailingChildren ?? []);

    // Returns each CustomFormField in its Widget form.
    return customFormFieldWidgets;
  }

  /// Builds all form fields in a [Column] based on this user's device's operating system.
  Widget buildPlatformFormFieldsInColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildPlatformFormFieldsWidgets(),
    );
  }

  @override
  PlatformFormState createState() => PlatformFormState();
}

class PlatformFormState extends PlatformBuilderState<PlatformForm> {
  @override
  Widget build(BuildContext context) {
    return platform
        ? Form(
            // key: widget.formKey,
            onChanged: () {
              Form.of(primaryFocus!.context!)!.save();
            },
            // Holds the form fields.
            child: widget.buildPlatformFormFieldsInColumn(),
          )
        : CupertinoFormSection(
            // key: widget.formKey,
            header: widget.leadingChildren != null
                ? Column(
                    children: widget.leadingChildren!,
                  )
                : null,
            // Holds the form fields.
            children: widget.buildPlatformFormFieldsWidgets(),
            footer: widget.trailingChildren != null
                ? Column(
                    children: widget.trailingChildren!,
                  )
                : null,
          );
  }
}
