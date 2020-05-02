---
layout: page
title: Software
sitemap: false
---

{% for post in site.categories.Software limit: 2 %}
  <article class="categories">
    <h1 class="post-title-categories">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>{% include readtime.html %}
    {% assign ncut = 250 %}
    {% assign words = post.content | strip_newlines | markdownify | strip_html | truncate: ncut, "" | number_of_words | decrement %}
    {{ post.content | strip_newlines | markdownify | strip_html | truncatewords: words, " " }}<a class="dothvr" href='{{ post.url }}'><span class="dot"></span><span class="dot dotc"></span><span class="dot"></span></a>
  </article>
{% endfor %}

<h1 class="page-title categories">Other articles</h1>
{% for post in site.categories.Software limit: 10 offset: 2 %}
  <article class="categories-categories">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    {% include readtime.html %}
  </article>
{% endfor %}
