ScDevtoolsAtomJsSnippetsView = require './sc-devtools-atom-js-snippets-view'

module.exports =
  scDevtoolsAtomJsSnippetsView: null

  activate: (state) ->
    @scDevtoolsAtomJsSnippetsView = new ScDevtoolsAtomJsSnippetsView(state.scDevtoolsAtomJsSnippetsViewState)

  deactivate: ->
    @scDevtoolsAtomJsSnippetsView.destroy()

  serialize: ->
    scDevtoolsAtomJsSnippetsViewState: @scDevtoolsAtomJsSnippetsView.serialize()
