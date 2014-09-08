{View} = require 'atom'

module.exports =
class ScDevtoolsAtomJsSnippetsView extends View
  @content: ->
    @div class: 'sc-devtools-atom-js-snippets overlay from-top', =>
      @div "The ScDevtoolsAtomJsSnippets package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "sc-devtools-atom-js-snippets:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "ScDevtoolsAtomJsSnippetsView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
