part of '../widgets.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController? controller;
  final bool isPassword;
  final String? hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final IconData? iconPrefix;
  final IconData? iconSuffix;
  final String? initalValue;
  final Function()? suffixTap;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final bool showPassword;
  final String? Function(String?)? validator;
  const TextFieldInput(
      {Key? key,
      this.controller,
      this.hintText,
      this.isPassword = false,
      this.maxLines = 1,
      required this.keyboardType,
      this.iconPrefix,
      this.iconSuffix,
      this.suffixTap,
      this.initalValue,
      this.onChange,
      this.onSubmit,
      this.showPassword = false,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.bodySmall,
        obscureText: isPassword && !showPassword,
        validator: validator,
        keyboardType: keyboardType,
        onChanged: onChange,
        initialValue: initalValue,
        maxLines: maxLines,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: iconPrefix != null
              ? Icon(
                  iconPrefix,
                  color: AppColor.bgColor,
                  size: 15,
                )
              : null,
          suffixIcon: iconSuffix != null
              ? IconButton(
                  style: IconButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: suffixTap,
                  icon: Icon(
                    iconSuffix,
                    color: Colors.grey.shade400,
                    size: 15,
                  ),
                )
              : null,
          filled: true,
          focusedBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          enabledBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          border: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          contentPadding: const EdgeInsets.all(8),
        ),
      );
}
