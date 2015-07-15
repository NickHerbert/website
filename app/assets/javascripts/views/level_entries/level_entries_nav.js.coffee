class Levels.Views.LevelEntriesNav extends Backbone.View

  template: JST['level_entries/nav']
  tagName: 'li'

  render: ->
    $(@el).html(@template(gameName: this.model))
    this
