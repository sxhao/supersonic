describe "supersonic.data.model", ->
  it "is a function", ->
    supersonic.data.model.should.be.a 'function'

  it "returns a model class when given the name of a configured cloud resource", ->
    supersonic.data.model('task').should.be.a 'function'

  it "receives configured cloud resources as an injected global in window.ag.data", ->
    window.ag.data.resources.task.should.be.an 'object'

  it "should be able to retrieve a collection from the cloud with the configured settings", ->
    @timeout 5000
    supersonic.data.model('task').findAll().should.be.fulfilled

  describe "when passing in options", ->

    describe "assumptions", ->
      it "will fail to fetch any data if the correct headers are not in place", ->
        @timeout 5000
        supersonic.data.model('task', {
          headers:
            steroidsApiKey: 'this is not the key you are looking for'
        }).findAll().should.not.be.fulfilled

    describe "behavior", ->

      it "can set headers through options", ->
        @timeout 5000
        supersonic.data.model('task', {
          headers:
            steroidsApiKey: window.ag.data.options.headers.steroidsApiKey
            steroidsAppId: window.ag.data.options.headers.steroidsAppId
        }).findAll().should.be.fulfilled

      it "should retain default headers even after setting new ones", ->
        @timeout 5000
        # The call to findAll _should_ fail in case this overrides all default headers,
        # ie. steroidsApiKey is left out of the request
        supersonic.data.model('task', {
          headers:
            steroidsAppId: window.ag.data.options.headers.steroidsAppId
        }).findAll().should.be.fulfilled

      it.skip "can sync headers with localstorage through options", ->
        # This fails until baconjs can be made a peerdependency:
        # incompatibility between different instances of baconjs in the runtime
        # causes the stack to blow up when merging stream values.
        @timeout 5000
        steroidsApiKey = supersonic.data.storage.property('steroids-api-key').set(window.ag.data.options.headers.steroidsApiKey)
        steroidsAppId = supersonic.data.storage.property('steroids-app-id').set(window.ag.data.options.headers.steroidsAppId)

        findAll = supersonic.data.model('task', {
          headers:
            steroidsApiKey: steroidsApiKey.values
            steroidsAppId: steroidsAppId.values
        }).findAll()

        findAll.finally ->
          steroidsApiKey.unset()
          steroidsAppId.unset()

        findAll.should.be.fulfilled
