# test-grape-api

## Gems

* [grape](https://github.com/ruby-grape/grape) API 框架
* [grape-swagger](https://github.com/ruby-grape/grape-swagger) API 文件產生器
* [swagger-ui](https://github.com/swagger-api/swagger-ui) API 文件瀏覽前端
* [vienna](https://github.com/kmikael/vienna) 簡單設定讓 Rack 處理public 靜態文件

## config.ru 範例

```ruby
require 'bundler/setup'
Bundler.require

require "vienna"
require "grape"
require "grape-swagger"
require_relative "twitter/api.rb"

module API
  class Root < Grape::API
    format :json

    # CORS
    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    mount Twitter::API
    add_swagger_documentation
  end
end

# 除了API 還要跑 public 下的靜態檔案
run Rack::Cascade.new [API::Root, Vienna]
```

## Swagger UI

從[swagger-ui](https://github.com/swagger-api/swagger-ui) 下載壓縮檔

把 `swagger-ui/dist` 下的檔案複製到專案 `public` 下

打開 `index.html` 將

```javascript
if (url && url.length > 1) {
  url = decodeURIComponent(url[1]);
} else {
  url = "http://petstore.swagger.io/v2/swagger.json";
}
```

修改成

```javascript
 if (url && url.length > 1) {
   url = decodeURIComponent(url[1]);
 } else {
   url = "http://localhost:9292/swagger_doc.json";
 }
 ```
```

## Execute

Run command:

```bash
bundle exec rackup
```