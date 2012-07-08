meta charset: "utf-8"

title @title if @title

link href: "/favicon.png", rel: "icon shortcut-icon favicon"

if @scripts
  for s in @scripts
    script src: s + '.js'
script(src: @script + '.js') if @script
if @stylesheets
  for s in @stylesheets
    link rel: 'stylesheet', href: s + '.css'
if @stylesheet
  link(rel: 'stylesheet', href: @stylesheet + '.css')
style @style if @style
