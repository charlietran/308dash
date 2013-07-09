class Dashing.Clock extends Dashing.Widget

  ready: ->
    setInterval(@startTime, 500)

  startTime: =>
    today = new Date()
    h = today.getHours()
    ampm = if ( h < 12 ) then "AM" else "PM"
    h = if ( h > 12 ) then h - 12 else h;
    h = if ( h == 0 ) then 12 else h;
    m = today.getMinutes()
    s = today.getSeconds()
    m = @formatTime(m)
    s = @formatTime(s)
    # @set('time', h + ":" + m + ":" + s)
    @set('time', h + ":" + m + " " + ampm)
    @set('date', today.toDateString())

  formatTime: (i) ->
    if i < 10 then "0" + i else i