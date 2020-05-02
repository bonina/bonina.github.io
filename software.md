---
layout: page
title: Software
sitemap: false
---

{% for post in site.categories.Software limit: 2 %}
  <article class="categories">
    <h1 class="post-title-categories">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    <div class="post-categories" style="margin-top: 0rem;margin-bottom: 0.4rem;">
      {% include readtime.html %}
    </div>
    {% assign ncut = 250 %}
    {% assign words = post.content | strip_newlines | markdownify | strip_html | truncate: ncut, "" | number_of_words | decrement %}
    {{ post.content | strip_newlines | markdownify | strip_html | truncatewords: words, " " }}<a class="dothvr" href='{{ post.url }}'><span class="dot"></span><span class="dot dotc"></span><span class="dot"></span></a>
  </article>
{% endfor %}

<h1 class="page-title categories" style="margin-bottom: 1rem;">More articles</h1>
{% for post in site.categories.Software limit: 10 offset: 2 %}
  <article class="categories-categories">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    <div class="post-categories" style="margin-top: 0.1rem;margin-bottom: 0.5rem;">
      {% include readtime.html %}
    </div>
  </article>
{% endfor %}
