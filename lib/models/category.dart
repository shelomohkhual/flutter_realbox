// Category Class and Const Variables
class Category {

  // Category Name (Or) Title
  final String title;  
  final String apiUrl;

  const Category({this.title, this.apiUrl});
}

// Create each category of news, Inside 'categoryList' List(Array) to able to map(Iterate) in TabBar & TabBarView
const List<Category> categoryList = const <Category> [
  const Category(
      title: 'Apple Articles',
      apiUrl: 'https://newsapi.org/v2/everything?q=apple&from=2019-09-06&to=2019-09-06&sortBy=popularity&apiKey=408d828c91d5494db91be95909bcec28'),

  const Category(
      title: 'US Top Articles',
      apiUrl: 'https://newsapi.org/v2/top-headlines?country=us&apiKey=408d828c91d5494db91be95909bcec28'),

  const Category(
      title: 'Wall Street Journal',
      apiUrl: 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=408d828c91d5494db91be95909bcec28'),

  const Category(
      title: 'Myanmar News',
      apiUrl: 'https://newsapi.org/v2/everything?domains=duwun.com.mm&apiKey=408d828c91d5494db91be95909bcec28'),
];
