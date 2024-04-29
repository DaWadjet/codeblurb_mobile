import 'package:codeblurb_mobile/utils/page_props.dart';

abstract class SortBy {
  static PageProps none({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      title: title,
      page: page,
      skills: skills,
      label: 'None',
    );
  }

  static PageProps mostPopular({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'popularity', ascending: false),
      title: title,
      page: page,
      skills: skills,
      label: 'Most Popular',
    );
  }

  static PageProps freshlyReleased({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'releaseDate', ascending: false),
      title: title,
      page: page,
      skills: skills,
      label: 'Freshly Released',
    );
  }

  static PageProps priceAscending({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'price', ascending: true),
      title: title,
      page: page,
      skills: skills,
      label: 'Price Ascending',
    );
  }

  static PageProps priceDescending({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'price', ascending: false),
      title: title,
      page: page,
      skills: skills,
      label: 'Price Descending',
    );
  }

  static PageProps highestRated({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'rating', ascending: false),
      title: title,
      page: page,
      skills: skills,
      label: 'Highest Rated',
    );
  }

  static PageProps titleAToZ({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'title', ascending: true),
      title: title,
      page: page,
      skills: skills,
      label: 'Title A to Z',
    );
  }

  static PageProps titleZToA({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'title', ascending: false),
      title: title,
      page: page,
      skills: skills,
      label: 'Title Z to A',
    );
  }

  static PageProps recentlyViewed({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'lastInteractedAt', ascending: false),
      title: title,
      page: page,
      skills: skills,
      label: 'Recently Viewed',
    );
  }

  static PageProps recentlyEnrolled({
    String title = '',
    int page = 0,
    List<String>? skills,
  }) {
    return PageProps(
      sort: Sort(property: 'enrolledAt', ascending: false),
      title: title,
      page: page,
      skills: skills,
      label: 'Recently Enrolled',
    );
  }
}
