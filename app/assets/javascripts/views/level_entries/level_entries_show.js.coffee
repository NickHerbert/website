class Levels.Views.LevelEntriesShow extends Backbone.View

  template: JST['level_entries/show']

  render: ->
    attributes = this.model.attributes
    $(@el).html(@template(this.model.toJSON()))
    this
