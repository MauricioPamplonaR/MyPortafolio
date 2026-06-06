class AppContact {
  const AppContact._();

  static const portfolioUrl = 'https://my-portafolio-922dc.web.app';
  static const email = 'mauropam77@gmail.com';
  static const whatsappPhone = '573014836962';
  static const whatsappMessage =
      'Hola Mauricio, vi tu portafolio y quiero hablar contigo sobre un proyecto Flutter.';

  static const youtubeUrl = 'https://www.youtube.com/@mauriciopamplona1173';
  static const instagramUrl = 'https://www.instagram.com/mauricio_pamplona_s';
  static const githubUrl = 'https://github.com/MauricioPamplonaR';
  static const linkedinUrl =
      'https://www.linkedin.com/in/mauricio-pamplona-778339193/';

  static Uri get whatsappUri =>
      Uri.https('wa.me', '/$whatsappPhone', {'text': whatsappMessage});

  static Uri get emailUri => Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {'subject': 'Contacto desde portafolio'},
  );
}
