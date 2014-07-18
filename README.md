# Octopress Return Tag

Render Liquid variables with conditions and filters.

[![Build Status](https://travis-ci.org/octopress/return-tag.svg)](https://travis-ci.org/octopress/return-tag)
[![Gem Version](http://img.shields.io/gem/v/octopress-return-tag.svg)](https://rubygems.org/gems/octopress-return-tag)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://octopress.mit-license.org)

## Installation

Add this line to your application's Gemfile:

    gem 'octopress-return-tag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopress-return-tag

Next add it to your gems list in Jekyll's `_config.yml`

    gems:
      - octopress-return-tag

## Usage

Here's a simple example where you can see that it does the same thing as the standard liquid render braces `{{ }}`.

    {{ site.author }}                  //=> Bobby Tables
    {% return site.author %}           //=> Bobby Tables

    {{ site.author | upcase }}         //=> BOBBY TABLES
    {% return site.author | upcase %}  //=> BOBBY TABLES

Conditional returns.

    {% return "→ " if linkpost %}
    {% return "★ " unless linkpost %}
    {% return post.external-url || post.url %}
    {% return (post ? post.date : page.date ) | datetime | date_to_xmlschema %}

Why is this useful? Here's how you might add title markers for a linkpost blog.

    {% return (linkpost ? "→ " : "★ ") %}{{ post.title }}

Now here's what you'd have to do with standard liquid tags:

    {% if linkpost %}
      {% capture title %}→ {{ post.title}}{% endcapture %}
    {% else %}
      {% capture title %}★ {{ post.title }}{% endcapture %}
    {% endif %}
    {{ title }}

See how `if` and `capture` make it harder to read a template file? That's why the return tag exists.

## Contributing

1. Fork it ( https://github.com/octopress/return-tag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

