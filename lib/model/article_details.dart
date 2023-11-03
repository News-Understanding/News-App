import '../page/home/home_page.dart';

ItemArticleTopHeadlinesNewsResponseModel article1 = ItemArticleTopHeadlinesNewsResponseModel(
  source: ItemSourceTopHeadlinesNewsResponseModel(

    name: 'BBC News',
  ),
  author: 'John Doe',
  title: 'Breaking News: COVID-19 Vaccine Approved',
  description: 'The government has approved the emergency use of the COVID-19 vaccine.',
  url: 'https://www.bbc.com/news/covid19-vaccine',
  urlToImage: 'https://ichef.bbci.co.uk/news/976/cpsprodpb/15DC9/production/_114154598_gettyimages-1215274453.jpg',
  publishedAt: '2023-10-30T08:00:00Z',
  content: 'In a historic decision, the government has given the green light for the COVID-19 vaccine...',
);

ItemArticleTopHeadlinesNewsResponseModel article2 = ItemArticleTopHeadlinesNewsResponseModel(
  source: ItemSourceTopHeadlinesNewsResponseModel(

    name: 'CNN',
  ),
  author: 'Jane Smith',
  title: 'Tech Giant Unveils New Smartphone Model',
  description: 'The highly-anticipated smartphone features cutting-edge technology and a sleek design.',
  url: 'https://www.cnn.com/tech-giant-new-phone',
  urlToImage: 'https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F210802132015-02-google-pixel-6-pixel-6-pro-unveiling.jpg',
  publishedAt: '2023-10-30T09:30:00Z',
  content: 'The tech giant has unveiled its latest smartphone, which boasts impressive features...',
);

ItemArticleTopHeadlinesNewsResponseModel article3 = ItemArticleTopHeadlinesNewsResponseModel(
  source: ItemSourceTopHeadlinesNewsResponseModel(
    name: 'The New York Times',
  ),
  author: 'Alice Johnson',
  title: 'Environmental Conference Addresses Climate Change',
  description: 'World leaders gather to discuss urgent measures to combat climate change.',
  url: 'https://www.nytimes.com/climate-conference',
  urlToImage: 'https://static01.nyt.com/images/2023/03/20/climate/20cli-ipcc/20cli-ipcc-videoSixteenByNine3000-v4.jpg',
  publishedAt: '2023-10-30T10:45:00Z',
  content: 'The global climate conference brought together leaders from around the world...',
);

List<ItemArticleTopHeadlinesNewsResponseModel> realExampleArticles = [article1, article2, article3];
class ItemSourceTopHeadlinesNewsResponseModel {
  final String name;

  ItemSourceTopHeadlinesNewsResponseModel({required this.name});
}

class CategoryNewsModel {
  final String image;
  final String title;

  CategoryNewsModel({
    required this.image,
    required this.title,
  });

  @override
  List<Object> get props => [image, title];

  @override
  String toString() {
    return 'CategoryNewsModel{image: $image, title: $title}';
  }
}
final listCategories = <CategoryNewsModel>[
  CategoryNewsModel(image: '', title: 'All'),
  CategoryNewsModel(
      image: 'assets/images/img_business.png', title: 'Business'),
  CategoryNewsModel(
      image: 'assets/images/img_entertainment.png', title: 'Entertainment'),
  CategoryNewsModel(image: 'assets/images/img_health.png', title: 'Health'),
  CategoryNewsModel(image: 'assets/images/img_science.png', title: 'Science'),
  CategoryNewsModel(image: 'assets/images/img_sport.png', title: 'Sports'),
  CategoryNewsModel(
      image: 'assets/images/img_technology.png', title: 'Technology'),
];