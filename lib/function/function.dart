String showErrorMessgae(e) {
  String errorMessage = "";

  switch (e) {
    case 'user-not-found':
      errorMessage = 'No user found for that email.';
      break;
    case 'wrong-password':
      errorMessage = 'Wrong password provided.';
      break;
    case 'too-many-requests':
      errorMessage =
          'Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.';
      break;
    case 'invalid-credential':
      errorMessage = 'The email and/or password supplied is incorrect';
      break;
    case 'email-already-in-use':
      errorMessage = 'The email address is already in use by another account';
      break;
    case 'invalid-email':
      errorMessage = 'Enter a valid email address';
      break;
    case 'weak-password':
      errorMessage = 'The password provided is too weak.';
      break;
    default:
      errorMessage = 'An unknown error occurred. Please try again.';
  }
  return errorMessage;
}
