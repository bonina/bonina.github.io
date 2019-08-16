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
    {% assign ccle = ccle | plus: 1 %}
  {% endif %}
  <article class="post">
      <h1 class="post-title">
        <a href="{{ post.url }}">{{ post.title }}</a>
      </h1>
    </article>
{% endfor %}
