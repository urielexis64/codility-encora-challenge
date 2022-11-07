class Review {
  Review({
    required this.displayTitle,
    required this.mpaaRating,
    required this.criticsPick,
    required this.byline,
    required this.headline,
    required this.summaryShort,
    required this.publicationDate,
    required this.openingDate,
    required this.dateUpdated,
    required this.link,
    required this.multimedia,
  });

  final String displayTitle;
  final String mpaaRating;
  final int criticsPick;
  final String byline;
  final String headline;
  final String summaryShort;
  final DateTime publicationDate;
  final DateTime? openingDate;
  final DateTime dateUpdated;
  final Link link;
  final Multimedia multimedia;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        displayTitle: json["display_title"],
        mpaaRating: json["mpaa_rating"],
        criticsPick: json["critics_pick"],
        byline: json["byline"],
        headline: json["headline"],
        summaryShort: json["summary_short"],
        publicationDate: DateTime.parse(json["publication_date"]),
        openingDate: json["opening_date"] == null
            ? null
            : DateTime.parse(json["opening_date"]),
        dateUpdated: DateTime.parse(json["date_updated"]),
        link: Link.fromJson(json["link"]),
        multimedia: Multimedia.fromJson(json["multimedia"]),
      );

  Map<String, dynamic> toJson() => {
        "display_title": displayTitle,
        "mpaa_rating": mpaaRating,
        "critics_pick": criticsPick,
        "byline": byline,
        "headline": headline,
        "summary_short": summaryShort,
        "publication_date":
            "${publicationDate.year.toString().padLeft(4, '0')}-${publicationDate.month.toString().padLeft(2, '0')}-${publicationDate.day.toString().padLeft(2, '0')}",
        "opening_date": openingDate == null
            ? null
            : "${openingDate!.year.toString().padLeft(4, '0')}-${openingDate!.month.toString().padLeft(2, '0')}-${openingDate!.day.toString().padLeft(2, '0')}",
        "date_updated": dateUpdated.toIso8601String(),
        "link": link.toJson(),
        "multimedia": multimedia.toJson(),
      };
}

class Link {
  Link({
    required this.type,
    required this.url,
    required this.suggestedLinkText,
  });

  final String type;
  final String url;
  final String suggestedLinkText;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        type: json["type"],
        url: json["url"],
        suggestedLinkText: json["suggested_link_text"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
        "suggested_link_text": suggestedLinkText,
      };
}

class Multimedia {
  Multimedia({
    required this.type,
    required this.src,
    required this.height,
    required this.width,
  });

  final String type;
  final String src;
  final int height;
  final int width;

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        type: json['type'],
        src: json["src"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "src": src,
        "height": height,
        "width": width,
      };
}
