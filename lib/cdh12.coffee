Cdh12View = require './cdh12-view'
{CompositeDisposable} = require 'atom'

module.exports = Cdh12 =
  cdh12View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @cdh12View = new Cdh12View(state.cdh12ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @cdh12View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'cdh12:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @cdh12View.destroy()

  serialize: ->
    cdh12ViewState: @cdh12View.serialize()

  toggle: ->
    console.log 'Cdh12 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
