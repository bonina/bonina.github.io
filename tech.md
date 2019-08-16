---
layout: page
title: Tech
---

{% assign cc = 1 %}
{% for post in site.categories.Tech limit:20 %}
  {% if ccle == 1}
      <h1 class="post-title">
        <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
      </h1>
    {% assign ccle = ccle | plus: 1 %}
  {% endif %}
  <article class="post">
      <h1 class="post-title">
        <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
      </h1>
    </article>
{% endfor %}
