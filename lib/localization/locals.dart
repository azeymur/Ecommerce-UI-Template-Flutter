import 'package:flutter/material.dart';

class Locals {
  Locals(this.locale);

  final Locale locale;

  static Locals of(BuildContext context) {
    return Localizations.of<Locals>(context, Locals)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'ZeymurStore': 'Zeymur Store',
      'Home': 'Home',
      'Search': 'Search',
      'Loading': 'Loading...',
      'Cart': 'Cart',
      'MyAccount': 'My Account',
      'FeaturedItems': 'Featured Items',
      'ShowAll': 'Show All',
      'PopularItems': 'Popular Items',
      'NewItems': 'New Items',
      'Filters': 'Filters',
      'Categories': 'Categories',
      'Tags': 'Tags',
      'Colors': 'Colors',
      'Materials': 'Materials',
      'Ok': 'OK',
      'Cancel': 'Cancel',
      'Apply': 'Apply',
      'Clear': 'Clear',
      'ClearAllFilters': 'Clear All Filters',
      'Total': 'Total',
      'Checkout': 'Checkout',
      'ShoppingCart': 'Shopping Cart',
      'YourCartEmpty': 'Your cart is empty.',
      'Favorites': 'Favorites',
      'Orders': 'Orders',
      'Addresses': 'Addresses',
      'ChangePassword': 'Change Password',
      'Shipping': 'Shipping',
      'GrandTotal': 'GrandTotal',
      'Title': 'Title',
      'FirstName': 'First Name',
      'LastName': 'Last Name',
      'Company': 'Company',
      'AddressLine1': 'Address Line 1',
      'AddressLine2': 'Address Line 2',
      'City': 'City',
      'State': 'State',
      'PostCode': 'Post Code',
      'Country': 'Country',
      'Phone': 'Phone',
      'Save': 'Save',
      'FullName': 'Full Name',
      'Username': 'Username',
      'Email': 'Email',
      'CurrentPassword': 'Current Password',
      'NewPassword': 'New Password',
      'ConfirmNewPassword': 'Confirm New Password',
      'WelcomeLogIn': 'Welcome Back, Log In!',
      'Password': 'Password',
      'RememberMe': 'Remember Me',
      'ForgotPassword': 'Forgot password?',
      'DontHaveAccount': 'Don\'t have an coount? ',
      'SignUp': 'Sign Up',
      'LogIn': 'Log In',
      'HelloSignUp': 'Hello, Sign Up!',
      'ConfirmPassword': 'Confirm Password',
      'ByClickingSignUp': 'By clicking Sign Up you are in agreement of the',
      'TermsConditions': ' Terms and Conditions.',
      'AlreadyHaveAccount': 'Already have an account? ',
      'ResetMyPassword': 'Reset My Password',
      'PleaseTypeYourEmail':
          'Please type your email then tap the Submit button. We will send an email to reset your password.',
      'Submit': 'Submit',
      'ShowReviews': 'Show Reviews',
      'RelatedItems': 'Related Items',
      'AddCart': 'Add to Cart',
      'YourRating': 'Your Rating',
      'YourReviewOptional': 'Your Review (Optional)',
      'Add': 'Add',
      'Edit': 'Edit',
      'NoItems': 'No items to display.',
      'Payment': 'Payment',
      'Congratulations': 'Congratulations!',
      'YourOrderReceived': 'Your order has been successfully received.',
      'Continue': 'Continue',
      'CardOwnersName': 'Card Owner\'s Name',
      'CardNumber': 'Card Number',
      'Month': 'Month',
      'Year': 'Year',
      'Cvc': 'Cvc',
      'ShipTo': 'Ship to ',
      'CompleteOrder': 'Complete Order',
      'LogOut': 'Log Out',
      'AccountDetails': 'Account Details',
      'Question': 'Question',
      'No': 'No',
      'Yes': 'Yes',
      'DoYouWantDeleteAddress': 'Do you want to delete this address?',
      'DoYouWantDeleteAllItems': 'Do you want to delete all items?',
      'ShippingAddress': 'Shipping Address',
      'NewRating': 'New Rating',
      'Products': 'Products',
      'Ratings': 'Ratings',
      'Retry': 'Retry',
      'Error': 'Error',
      'Info': 'Info',
      'EditPhotoTapped': 'Edit photo tapped.',
      'SortBy': 'Sort by',
      'NewAddress': 'New Address',
      'AddressDetail': 'Address Detail',
      'Delivered': 'Delivered',
      'Processing': 'Processing',
      'Shipped': 'Shipped',
      'Cancelled': 'Cancelled',
      'OrderDetail': 'Order Detail',
      'Default': 'Default',
      'NameAz': 'Name (A-Z)',
      'NameZa': 'Name (Z-A)',
      'PriceLow': 'Price (Low)',
      'PriceHigh': 'Price (High)',
      'HighestRate': 'Highest Rate',
      'RateCount': 'Rate Count',
      'EnterSearchTerm': 'Enter search term',
      'ProductDetail': 'Product Detail',
      'TermsTapped': 'Terms and conditions tapped.',
      'YouMustSelectAddress': 'You must select an address to continue.',
      'RecentSearches': 'Recent Searches',
    },
    /* 
    To add more language support
    'es': {
      'title': 'Hola Mundo',
    },
    */
  };

  static List<String> languages() {
    return _localizedValues.keys.toList();
  }

  String get appName {
    return _localizedValues[locale.languageCode]!['ZeymurStore']!;
  }

  String get home {
    return _localizedValues[locale.languageCode]!['Home']!;
  }

  String get search {
    return _localizedValues[locale.languageCode]!['Search']!;
  }

  String get loading {
    return _localizedValues[locale.languageCode]!['Loading']!;
  }

  String get cart {
    return _localizedValues[locale.languageCode]!['Cart']!;
  }

  String get myAccount {
    return _localizedValues[locale.languageCode]!['MyAccount']!;
  }

  String get featuredItems {
    return _localizedValues[locale.languageCode]!['FeaturedItems']!;
  }

  String get showAll {
    return _localizedValues[locale.languageCode]!['ShowAll']!;
  }

  String get popularItems {
    return _localizedValues[locale.languageCode]!['PopularItems']!;
  }

  String get newItems {
    return _localizedValues[locale.languageCode]!['NewItems']!;
  }

  String get filters {
    return _localizedValues[locale.languageCode]!['Filters']!;
  }

  String get categories {
    return _localizedValues[locale.languageCode]!['Categories']!;
  }

  String get tags {
    return _localizedValues[locale.languageCode]!['Tags']!;
  }

  String get colors {
    return _localizedValues[locale.languageCode]!['Colors']!;
  }

  String get materials {
    return _localizedValues[locale.languageCode]!['Materials']!;
  }

  String get ok {
    return _localizedValues[locale.languageCode]!['Ok']!;
  }

  String get cancel {
    return _localizedValues[locale.languageCode]!['Cancel']!;
  }

  String get apply {
    return _localizedValues[locale.languageCode]!['Apply']!;
  }

  String get clear {
    return _localizedValues[locale.languageCode]!['Clear']!;
  }

  String get clearAllFilters {
    return _localizedValues[locale.languageCode]!['ClearAllFilters']!;
  }

  String get total {
    return _localizedValues[locale.languageCode]!['Total']!;
  }

  String get checkout {
    return _localizedValues[locale.languageCode]!['Checkout']!;
  }

  String get shoppingCart {
    return _localizedValues[locale.languageCode]!['ShoppingCart']!;
  }

  String get yourCartEmpty {
    return _localizedValues[locale.languageCode]!['YourCartEmpty']!;
  }

  String get favorites {
    return _localizedValues[locale.languageCode]!['Favorites']!;
  }

  String get orders {
    return _localizedValues[locale.languageCode]!['Orders']!;
  }

  String get addresses {
    return _localizedValues[locale.languageCode]!['Addresses']!;
  }

  String get changePassword {
    return _localizedValues[locale.languageCode]!['ChangePassword']!;
  }

  String get shipping {
    return _localizedValues[locale.languageCode]!['Shipping']!;
  }

  String get grandTotal {
    return _localizedValues[locale.languageCode]!['GrandTotal']!;
  }

  String get title {
    return _localizedValues[locale.languageCode]!['Title']!;
  }

  String get firstName {
    return _localizedValues[locale.languageCode]!['FirstName']!;
  }

  String get lastName {
    return _localizedValues[locale.languageCode]!['LastName']!;
  }

  String get company {
    return _localizedValues[locale.languageCode]!['Company']!;
  }

  String get addressLine1 {
    return _localizedValues[locale.languageCode]!['AddressLine1']!;
  }

  String get addressLine2 {
    return _localizedValues[locale.languageCode]!['AddressLine2']!;
  }

  String get city {
    return _localizedValues[locale.languageCode]!['City']!;
  }

  String get state {
    return _localizedValues[locale.languageCode]!['State']!;
  }

  String get postCode {
    return _localizedValues[locale.languageCode]!['PostCode']!;
  }

  String get country {
    return _localizedValues[locale.languageCode]!['Country']!;
  }

  String get phone {
    return _localizedValues[locale.languageCode]!['Phone']!;
  }

  String get save {
    return _localizedValues[locale.languageCode]!['Save']!;
  }

  String get fullName {
    return _localizedValues[locale.languageCode]!['FullName']!;
  }

  String get username {
    return _localizedValues[locale.languageCode]!['Username']!;
  }

  String get email {
    return _localizedValues[locale.languageCode]!['Email']!;
  }

  String get currentPassword {
    return _localizedValues[locale.languageCode]!['CurrentPassword']!;
  }

  String get newPassword {
    return _localizedValues[locale.languageCode]!['NewPassword']!;
  }

  String get confirmNewPassword {
    return _localizedValues[locale.languageCode]!['ConfirmNewPassword']!;
  }

  String get welcomeLogIn {
    return _localizedValues[locale.languageCode]!['WelcomeLogIn']!;
  }

  String get password {
    return _localizedValues[locale.languageCode]!['Password']!;
  }

  String get rememberMe {
    return _localizedValues[locale.languageCode]!['RememberMe']!;
  }

  String get forgotPassword {
    return _localizedValues[locale.languageCode]!['ForgotPassword']!;
  }

  String get dontHaveAccount {
    return _localizedValues[locale.languageCode]!['DontHaveAccount']!;
  }

  String get signUp {
    return _localizedValues[locale.languageCode]!['SignUp']!;
  }

  String get logIn {
    return _localizedValues[locale.languageCode]!['LogIn']!;
  }

  String get helloSignUp {
    return _localizedValues[locale.languageCode]!['HelloSignUp']!;
  }

  String get confirmPassword {
    return _localizedValues[locale.languageCode]!['ConfirmPassword']!;
  }

  String get byClickingSignUp {
    return _localizedValues[locale.languageCode]!['ByClickingSignUp']!;
  }

  String get termsConditions {
    return _localizedValues[locale.languageCode]!['TermsConditions']!;
  }

  String get alreadyHaveAccount {
    return _localizedValues[locale.languageCode]!['AlreadyHaveAccount']!;
  }

  String get resetMyPassword {
    return _localizedValues[locale.languageCode]!['ResetMyPassword']!;
  }

  String get pleaseTypeYourEmail {
    return _localizedValues[locale.languageCode]!['PleaseTypeYourEmail']!;
  }

  String get submit {
    return _localizedValues[locale.languageCode]!['Submit']!;
  }

  String get showReviews {
    return _localizedValues[locale.languageCode]!['ShowReviews']!;
  }

  String get relatedItems {
    return _localizedValues[locale.languageCode]!['RelatedItems']!;
  }

  String get addCart {
    return _localizedValues[locale.languageCode]!['AddCart']!;
  }

  String get yourRating {
    return _localizedValues[locale.languageCode]!['YourRating']!;
  }

  String get yourReviewOptional {
    return _localizedValues[locale.languageCode]!['YourReviewOptional']!;
  }

  String get add {
    return _localizedValues[locale.languageCode]!['Add']!;
  }

  String get edit {
    return _localizedValues[locale.languageCode]!['Edit']!;
  }

  String get noItems {
    return _localizedValues[locale.languageCode]!['NoItems']!;
  }

  String get payment {
    return _localizedValues[locale.languageCode]!['Payment']!;
  }

  String get congratulations {
    return _localizedValues[locale.languageCode]!['Congratulations']!;
  }

  String get yourOrderReceived {
    return _localizedValues[locale.languageCode]!['YourOrderReceived']!;
  }

  String get continue_ {
    return _localizedValues[locale.languageCode]!['Continue']!;
  }

  String get cardOwnersName {
    return _localizedValues[locale.languageCode]!['CardOwnersName']!;
  }

  String get cardNumber {
    return _localizedValues[locale.languageCode]!['CardNumber']!;
  }

  String get month {
    return _localizedValues[locale.languageCode]!['Month']!;
  }

  String get year {
    return _localizedValues[locale.languageCode]!['Year']!;
  }

  String get cvc {
    return _localizedValues[locale.languageCode]!['Cvc']!;
  }

  String get shipTo {
    return _localizedValues[locale.languageCode]!['ShipTo']!;
  }

  String get completeOrder {
    return _localizedValues[locale.languageCode]!['CompleteOrder']!;
  }

  String get accountDetails {
    return _localizedValues[locale.languageCode]!['AccountDetails']!;
  }

  String get question {
    return _localizedValues[locale.languageCode]!['Question']!;
  }

  String get no {
    return _localizedValues[locale.languageCode]!['No']!;
  }

  String get yes {
    return _localizedValues[locale.languageCode]!['Yes']!;
  }

  String get doYouWantDeleteAddress {
    return _localizedValues[locale.languageCode]!['DoYouWantDeleteAddress']!;
  }

  String get doYouWantDeleteAllItems {
    return _localizedValues[locale.languageCode]!['DoYouWantDeleteAllItems']!;
  }

  String get shippingAddress {
    return _localizedValues[locale.languageCode]!['ShippingAddress']!;
  }

  String get newRating {
    return _localizedValues[locale.languageCode]!['NewRating']!;
  }

  String get products {
    return _localizedValues[locale.languageCode]!['Products']!;
  }

  String get ratings {
    return _localizedValues[locale.languageCode]!['Ratings']!;
  }

  String get retry {
    return _localizedValues[locale.languageCode]!['Retry']!;
  }

  String get error {
    return _localizedValues[locale.languageCode]!['Error']!;
  }

  String get info {
    return _localizedValues[locale.languageCode]!['Info']!;
  }

  String get editPhotoTapped {
    return _localizedValues[locale.languageCode]!['EditPhotoTapped']!;
  }

  String get sortBy {
    return _localizedValues[locale.languageCode]!['SortBy']!;
  }

  String get logOut {
    return _localizedValues[locale.languageCode]!['LogOut']!;
  }

  String get newAddress {
    return _localizedValues[locale.languageCode]!['NewAddress']!;
  }

  String get addressDetail {
    return _localizedValues[locale.languageCode]!['AddressDetail']!;
  }

  String get delivered {
    return _localizedValues[locale.languageCode]!['Delivered']!;
  }

  String get processing {
    return _localizedValues[locale.languageCode]!['Processing']!;
  }

  String get shipped {
    return _localizedValues[locale.languageCode]!['Shipped']!;
  }

  String get cancelled {
    return _localizedValues[locale.languageCode]!['Cancelled']!;
  }

  String get orderDetail {
    return _localizedValues[locale.languageCode]!['OrderDetail']!;
  }

  String get default_ {
    return _localizedValues[locale.languageCode]!['Default']!;
  }

  String get nameAz {
    return _localizedValues[locale.languageCode]!['NameAz']!;
  }

  String get nameZa {
    return _localizedValues[locale.languageCode]!['NameZa']!;
  }

  String get priceLow {
    return _localizedValues[locale.languageCode]!['PriceLow']!;
  }

  String get priceHigh {
    return _localizedValues[locale.languageCode]!['PriceHigh']!;
  }

  String get highestRate {
    return _localizedValues[locale.languageCode]!['HighestRate']!;
  }

  String get rateCount {
    return _localizedValues[locale.languageCode]!['RateCount']!;
  }

  String get enterSearchTerm {
    return _localizedValues[locale.languageCode]!['EnterSearchTerm']!;
  }

  String get productDetail {
    return _localizedValues[locale.languageCode]!['ProductDetail']!;
  }

  String get termsTapped {
    return _localizedValues[locale.languageCode]!['TermsTapped']!;
  }

  String get youMustSelectAddress {
    return _localizedValues[locale.languageCode]!['YouMustSelectAddress']!;
  }

  String get recentSearches {
    return _localizedValues[locale.languageCode]!['RecentSearches']!;
  }
}
