class OnBoard{
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
  static final List<OnBoard> onboard_data = [
    OnBoard(
        image: 'assets/images/eating-healthy.png',
        title: 'Eat Healthy',
        description: 'Maintaining good health should be the primary focus of everyone.'
    ),
    OnBoard(
      image: 'assets/images/cooking-healthy.png',
      title: 'Get Customized Recipes',
      description: 'Get thousands of healthy, customized recipes using AI',
    ),
    OnBoard(
        image: 'assets/images/track-food.png',
        title: 'Track Your Food Habit',
        description: 'With amazing inbuilt tools you can track your food habits.'
    ),
  ];
}
