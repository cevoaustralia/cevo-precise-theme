require "coffee-script/register"
fs = require("fs")
Markdown   = require("node-markdown").Markdown
Handlebars = require("handlebars")

Handlebars.registerHelper 'md', Markdown

renderProfile= (profile) ->
  render 'profile', profile

renderPortfolio= (portfolio) ->
  render 'portfolio', portfolio

render= (name, model) ->
  css = fs.readFileSync(__dirname + "/style.css", "utf-8")
  template = fs.readFileSync(__dirname + "/#{name}.template", "utf-8")
  options =
    css: css
  options[name] = model
  Handlebars.compile(template)(options)

module.exports =
  renderProfile: renderProfile
  renderPortfolio: renderPortfolio

