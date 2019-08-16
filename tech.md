---
layout: page
title: Tech
---

{% assign cc = 1 %}
{% for post in site.categories.Tech limit:20 %}
  {% if ccle == 1 or ccle == 2 or ccle == 3 }
    <h1 class="post-title">
      <a href="{{ post.url }}">{{ post.title }}</a>
    </h1>
      {% assign ncut = 500 %}
      {% assign words = post.content | strip_newlines | markdownify | strip_html | truncate: ncut, "" | number_of_words | decrement %}
      {{ post.content | strip_newlines | markdownify | strip_html | truncatewords: words }}
    <div>
      <a href='{{ post.url }}'>read more</a>
    </div>
    {% assign ccle = ccle | plus: 1 %}
  {% else %}
    <h1 class="post-title">
      <a href="{{ post.url }}">{{ post.title }}</a>
    </h1>
  {% endif %}
{% endfor %}
