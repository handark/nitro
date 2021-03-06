Base  = require 'base'
List  = require '../models/list'
Task  = require '../models/task'
event = require '../utils/event'
translate = require '../utils/translate'

text = translate
  all: 'All Tasks'
  completed: 'Completed'

class Search

  constructor: ->
    event.on 'search search:all', @searchAll
    event.on 'search:completed', @searchCompleted

  searchAll: (query) =>
    List.trigger 'select:model',
      name: text.all
      id: 'search'
      type: 'active'
      permanent: yes
      query: query

  searchCompleted: (query) =>
    List.trigger 'select:model',
      name: text.completed
      id: 'search'
      type: 'completed'
      permanent: yes
      query: query
      sort: true

module.exports = Search
