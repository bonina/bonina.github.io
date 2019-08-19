---
layout: page
title: Tech
---

{% for post in site.categories.Tech limit: 3 %}
  <article class="post">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
  </article>
{% endfor %}

<h1 class="post-title">Other articles</h1>
{% for post in site.categories.Tech limit: 10 offset: 3 %}
  <article class="post">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
  </article>
{% endfor %}
