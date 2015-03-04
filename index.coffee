require 'coffee-script/register'

fs = require 'fs'
marked     = require 'marked'
Handlebars = require 'handlebars'

Handlebars.registerHelper 'md', marked

renderProfile   = (profile)   -> render 'profile',   profile
renderPortfolio = (portfolio) -> render 'portfolio', portfolio

render= (name, model) ->
  css = fs.readFileSync "#{__dirname}/style.css", 'utf-8'
  template = fs.readFileSync "#{__dirname}/#{name}.template", 'utf-8'
  options = css: css
  options[name] = model
  Handlebars.compile(template)(options)

module.exports =
  renderProfile:   renderProfile
  renderPortfolio: renderPortfolio
