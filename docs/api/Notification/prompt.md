---
layout: "docs_home"
version: "page.method"
versionHref: "/docs"
path: "notification/prompt/"
section_id: supersonic-js

title: "prompt"
header_sub_title: ""
---

{% assign methods = site.data.supersonic.notification.prompt %}

{% for method in methods %}

[View Source]({{method.source_link}})

# {{method.name}}

{{method.description}}

{% if method.usage %}
## Usage
{{method.usage}}
{% endif %}

{% if method.params.size > 0 %}
## Params
{% for param in method.params %}
  <strong>{{param.name}} [<em>{{param.types}}</em>]</strong>
  <ul>
  <li>{{param.description}}</li>
  </ul>

{% endfor %}
{% endif %}

{% if method.returns %}
## Returns
<strong>{{method.returns.types}}</strong>
<ul>
<li>{{method.returns.description}}</li>
</ul>
{% endif %}
{% endfor %}