class Article {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  Article({
    this.status,
    this.totalResults,
    this.articles,
  });

  Article.fromJson(Map<String, dynamic> json) {
    status = json['status'] as String?;
    totalResults = json['totalResults'] as int?;
    articles = (json['articles'] as List?)?.map((dynamic e) => Articles.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['totalResults'] = totalResults;
    json['articles'] = articles?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  dynamic content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    source = (json['source'] as Map<String,dynamic>?) != null ? Source.fromJson(json['source'] as Map<String,dynamic>) : null;
    author = json['author'] as String?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    url = json['url'] as String?;
    urlToImage = json['urlToImage'] as String?;
    publishedAt = json['publishedAt'] as String?;
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['source'] = source?.toJson();
    json['author'] = author;
    json['title'] = title;
    json['description'] = description;
    json['url'] = url;
    json['urlToImage'] = urlToImage;
    json['publishedAt'] = publishedAt;
    json['content'] = content;
    return json;
  }
}

class Source {
  dynamic id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}