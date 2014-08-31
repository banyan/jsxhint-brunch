# jsxhint-brunch

Adds [JSXHint](https://github.com/STRML/JSXHint) support to [brunch](http://brunch.io).

## Install

Install the plugin via npm with `npm install --save jsxhint-brunch`.

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