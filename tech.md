---
layout: page
title: Tech
---

{% for post in site.categories.Tech %}
  <article class="post">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    {{ post.content }}
  </article>
{% endfor %}
