// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

abstract class Keys {
  static const login_submit = ValueKey('loginButton');
  static const login_usernameField = ValueKey('loginUsernameField');
  static const login_passwordField = ValueKey('loginPasswordField');
  static const login_forgotPassword = ValueKey('forgotPassword');
  static const login_signUp = ValueKey('signUp');
  static const requestPassword_input = ValueKey('requestPasswordInput');
  static const requestPassword_submit = ValueKey('requestPasswordSubmit');
  static const toast = ValueKey('toast');
  static const loader = ValueKey('loader');
  static const register_usernameField = ValueKey('registerUsernameField');
  static const register_emailField = ValueKey('registerEmailField');
  static const register_passwordField = ValueKey('registerPasswordField');
  static const register_confirmPasswordField =
      ValueKey('registerConfirmPasswordField');
  static const register_submit = ValueKey('registerSignUp');
  static const tab_home = ValueKey('tabHome');
  static const tab_profile = ValueKey('tabProfile');
  static const tab_myCourses = ValueKey('tabMyCourses');
  static const tab_cart = ValueKey('tabCart');
  static const cartCta = ValueKey('cartCta');
  static const viewCart = ValueKey('viewCart');
  static const cartCheckout = ValueKey('cartCheckout');
  static const cartRemove = ValueKey('cartRemove');
  static const cartAdd = ValueKey('cartAdd');
  static const cartItemsCountBadge = ValueKey('cartItemsCountBadge');
  static const areYouSure_confirm = ValueKey('areYouSureConfirm');
  static const profile_logout = ValueKey('profileLogout');
}
