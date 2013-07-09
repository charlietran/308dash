class Dashing.Comments extends Dashing.Widget

  @accessor 'quote', ->
    "“#{@get('current_comment')?.body}”"

  ready: ->
    @currentIndex = 0
    @commentElem = $(@node).find('.comment-container')
    @nextComment()
    @startCarousel()

  onData: (data) ->
    @currentIndex = 0

  startCarousel: ->
    setInterval(@nextComment, 8000)

  nextComment: =>
    comments = @get('comments')
    if comments
      @commentElem.fadeOut =>
        tmpEl = $('<span></span>')
        @currentIndex = (@currentIndex + 1) % comments.length
        comments[@currentIndex]['body'] = tmpEl.html(comments[@currentIndex]['body']).text()
        @set 'current_comment', comments[@currentIndex]
        @commentElem.fadeIn()
