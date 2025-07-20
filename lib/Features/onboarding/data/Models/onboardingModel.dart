class Onboardingmodel {
  final String image;
  final String title;
  final String description;
  Onboardingmodel({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboardingmodel> onboardingPages = [
  Onboardingmodel(
    image: 'assets/images/on1.jpg',
    title: 'Explore Our New Collection',
    description:
        'Dive into our curated collections featuring the latest fashion trends.',
  ),
  Onboardingmodel(
    image: 'assets/images/on2.jpg',
    title: 'Craft Your Style  With Us',
    description:
        'Trusted by millions of people around the world, giving luxury in all form.',
  ),
  Onboardingmodel(
    image: 'assets/images/on3.jpg',
    title: 'Enjoy Virtual Try- OnsFor Your Style',
    description: 'Try out your preferred outfit from the comfort of your home',
  ),
];
