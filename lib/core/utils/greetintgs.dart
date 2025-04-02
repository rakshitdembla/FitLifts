class Greetintgs {
  Greetintgs._();

  static String getGreetings() {
    int hour = DateTime.now().hour;

    if (hour >= 3 && hour < 12) {
      return 'Good Morning! ☀️';
    } else if (hour >= 12 && hour < 20) {
      return 'Good Afternoon! 🌤️';
    } else {
      return 'Good Evening! 🌙';
    }
  }
}
