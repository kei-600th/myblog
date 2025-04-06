---
layout: post
title: "cloudflareworkers ハンズオン"
date: 2025-04-03
categories: blog
published: false
---

この記事ではcloudflareworkersで簡単なfaasの作り方をハンズオン形式で紹介します

## faasとは？

faasとは、function as a serviceの略で、関数をサービスとして提供するものです。



## 今回作成するアプリの構成

![アプリケーション構成図](/myblog/assets/images/cloudflare-diagram.png)

## 作り方

```typescript

// index.ts
interface Env {
  SLACK_WEBHOOK_URL: string;
}

export default {
  async fetch(
    request: Request,
    env: Env,
    ctx: ExecutionContext
  ): Promise<Response> {
    const payload = {
      text: "Hello world!",
    };

    try {
      await fetch(env.SLACK_WEBHOOK_URL, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(payload),
      });

      return new Response("Message sent!");
    } catch (error: any) {
      return new Response(`Error: ${error.message}`, { status: 500 });
    }
  },
};


```






