# Kckstrt

## Helpers
### `asset_path`
```erb
<img src="<%= asset_path 'kckstrt.png' %>" alt="Kckstrt">
```

`asset_path` uses Sprockets’ `digest_path` to find the asset within `app/assets/(images|javascripts|stylesheets)`.

--
### `javascript_include_tag` & `stylesheet_link_tag`
```erb
<head>
  <title>Kckstrt</title>
  <%= stylesheet_link_tag :styles %>
  <%# => <link rel="stylesheet" href="/assets/styles.css"> %>
</head>
<body>
  <%= javascript_link_tag :scripts %>
  <%# => <script src="/assets/scripts.js"></script> %>
</body>
```

## Environments Setup
### Development
- [Sprockets][]

### Production
- Blissfully serves assets via [CloudFront][]
  - Compile once with sprockets on demand (first HTTP request on the asset).

[Sprockets]: https://github.com/sstephenson/sprockets
[CloudFront]: http://aws.amazon.com/cloudfront/
