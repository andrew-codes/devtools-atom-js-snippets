{WorkspaceView} = require 'atom'
ScDevtoolsAtomJsSnippets = require '../lib/sc-devtools-atom-js-snippets'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "ScDevtoolsAtomJsSnippets", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('sc-devtools-atom-js-snippets')

  describe "when the sc-devtools-atom-js-snippets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.sc-devtools-atom-js-snippets')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'sc-devtools-atom-js-snippets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.sc-devtools-atom-js-snippets')).toExist()
        atom.workspaceView.trigger 'sc-devtools-atom-js-snippets:toggle'
        expect(atom.workspaceView.find('.sc-devtools-atom-js-snippets')).not.toExist()
