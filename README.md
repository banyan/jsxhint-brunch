# jsxhint-brunch [![Build Status](https://travis-ci.org/travis-ci/travis-api.svg?branch=master)](https://travis-ci.org/travis-ci/travis-api)

Adds [JSXHint](https://github.com/STRML/JSXHint) support to [brunch](http://brunch.io).

## Install

```
npm install --save jsxhint # currently it depends on cli
npm install --save jsxhint-brunch
```

## Option

```coffeescript
config =
  plugins:
    jsxhint:
      pattern: /^app\/.*\.jsx?$/
      warnOnly: yes
      configFile: '.jshintrc'
```

Every sub-option (`pattern`, `warnOnly`, `configFile`) is optional.

#### Default

<table>
  <tr>
    <th>jsxhint.pattern</th>
    <td>/^app\/.*\.jsx?$/</td>
  </tr>
  <tr>
    <th>jsxhint.warnOnly</th>
    <td>yes</td>
  </tr>
  <tr>
    <th>jsxhint.configFile</th>
    <td>.jshintrc</td>
  </tr>
</table>

## License

Licensed under the [MIT license](jsxhint-brunch/blob/master/LICENSE-MIT).
