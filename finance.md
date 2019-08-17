---
layout: page
title: Finance
---


{% assign cc = 1 %}
{% for post in site.categories.Finance limit:20 %}
  {% if cc == 1 or cc == 2 or cc == 3 %}
    <article class="post"><h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h1>
      {% assign ncut = 500 %}
      {% assign words = post.content | strip_newlines | markdownify | strip_html | truncate: ncut, "" | number_of_words | decrement %}
      {{ post.content | strip_newlines | markdownify | strip_html | truncatewords: words }}
      <a href='{{ post.url }}'>read more</a></article>
    {% assign cc = cc | plus: 1 %}
  {% else %}
    <article class="post"><h1 class="post-title">
       <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1></article>
  {% endif %}
{% endfor %}
