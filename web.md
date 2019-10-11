---
layout: page
title: Web
sitemap: false
---

{% for post in site.categories.Web limit: 3 %}
  <article class="categories">
    <h1 class="post-title-categories">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    {% assign ncut = 500 %}
    {% assign words = post.content | strip_newlines | markdownify | strip_html | truncate: ncut, "" | number_of_words | decrement %}
    {{ post.content | strip_newlines | markdownify | strip_html | truncatewords: words, " " }}<a class="dothvr" href='{{ post.url }}'><span class="dot"></span><span class="dot dotc"></span><span class="dot"></span></a>
  </article>
{% endfor %}

<h1 class="page-title categories">Other articles</h1>
{% for post in site.categories.Web limit: 10 offset: 3 %}
  <article class="categories">
    <h1 class="post-title-categories">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
  </article>
{% endfor %}
