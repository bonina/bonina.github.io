---
layout: page
title: Hardware
sitemap: false
---

{% for post in site.categories.Hardware limit: 2 %}
  <article class="categories">
    <h1 class="post-title-categories" style="margin-bottom: 0rem;">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    <div class="post-categories" style="margin-top: 0.1rem;margin-bottom: 0.5rem;">
      {% include readtime.html %}
    </div>
    {% assign ncut = 250 %}
    {% assign words = post.content | strip_newlines | markdownify | strip_html | truncate: ncut, "" | number_of_words | decrement %}
    <a class="noa" href='{{ post.url }}'>{{ post.content | strip_newlines | markdownify | strip_html | truncatewords: words, " " }}</a><a class="dothvr" href='{{ post.url }}'><span class="dot"></span><span class="dot dotc"></span><span class="dot"></span></a>

    {{ post.content | markdownify | strip_html | split: '.' | slice: 0, 2 }}
    2

  </article>
{% endfor %}

<h1 class="page-title categories" style="margin-top: 2rem;margin-bottom: 1.5rem;">More articles</h1>
{% for post in site.categories.Hardware limit: 10 offset: 2 %}
  <article class="categories-categories">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    <div class="post-categories" style="margin-top: 0.1rem;margin-bottom: 0.5rem;">
      {% include readtime.html %}
    </div>
  </article>
{% endfor %}
