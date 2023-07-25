
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
        this.padding,
        this.variant,
        this.alignment,
        this.margin,
        this.width,
        this.height,
        this.child,
        this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: _buildIconButtonWidget(),
    )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: height ?? 0,
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll15:
        return EdgeInsets.all (
          15.sp,
        );
      default:
        return EdgeInsets.all(
          12.sp,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillGray4000c:
        return  AppColor.gray400;
      default:
        return AppColor.whiteA700;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder16:
        return BorderRadius.circular(

            16.00.sp,
        );
      default:
        return BorderRadius.circular(

            24.00.sp,
        );
    }
  }
}

enum IconButtonShape {
  CircleBorder24,
  RoundedBorder16,
}

enum IconButtonPadding {
  PaddingAll12,
  PaddingAll15,
}

enum IconButtonVariant {
  FillWhiteA700,
  FillGray4000c,
}