class AppAdmin {
  const AppAdmin._();

  static const email = 'mauropam77@gmail.com';

  static bool canAccess(String? emailAddress) => emailAddress == email;
}
