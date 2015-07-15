class Levels.Routers.LevelEntries extends Backbone.Router

  routes:
    '':'index'
    ':id': 'show'

  initialize: ->
    @collection = new Levels.Collections.LevelEntries()
    @collection.fetch()

  index: ->
    view = new Levels.Views.LevelEntriesIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Level #{id}"