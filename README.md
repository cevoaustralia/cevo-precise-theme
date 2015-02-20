# Precise Theme Starter

This is an example of how to create a theme for [Precise](http://precise.io) Portfolios and Profiles.
Consider it a starter pack.  Use it a guide for your own theme.

## So you want to theme a Portfolio or Profile

Great!  Here's how you do it:

1. Copy or Fork this repository
2. Install development dependencies
3. Run the development server
4. Create your desired HTML markup and CSS
5. Package as a NPM
6. Deploy

### Getting your development environment setup

After cloning this repository, you need to install:

* [Node.js](http://nodejs.org/)
* [NPM](https://www.npmjs.com/)
* [Grunt Cli](http://gruntjs.com/getting-started#installing-the-cli)

With that done:

1. Change to the directory your copied this repository.
2. Install project depenencies using `npm install`
3. Run the developer server with `grunt`

Open http://localhost:9001/profile in your browser. You should see a Profile with default styling.

## Make it look good

With your development environment up and running you're ready to begin theme creation.

### What goes where

It's pretty simple:

* `package.json`: This file describes your NPM package.  The most important fields
and the `name` and `version`. If you have any dependencies such as a template engine
include them in the `dependencies` field.  As with any software package you must
bump the version on every release.

* `index.coffee`: We're using Coffeescript. If you prefer Javascript rename
this file to `index.js`.  This file is really important.  It's the glue between
the incoming JSON and your markup / css.   You must provide 2 functions: `renderProfile()`
and `renderPortfolio()`.  Both functions take a single argument - either the
Profile JSON object or the Portfolio JSON object. The job of this file is to
apply the JSON to the template and include relevant CSS.

* `profile.template`: This file contains the HTML Markup needed for your Profile.  You
can use from favourite templating language or stick with the one we used -- Handlebars.

* `portfolio.template`: Same as `profile.template` but for Portfolios.

* `style.css`:  All your CSS.

Also worthy of a mention is the test Profile and Portfolio JSON located in
the `./test` directory.  You can modify the JSON to suit your needs.  It's only
used during development.

### Images

You may want to include images in the theme you are developing. There are two options:

1. **Reference assets from an external URL.** You may have these images already hosted elsewhere. Simply reference them via their HTTP URL.
```
<img src="http://external.com/images/example/png" />
```
2. **Use Base64 encoding in CSS.** You can embed images directly into your CSS. Note that there are some [limitations](http://css-tricks.com/data-uris/) to using this approach.
```
.image {
  background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIA...);
}
```

## Deployment

When you are done with **making it look good** it's time to deploy:

1. Check you have updated `package.json` especially incrementing the version number.
2. Run `npm pack`. This create a local NPM package as a tar ball.
3. Login to [Precise](http://precise.io) and open the Manage Theme page.
4. Upload your new NPM package.
5. After a short pause the theme should be available to preview or select.
6. Preview the theme to ensure all is well before making permanent.
7. Rinse and repeat as required.
