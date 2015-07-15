window.Levels =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  AppEvents: _.extend({}, Backbone.Events)
  initialize: ->
    new Levels.Routers.LevelEntries()
    Backbone.history.start()

$(document).ready ->
  Levels.initialize()
