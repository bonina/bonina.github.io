---
layout: page
title: Finance
---

{% for post in site.categories.Finance %}
  <article class="post">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    {{ post.content }}
  </article>
{% endfor %}
