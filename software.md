---
layout: page
title: Software
sitemap: false
---

{% for post in site.categories.Software limit: 3 %}
  <article class="post-categories">
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

<h1 class="page-title">Other articles</h1>
{% for post in site.categories.Software limit: 10 offset: 3 %}
  <article class="post-categories">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
  </article>
{% endfor %}
