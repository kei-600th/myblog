#!/usr/bin/env ruby

require 'date'
require 'fileutils'

def create_post(title:)
  # 現在の日付を取得
  today = Date.today
  
  # ファイル名とパスを生成
  filename = "#{today.strftime('%Y-%m-%d')}-#{title}.md"
  year_month_dir = "_posts/#{today.strftime('%Y/%m')}"
  full_path = "#{year_month_dir}/#{filename}"
  
  # ディレクトリが存在しない場合は作成
  FileUtils.mkdir_p(year_month_dir)
  
  # テンプレート内容を作成
  content = <<~CONTENT
---
layout: post
title: "#{title.split('-').map(&:capitalize).join(' ')}"
date: #{today.strftime('%Y-%m-%d')}
categories: blog
---
CONTENT
  
  # ファイルを作成
  File.write(full_path, content)
  puts "Created new post: #{full_path}"
end

# コマンドライン引数からタイトルを取得
if ARGV.empty?
  puts "Usage: ruby create_post.rb title"
  exit 1
end

create_post(title: ARGV[0])
