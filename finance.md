---
layout: page
title: Finance
---

{% for post in site.categories.Finance limit:10 %}
  <article class="post">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
  </article>
{% endfor %}
