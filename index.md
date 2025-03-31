---
layout: default
title: ホーム
---

<h1 class="text-3xl font-bold text-gray-900 mb-8">最近の投稿</h1>

<div class="space-y-8">
  {% for post in site.posts %}
    <article class="border-b border-gray-200 pb-8 last:border-b-0">
      <time class="text-sm text-gray-500">{{ post.date | date: "%Y-%m-%d" }}</time>
      <h2 class="mt-2 text-2xl font-semibold">
        <a href="{{ post.url | relative_url }}" class="text-gray-900 hover:text-blue-600">{{ post.title }}</a>
      </h2>
      <div class="mt-3 text-gray-600 prose">
        {{ post.excerpt }}
      </div>
      <a href="{{ post.url | relative_url }}" class="mt-4 inline-block text-blue-600 hover:text-blue-800">
        続きを読む →
      </a>
    </article>
  {% endfor %}
</div>
