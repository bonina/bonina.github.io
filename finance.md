---
layout: page
title: Finance
---

{% for post in site.categories.Finance %}
    <article class="post"><h1>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </h1></article>
{% endfor %}
