---
layout: page
title: Web
sitemap: false
---

{% for post in site.categories.Web limit: 2 %}
  <article class="categories">
    <h1 class="post-title-categories" style="margin-bottom: 0rem;">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    <div class="post-categories" style="margin-top: 0.1rem;margin-bottom: 0.5rem;">
      {% include readtime.html %}
    </div>
    <a class="noa" href='{{ post.url }}'>{% assign nutshell = post.content | markdownify | newline_to_br | strip_newlines | replace: '<br />', ' ' | strip_html | split: '. ' | slice: 0, 3 %}
    {% for item in nutshell limit:2 %}{{ item | append: '. ' }}{% endfor %}
    {% for item in nutshell offset:2 limit:1 %}{{ item }}{% endfor %}</a>
    <a class="dothvr" href='{{ post.url }}'><span class="dot"></span><span class="dot dotc"></span><span class="dot"></span></a>
  </article>
{% endfor %}

<h1 class="page-title categories" style="margin-top: 2rem;margin-bottom: 1.5rem;">More articles</h1>
{% for post in site.categories.Web limit: 10 offset: 2 %}
  <article class="categories-categories">
    <h1 class="post-title">
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </h1>
    <div class="post-categories" style="margin-top: 0.1rem;margin-bottom: 0.5rem;">
      {% include readtime.html %}
    </div>
  </article>
{% endfor %}
