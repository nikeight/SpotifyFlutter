class MusicResponse {
  final Feed? feed;

  MusicResponse({
    this.feed,
  });

  MusicResponse.fromJson(Map<String, dynamic> json)
      : feed = (json['feed'] as Map<String,dynamic>?) != null ? Feed.fromJson(json['feed'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'feed' : feed?.toJson()
  };
}

class Feed {
  final Author? author;
  final List<Entry>? entry;
  final Updated? updated;
  final FeedRights? rights;
  final FeedTitle? title;
  final Icon? icon;
  final List<FeedLink>? link;
  final FeedId? id;

  Feed({
    this.author,
    this.entry,
    this.updated,
    this.rights,
    this.title,
    this.icon,
    this.link,
    this.id,
  });

  Feed.fromJson(Map<String, dynamic> json)
      : author = (json['author'] as Map<String,dynamic>?) != null ? Author.fromJson(json['author'] as Map<String,dynamic>) : null,
        entry = (json['entry'] as List?)?.map((dynamic e) => Entry.fromJson(e as Map<String,dynamic>)).toList(),
        updated = (json['updated'] as Map<String,dynamic>?) != null ? Updated.fromJson(json['updated'] as Map<String,dynamic>) : null,
        rights = (json['rights'] as Map<String,dynamic>?) != null ? FeedRights.fromJson(json['rights'] as Map<String,dynamic>) : null,
        title = (json['title'] as Map<String,dynamic>?) != null ? FeedTitle.fromJson(json['title'] as Map<String,dynamic>) : null,
        icon = (json['icon'] as Map<String,dynamic>?) != null ? Icon.fromJson(json['icon'] as Map<String,dynamic>) : null,
        link = (json['link'] as List?)?.map((dynamic e) => FeedLink.fromJson(e as Map<String,dynamic>)).toList(),
        id = (json['id'] as Map<String,dynamic>?) != null ? FeedId.fromJson(json['id'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'author' : author?.toJson(),
    'entry' : entry?.map((e) => e.toJson()).toList(),
    'updated' : updated?.toJson(),
    'rights' : rights?.toJson(),
    'title' : title?.toJson(),
    'icon' : icon?.toJson(),
    'link' : link?.map((e) => e.toJson()).toList(),
    'id' : id?.toJson()
  };
}

class Author {
  final Name? name;
  final Uri? uri;

  Author({
    this.name,
    this.uri,
  });

  Author.fromJson(Map<String, dynamic> json)
      : name = (json['name'] as Map<String,dynamic>?) != null ? Name.fromJson(json['name'] as Map<String,dynamic>) : null,
        uri = (json['uri'] as Map<String,dynamic>?) != null ? Uri.fromJson(json['uri'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'name' : name?.toJson(),
    'uri' : uri?.toJson()
  };
}

class Name {
  final String? label;

  Name({
    this.label,
  });

  Name.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class Uri {
  final String? label;

  Uri({
    this.label,
  });

  Uri.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class Entry {
  final Imname? imname;
  final List<Imimage>? imimage;
  final ImitemCount? imitemCount;
  final Imprice? imprice;
  final EntryImcontentType? imcontentType;
  final EntryRights? rights;
  final EntryTitle? title;
  final EntryLink? link;
  final EntryId? id;
  final Imartist? imartist;
  final Category? category;
  final ImreleaseDate? imreleaseDate;

  Entry({
    this.imname,
    this.imimage,
    this.imitemCount,
    this.imprice,
    this.imcontentType,
    this.rights,
    this.title,
    this.link,
    this.id,
    this.imartist,
    this.category,
    this.imreleaseDate,
  });

  Entry.fromJson(Map<String, dynamic> json)
      : imname = (json['im:name'] as Map<String,dynamic>?) != null ? Imname.fromJson(json['im:name'] as Map<String,dynamic>) : null,
  imimage = (json['im:image'] as List?)?.map((dynamic e) => Imimage.fromJson(e as Map<String,dynamic>)).toList(),
  imitemCount = (json['im:itemCount'] as Map<String,dynamic>?) != null ? ImitemCount.fromJson(json['im:itemCount'] as Map<String,dynamic>) : null,
  imprice = (json['im:price'] as Map<String,dynamic>?) != null ? Imprice.fromJson(json['im:price'] as Map<String,dynamic>) : null,
  imcontentType = (json['im:contentType'] as Map<String,dynamic>?) != null ? EntryImcontentType.fromJson(json['im:contentType'] as Map<String,dynamic>) : null,
  rights = (json['rights'] as Map<String,dynamic>?) != null ? EntryRights.fromJson(json['rights'] as Map<String,dynamic>) : null,
  title = (json['title'] as Map<String,dynamic>?) != null ? EntryTitle.fromJson(json['title'] as Map<String,dynamic>) : null,
  link = (json['link'] as Map<String,dynamic>?) != null ? EntryLink.fromJson(json['link'] as Map<String,dynamic>) : null,
  id = (json['id'] as Map<String,dynamic>?) != null ? EntryId.fromJson(json['id'] as Map<String,dynamic>) : null,
  imartist = (json['im:artist'] as Map<String,dynamic>?) != null ? Imartist.fromJson(json['im:artist'] as Map<String,dynamic>) : null,
  category = (json['category'] as Map<String,dynamic>?) != null ? Category.fromJson(json['category'] as Map<String,dynamic>) : null,
  imreleaseDate = (json['im:releaseDate'] as Map<String,dynamic>?) != null ? ImreleaseDate.fromJson(json['im:releaseDate'] as Map<String,dynamic>) : null
  ;

  Map<String, dynamic> toJson() => {
  'im:name' : imname?.toJson(),
  'im:image' : imimage?.map((e) => e.toJson()).toList(),
  'im:itemCount' : imitemCount?.toJson(),
  'im:price' : imprice?.toJson(),
  'im:contentType' : imcontentType?.toJson(),
  'rights' : rights?.toJson(),
  'title' : title?.toJson(),
  'link' : link?.toJson(),
  'id' : id?.toJson(),
  'im:artist' : imartist?.toJson(),
  'category' : category?.toJson(),
  'im:releaseDate' : imreleaseDate?.toJson()
};
}

class Imname {
final String? label;

Imname({
  this.label,
});

Imname.fromJson(Map<String, dynamic> json)
: label = json['label'] as String?;

Map<String, dynamic> toJson() => {
  'label' : label
};
}

class Imimage {
final String? label;
final ImimageAttributes? attributes;

Imimage({
  this.label,
  this.attributes,
});

Imimage.fromJson(Map<String, dynamic> json)
: label = json['label'] as String?,
attributes = (json['attributes'] as Map<String,dynamic>?) != null ? ImimageAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

Map<String, dynamic> toJson() => {
  'label' : label,
  'attributes' : attributes?.toJson()
};
}

class ImimageAttributes {
  final String? height;

  ImimageAttributes({
    this.height,
  });

  ImimageAttributes.fromJson(Map<String, dynamic> json)
      : height = json['height'] as String?;

  Map<String, dynamic> toJson() => {
    'height' : height
  };
}

class ImitemCount {
final String? label;

ImitemCount({
  this.label,
});

ImitemCount.fromJson(Map<String, dynamic> json)
: label = json['label'] as String?;

Map<String, dynamic> toJson() => {
  'label' : label
};
}

class Imprice {
final String? label;
final ImpriceAttributes? attributes;

Imprice({
  this.label,
  this.attributes,
});

Imprice.fromJson(Map<String, dynamic> json)
: label = json['label'] as String?,
attributes = (json['attributes'] as Map<String,dynamic>?) != null ? ImpriceAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

Map<String, dynamic> toJson() => {
  'label' : label,
  'attributes' : attributes?.toJson()
};
}

class ImpriceAttributes {
  final String? amount;
  final String? currency;

  ImpriceAttributes({
    this.amount,
    this.currency,
  });

  ImpriceAttributes.fromJson(Map<String, dynamic> json)
      : amount = json['amount'] as String?,
        currency = json['currency'] as String?;

  Map<String, dynamic> toJson() => {
    'amount' : amount,
    'currency' : currency
  };
}

class EntryImcontentType {
final EntryImcontentType? imcontentType;
final EntryImcontentTypeAttributes? attributes;

EntryImcontentType({
  this.imcontentType,
  this.attributes,
});

EntryImcontentType.fromJson(Map<String, dynamic> json)
: imcontentType = (json['im:contentType'] as Map<String,dynamic>?) != null ? EntryImcontentType.fromJson(json['im:contentType'] as Map<String,dynamic>) : null,
attributes = (json['attributes'] as Map<String,dynamic>?) != null ? EntryImcontentTypeAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

Map<String, dynamic> toJson() => {
'im:contentType' : imcontentType?.toJson(),
'attributes' : attributes?.toJson()
};
}

class ImcontentType {
final ImcontentTypeAttributes? attributes;

ImcontentType({
  this.attributes,
});

ImcontentType.fromJson(Map<String, dynamic> json)
: attributes = (json['attributes'] as Map<String,dynamic>?) != null ? ImcontentTypeAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

Map<String, dynamic> toJson() => {
  'attributes' : attributes?.toJson()
};
}

class EntryImcontentTypeAttributes {
  final String? term;
  final String? label;

  EntryImcontentTypeAttributes({
    this.term,
    this.label,
  });

  EntryImcontentTypeAttributes.fromJson(Map<String, dynamic> json)
      : term = json['term'] as String?,
        label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'term' : term,
    'label' : label
  };
}

class ImcontentTypeAttributes {
  final String? term;
  final String? label;

  ImcontentTypeAttributes({
    this.term,
    this.label,
  });

  ImcontentTypeAttributes.fromJson(Map<String, dynamic> json)
      : term = json['term'] as String?,
        label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'term' : term,
    'label' : label
  };
}

class FeedRights {
  final String? label;

  FeedRights({
    this.label,
  });

  FeedRights.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class FeedTitle {
  final String? label;

  FeedTitle({
    this.label,
  });

  FeedTitle.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class FeedLink {
  final LinkAttributes? attributes;

  FeedLink({
    this.attributes,
  });

  FeedLink.fromJson(Map<String, dynamic> json)
      : attributes = (json['attributes'] as Map<String,dynamic>?) != null ? LinkAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'attributes' : attributes?.toJson()
  };
}

class LinkAttributes {
  final String? rel;
  final String? type;
  final String? href;

  LinkAttributes({
    this.rel,
    this.type,
    this.href,
  });

  LinkAttributes.fromJson(Map<String, dynamic> json)
      : rel = json['rel'] as String?,
        type = json['type'] as String?,
        href = json['href'] as String?;

  Map<String, dynamic> toJson() => {
    'rel' : rel,
    'type' : type,
    'href' : href
  };
}

class FeedId {
  final String? label;
  final IdAttributes? attributes;

  FeedId({
    this.label,
    this.attributes,
  });

  FeedId.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?,
        attributes = (json['attributes'] as Map<String,dynamic>?) != null ? IdAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'label' : label,
    'attributes' : attributes?.toJson()
  };
}

class IdAttributes {
  final String? imid;

  IdAttributes({
    this.imid,
  });

  IdAttributes.fromJson(Map<String, dynamic> json)
      : imid = json['im:id'] as String?;

  Map<String, dynamic> toJson() => {
  'im:id' : imid
};
}

class Imartist {
final String? label;
final ImartistAttributes? attributes;

Imartist({
  this.label,
  this.attributes,
});

Imartist.fromJson(Map<String, dynamic> json)
: label = json['label'] as String?,
attributes = (json['attributes'] as Map<String,dynamic>?) != null ? ImartistAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

Map<String, dynamic> toJson() => {
  'label' : label,
  'attributes' : attributes?.toJson()
};
}

class ImartistAttributes {
  final String? href;

  ImartistAttributes({
    this.href,
  });

  ImartistAttributes.fromJson(Map<String, dynamic> json)
      : href = json['href'] as String?;

  Map<String, dynamic> toJson() => {
    'href' : href
  };
}

class Category {
  final CategoryAttributes? attributes;

  Category({
    this.attributes,
  });

  Category.fromJson(Map<String, dynamic> json)
      : attributes = (json['attributes'] as Map<String,dynamic>?) != null ? CategoryAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'attributes' : attributes?.toJson()
  };
}

class CategoryAttributes {
  final String? imid;
  final String? term;
  final String? scheme;
  final String? label;

  CategoryAttributes({
    this.imid,
    this.term,
    this.scheme,
    this.label,
  });

  CategoryAttributes.fromJson(Map<String, dynamic> json)
      : imid = json['im:id'] as String?,
  term = json['term'] as String?,
  scheme = json['scheme'] as String?,
  label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
  'im:id' : imid,
  'term' : term,
  'scheme' : scheme,
  'label' : label
};
}

class ImreleaseDate {
final String? label;
final ImreleaseDateAttributes? attributes;

ImreleaseDate({
  this.label,
  this.attributes,
});

ImreleaseDate.fromJson(Map<String, dynamic> json)
: label = json['label'] as String?,
attributes = (json['attributes'] as Map<String,dynamic>?) != null ? ImreleaseDateAttributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

Map<String, dynamic> toJson() => {
  'label' : label,
  'attributes' : attributes?.toJson()
};
}

class ImreleaseDateAttributes {
  final String? label;

  ImreleaseDateAttributes({
    this.label,
  });

  ImreleaseDateAttributes.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class Updated {
  final String? label;

  Updated({
    this.label,
  });

  Updated.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class EntryRights {
  final String? label;

  EntryRights({
    this.label,
  });

  EntryRights.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class EntryTitle {
  final String? label;

  EntryTitle({
    this.label,
  });

  EntryTitle.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class Icon {
  final String? label;

  Icon({
    this.label,
  });

  Icon.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}

class EntryLink {
  final Attributes? attributes;

  EntryLink({
    this.attributes,
  });

  EntryLink.fromJson(Map<String, dynamic> json)
      : attributes = (json['attributes'] as Map<String,dynamic>?) != null ? Attributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'attributes' : attributes?.toJson()
  };
}

class Attributes {
  final String? rel;
  final String? type;
  final String? href;

  Attributes({
    this.rel,
    this.type,
    this.href,
  });

  Attributes.fromJson(Map<String, dynamic> json)
      : rel = json['rel'] as String?,
        type = json['type'] as String?,
        href = json['href'] as String?;

  Map<String, dynamic> toJson() => {
    'rel' : rel,
    'type' : type,
    'href' : href
  };
}

class EntryId {
  final String? label;

  EntryId({
    this.label,
  });

  EntryId.fromJson(Map<String, dynamic> json)
      : label = json['label'] as String?;

  Map<String, dynamic> toJson() => {
    'label' : label
  };
}
