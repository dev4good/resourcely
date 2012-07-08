ul id: "interaction", class: "nav nav-tabs", ->
  li -> a 'Have', href: "#have", -> "I Have a Resource"
  li -> a 'Want', href: "#want", -> "I Need a Resource"

div ".nav", ->
  if @passport.user
    coffeescript -> console.log 'view', @passport
    li -> "Signed in as #{@passport.user.profile.displayName}"
  else
    li -> a href: '/auth/google', "Sign in via google"
