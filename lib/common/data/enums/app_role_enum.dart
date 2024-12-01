enum AppRoleEnum {
  admin("admin"),
  user("user");


  const AppRoleEnum(this.value);
  final String value;

  static AppRoleEnum fromString(String value) {
    switch (value) {
      case "admin":
        return AppRoleEnum.admin;
      case "user":
        return AppRoleEnum.user;
      default:
        return AppRoleEnum.user;
    }
  }

}