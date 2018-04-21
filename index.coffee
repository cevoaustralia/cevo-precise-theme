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
  return 'fa-rss' if text == 'Blog'
  return 'fa-mobile' if text == 'Phone'
  return 'fa-info' if text == 'Other'

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

Handlebars.registerHelper 'tracks', (portfolio) ->
  result = []
  for snapshot in portfolio.snapshots
    for track in snapshot.profile.tracks
      if track.visible then result.push(track)
  JSON.stringify(result)

renderProfile   = (profile)   -> render 'profile',   profile
renderPortfolio = (portfolio) -> render 'portfolio', portfolio

render = (name, model) ->
  js = fs.readFileSync "#{__dirname}/assets/js/main.js", 'utf-8'
  css = fs.readFileSync "#{__dirname}/assets/css/styles.css", 'utf-8'
  template = fs.readFileSync "#{__dirname}/#{name}.template", 'utf-8'

  options =
    js: js
    css: css

  options[name] = model
  Handlebars.compile(template)(options)

module.exports =
  renderProfile:   renderProfile
  renderPortfolio: renderPortfolio
