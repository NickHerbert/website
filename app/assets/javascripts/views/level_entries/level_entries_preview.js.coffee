class Levels.Views.LevelEntriesPreview extends Backbone.View

  template: JST['level_entries/preview']

  render: ->
    attributes = this.model.attributes
    $(@el).html(@template(this.model.toJSON()))
    this
