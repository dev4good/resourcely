ul id: "interaction", class: "nav nav-tabs", ->
  li -> a 'Have', href: "#have", -> "I Have a Resource"
  li -> a 'Want', href: "#want", -> "I Need a Resource"

div ".nav", ->
  li -> a href: '/auth/google', "sign in via google"
