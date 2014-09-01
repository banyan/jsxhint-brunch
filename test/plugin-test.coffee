describe "Plugin", ->
  beforeEach ->
    @plugin = new Plugin {}

  it "should be an object", ->
    expect(@plugin).to.be.ok

  it "should has #lint method", ->
    expect(@plugin.lint).to.be.an.instanceof(Function)

  it "should lint correctly", (done) ->
    @plugin.lint "", "#{process.cwd()}/test/fixtures/valid.js", (error) ->
      expect(error).to.be.undefined
      done()

  it "should lint correctly with jsx", (done) ->
    @plugin.lint "", "#{process.cwd()}/test/fixtures/valid.jsx", (error) ->
      expect(error).to.be.undefined
      done()

  it "should give correct errors", (done) ->
    @plugin.lint "", "#{process.cwd()}/test/fixtures/invalid.js", (error) ->
      expect(error).to.contain 'line 1, col 15, Unnecessary semicolon.'
      done()

  it "should give correct errors", (done) ->
    @plugin.lint "", "#{process.cwd()}/test/fixtures/invalid.jsx", (error) ->
      expect(error).to.contain 'line 8, col 64, Unnecessary semicolon.'
      done()

  it "should not include warn when warnOnly is no", (done) ->
    config =
      plugins:
        jsxhint:
          warnOnly: no
    @plugin = new Plugin config
    @plugin.lint "", "#{process.cwd()}/test/fixtures/invalid.jsx", (error) ->
      expect(error).to.not.match /^warn/
      done()
