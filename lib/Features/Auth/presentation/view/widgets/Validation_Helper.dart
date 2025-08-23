class ValidationHelper {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required.';
    }

    String trimmedValue = value.trim();

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmedValue)) {
      return 'Name must contain only letters and spaces.';
    }

    if (trimmedValue.length < 2 || trimmedValue.length > 50) {
      return 'Name must be between 2 and 50 characters.';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required.';
    }

    String cleanPhone = value.replaceAll(RegExp(r'[^\d]'), '');

    if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(cleanPhone)) {
      return 'Phone number must be a valid Egyptian mobile number.';
    }

    if (cleanPhone.length < 10 || cleanPhone.length > 15) {
      return 'Phone number must be between 10 and 15 digits.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required.';
    }

    String trimmedValue = value.trim();

    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(trimmedValue)) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < 8 || value.length > 100) {
      return 'Password must be between 8 and 100 characters.';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter.';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter.';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number.';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }
}
