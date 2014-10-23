{% assign method = include.method %}
## API Reference: {{method.apiCall}}{% if method.function %}(){% endif %}

{{method.description}}

### Basic usage CoffeeScript
```coffeescript
{{method.usageCoffeeScript}}
```
### Basic usage JavaScript
```javascript
{{method.usageJavaScript}}
```

{% if method.type %}
### Type Signature
```coffeescript
{{method.type}}
```
{% endif %}

{% if method.params.size > 0 %}
#### Params
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Default value</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
  {% for param in method.params %}
  <tr>
    <td>{{param.name}}</td>
    <td class="highlight">
      <code class="language-coffeescript" data-lang="coffeescript">
      {{param.type | xml_escape}}
      </code>
    </td>
    <td class="highlight">
      <code class="language-coffeescript" data-lang="coffeescript">
      {{param.defaultValue}}
      </code>
    </td>
    <td>{{param.description}}</td>
  </tr>
    {% for property in param.properties %}
      <tr>
        <td class="property">{{property.name}}</td>
        <td class="highlight">
          <code class="language-coffeescript" data-lang="coffeescript">
          {{property.type | xml_escape}}
          </code>
        </td>
        <td class="highlight">
          <code class="language-coffeescript" data-lang="coffeescript">
          {{property.defaultValue}}
          </code>
        </td>
        <td>{{property.description | markdownify}}</td>
      </tr>
    {% endfor %}
  {% endfor %}
</table>
{% endif %}


{% if method.returnsDescription %}
#### Returns
{{ method.returnsDescription | markdownify }}

{% if method.returns.size > 0 %}
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
  {% for return in method.returns %}
    <tr>
      <td>{{return.name}}</td>
      <td class="highlight">
        <code class="language-coffeescript" data-lang="coffeescript">
        {{return.type | xml_escape}}
        </code>
      </td>
      <td>{{return.description | markdownify}}</td>
    </tr>
    {% for property in return.properties %}
      <tr>
        <td class="property">{{property.name}}</td>
        <td class="highlight">
          <code class="language-coffeescript" data-lang="coffeescript">
          {{property.type | xml_escape}}
          </code>
        </td>
        <td>{{property.description | markdownify}}</td>
      </tr>
    {% endfor %}
  {% endfor %}
</table>
{% endif %}
{% endif %}

### Full example CoffeeScript
```coffeescript
{{method.exampleCoffeeScript}}
```
### Full example JavaScript
```javascript
{{method.exampleJavaScript}}
```