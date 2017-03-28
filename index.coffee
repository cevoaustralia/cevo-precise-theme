require 'coffee-script/register'

fs = require 'fs'
marked     = require 'marked'
Handlebars = require 'handlebars'

Handlebars.registerHelper 'md', marked

Handlebars.registerHelper 'logo', (text) ->
  return 'fa-github-square'   if text == 'Github'
  return 'fa-twitter-square'  if text == 'Twitter'
  return 'fa-linkedin-square'  if text == 'Linkedin'
  return 'fa-envelope-square' if text == 'Email'

Handlebars.registerHelper 'truncate', (str, len) ->
  if str && str.length > len
    new Handlebars.SafeString(str.substring(0, len-3).concat('...'))
  else
    str

Handlebars.registerHelper 'skillLevelAsPercentage', (level) ->
  return "#{(level * 2) * 10}%"

Handlebars.registerHelper 'skillLevelAsText', (level) ->
  switch level
    when 1 then "Awareness"
    when 2 then "Novice"
    when 3 then "Intermediate"
    when 4 then "Advanced"
    when 5 then "Expert"

Handlebars.registerHelper 'latestProjects', (profile) ->
  projects = []
  for experience in profile.experience
    if experience.projects
      for project in experience.projects
        projects.push project
  projects.slice(0,6)

renderProfile   = (profile)   -> render 'profile',   profile
renderPortfolio = (portfolio) -> render 'portfolio', portfolio

render= (name, model) ->
  js = fs.readFileSync "#{__dirname}/assets/js/main.js", 'utf-8'
  template = fs.readFileSync "#{__dirname}/#{name}.template", 'utf-8'
  options = js: js
  options[name] = model
  Handlebars.compile(template)(options)

module.exports =
  renderProfile:   renderProfile
  renderPortfolio: renderPortfolio
