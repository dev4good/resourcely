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

    section id: "content", role: "main", ->
      div class: "tab-content", ->
        div id: "want", class: "tab-pane active container", ->
          h1 -> "I want to obtain resources."
          h2 -> "We currently have the following resources available:"
         ul id: "offerlist", style: "list-style-type: none"
        div id: "have", class: "tab-pane container", ->
          h1 -> "I have a resource to offer."
          h2 -> "The following requests are on our system that could be fulfillled by you:"
        ul id: "reqlist", style: "list-style-type: none"
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
