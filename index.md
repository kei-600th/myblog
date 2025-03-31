---
layout: default
title: ホーム
---

# 最近の投稿

<ul class="post-list">
  {% for post in site.posts %}
    <li>
      <span class="post-meta">{{ post.date | date: "%Y-%m-%d" }}</span>
      <h2>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      </h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
