---
layout: page
title: Health
---

{% assign cc = 1 %}
{% for post in site.categories.Health limit:20 %}
  {% if cc == 1 or cc == 2 or cc == 3 %}
    <article class="post"><h1>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </h1>
      {% assign ncut = 500 %}
      {% assign words = post.content | strip_newlines | markdownify | strip_html | truncate: ncut, "" | number_of_words | decrement %}
      {{ post.content | strip_newlines | markdownify | strip_html | truncatewords: words }}
    <div>
      <a href='{{ post.url }}'>read more</a>
    </div></article>
    {% assign cc = cc | plus: 1 %}
  {% else %}
    <article class="post"><h1>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </h1></article>
  {% endif %}
{% endfor %}
