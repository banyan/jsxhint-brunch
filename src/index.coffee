_    = require 'lodash'
fs   = require 'fs'
exec = require 'sync-exec'
path = require 'path'

formatError = (error) ->
  _.chain(error.split('\n'))
    .compact()
    .reject((row) -> /^\d+\serrors?$/.test(row))
    .value()
    .join('\n')

module.exports = class JsxhintLinter
  brunchPlugin: yes
  type: 'javascript'
  extension: 'jsx'

  constructor: (@config) ->
    config = @config?.plugins?.jsxhint or {}
    @warnOnly = config?.warnOnly ? yes
    configFile = path.join process.cwd(), config?.configFile or ".jshintrc"
    @pattern = config?.pattern or /^app\/.*\.jsx?$/

    @command = "jsxhint"
    try # read settings from .jshintrc file if exists
      stats = fs.statSync(configFile)
      @command += " -c #{configFile}" if stats.isFile()
    catch e
      e = e.toString().replace "Error: ENOENT, ", ""
      console.warn ".jshintrc parsing error: #{e}. jsxhint will run with default options."

  lint: (data, path, callback) ->
    result = exec "#{@command} #{path}"

    if result.status is 0
      callback()
    else
      error = formatError result.stdout
      error = "warn: #{error}" if @warnOnly
      callback error
