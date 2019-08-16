---
layout: page
title: Finance
---

{% assign cc = 1 %}
{% for post in site.categories.Finance limit:20 %}
  {% if ccle == 1}
    <article class="post" style="margin-top:1rem;">
      <h1 class="post-title">
        <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
      </h1>
    </article>
    {% assign ccle = ccle | plus: 1 %}
  {% endif %}
  <article class="post">
      <h1 class="post-title">
        <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
      </h1>
    </article>
{% endfor %}
