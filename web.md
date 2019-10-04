---
layout: page
title: Web
sitemap: false
---

{% for post in site.categories.Web limit: 3 %}
  <article class="post-categories categories-page">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    {% assign ncut = 500 %}
    {% assign words = post.content | strip_newlines | markdownify | strip_html | truncate: ncut, "" | number_of_words | decrement %}
    {{ post.content | strip_newlines | markdownify | strip_html | truncatewords: words }}
    <div>
      <a href='{{ post.url }}'>read more</a>
    </div>
  </article>
{% endfor %}

<h1 class="page-title categories-page">Other articles</h1>
{% for post in site.categories.Web limit: 10 offset: 3 %}
  <article class="post-categories">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
  </article>
{% endfor %}
