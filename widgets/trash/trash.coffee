Date::getWeek = ->
  onejan = new Date(this.getFullYear(),0,1);
  Math.ceil((((this - onejan) / 86400000) + onejan.getDay()+1)/7);

class Dashing.Trash extends Dashing.Widget

  ready: ->
    @updateTrash()
    setInterval(@updateTrash, 6*60*60*1000)

  updateTrash: ->
    peoples = ['Tom', 'Ant', 'Jamin', 'Charlie', 'CJ'];
    today = new Date()
    week = today.getWeek()
    @set('trash', peoples[week%5])
