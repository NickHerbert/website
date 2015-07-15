class Levels.Views.LevelEntriesIndex extends Backbone.View

  template: JST['level_entries/index']


  initialize: ->
    @listenTo(@collection,'sync',@render)
    @currentGame = ""
    @prevPosition = 0
    @currentPosition = 0
    @nextPosition = 0
    @currentLevelList = []

  events:
    'click .game-title' : 'switchGames'
    'click #previous-item-button' : 'previousItem'
    'click #next-item-button' : 'nextItem'

  render: ->
    $(@el).html(@template(levels: @collection))

    $.ajax
      url:'/levels/1/galleries/1'
      error: =>
        console.log("OH NO!")
      success: (data, status, xhr) =>
        console.log(data)
        console.log(status)
        console.log(xhr)


    gameTitles = {}
    $.each(@collection.models, (index,val) ->
      gameTitles[val.attributes.game] = true
    )
    $.each(gameTitles, (index,val)->
      levelNav = new Levels.Views.LevelEntriesNav(model: index)
      $("#game-titles").append(levelNav.render().el)
    )
    @buildLevelList()
    @renderLevels()

    this

  buildLevelList:->
    @currentLevelList = []
    $.each(@collection.models, (index,val) =>
      if val.attributes.game == @currentGame
        @currentLevelList.push(val)
    )
    switch @currentLevelList.length
      when 1
        @prevPosition = 0
        @currentPosition = 0
        @nextPosition = 0
      when 2
        @prevPosition = 0
        @currentPosition = 1
        @nextPosition = 0
      else
        @prevPosition = 0
        @currentPosition = 1
        @nextPosition = 2



  renderLevels: ->
    $("#main-item-window").children().remove()
    $("#next-item-window").children().remove()
    $("#previous-item-window").children().remove()


    if @currentLevelList.length != 0
      levelViewPrev = new Levels.Views.LevelEntriesPreview(model: @currentLevelList[@prevPosition])
      levelView = new Levels.Views.LevelEntriesShow(model: @currentLevelList[@currentPosition])
      levelViewNext = new Levels.Views.LevelEntriesPreview(model: @currentLevelList[@nextPosition])

      $("#previous-item-window").append(levelViewPrev.render().el)
      $("#next-item-window").append(levelViewNext.render().el)
      $("#main-item-window").append(levelView.render().el)

      $("#game-display-window").css('background', 'url(' + @currentLevelList[@currentPosition].attributes.background + ') 50% 0 no-repeat fixed')
    else
      $("#main-item-window").html("<p class='choose-text'>Please choose a game.</p>")

  switchGames: (event) ->
    this.$('img').addClass("none")
    this.$('img').removeClass("selected")
    this.$('[data-tag-id="'+event.currentTarget.dataset.tagId+'"]').children()[0].className = 'selected'
    @currentGame = event.currentTarget.dataset.tagId
    @buildLevelList()
    @renderLevels()

  previousItem: (event)->
    @currentPosition -= 1
    @prevPosition -= 1
    @nextPosition -= 1
    if @prevPosition < 0
      @prevPosition = @currentLevelList.length - 1
    if @currentPosition < 0
      @currentPosition = @currentLevelList.length - 1
    if @nextPosition < 0
      @nextPosition = @currentLevelList.length - 1
    @renderLevels()
  nextItem: (event)->
    @currentPosition += 1
    @prevPosition += 1
    @nextPosition += 1
    if @prevPosition > @currentLevelList.length - 1
      @prevPosition = 0
    if @currentPosition > @currentLevelList.length - 1
      @currentPosition = 0
    if @nextPosition > @currentLevelList.length - 1
      @nextPosition = 0
    @renderLevels()
