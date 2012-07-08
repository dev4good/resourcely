doctype 5
html ->
  head ->
    partial "shared/meta"

  body role: "application", ->
    #if browserIs "ie"
    #  javascriptTag "http://html5shiv.googlecode.com/svn/trunk/html5.js"

    @templates if @templates

    nav id: "navigation", class: "navbar", role: "navigation", ->
      div class: "navbar-inner", ->
        div class: "container", ->
          partial "shared/navigation"

    header id: "header", class: "header", role: "banner", ->
      div class: "container", ->
        partial "shared/header"

    section id: "content", role: "main", ->
      div class: "tab-content", ->
        div id: "want", class: "tab-pane active container", ->
          h2 -> "fakse tab 1"
        div id: "have", class: "tab-pane container", ->
          h2 -> "fake tab 2"
        #body @body

    footer id: "footer", class: "footer", role: "contentinfo", ->
      div class: "container", ->
        partial "shared/footer"

  if @popups
    aside id: "popups", ->
      @popups

  if @bottom
    @bottom

    script "App.bootstrap(#{JSON.stringify(@bootstrapData, null, [])})" if @bootstrapData
