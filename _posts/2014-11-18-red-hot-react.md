---
layout: post
title:  "Red Hot ReactJS"
date:   2014-11-18 15:04:00
categories: reactjs react javascript
summary: "A ReactJS boilerplate focused on developer productivity through live editing"
---

I'm currently half way through [Hacker School](http://hackerschool.com) and am learning ReactJS! Frustrated with my crappy workflow I wanted to make the whole process as smooth as possible... enter [Red Hot React](http://mtford.co.uk/red-hot-react).

In my past experience with Django & Angular I've generally used [livereload](#) for live editing of styles, templates & views. A change is detected, the browser is signaled and the page refreshes. This was fine for apps that are driven entirely by URLs and sesisons but left problems unsolved with single page web apps.

If you're several levels deep in your app's navigation hierarchy the component and associated state wouldn't neccessarily be visible after the refresh. My time would be wasted trying to recreate that state and anything that wastes developer time needs to be **wiped out**.

[Red Hot React](http://mtford90.github.io/red-hot-react) is an opinionated boilerplate I intend to fork for all my future React projects. I incorporated a ton of libraries & tools from the JS & React communities and concentrated on maximising productivity - both in development and delivery.

## Features

For the full feature list and explanations, hit up the github [repo](http://mtford90.github.io/red-hot-react) and the commented codebase, but here's a quick fire summary of the more interesting stuff:

### Live Editing

Changes to individual React components are **injected** into the page rather than refreshing the whole page. This means that no state important to the changes we're making is lost. We can make changes to components and the instances in the DOM will ***react*** to those changes:

![Change ReactJS Components]({{ site.url }}/images/change_component.gif)

The same also applies to stylesheets:

![Change Stylesheets]({{ site.url }}/images/change_styles.gif)

### Compilation 

Javascript & Styles are all compiled into a single bundle. This is the weird bit - the styles are *embedded* within the Javascript itself. This not only means one HTTP request to download your app rather than two (or more if you have multiple css files) but is what allows for the live updating (see [later](#how-live-editing-works))

### Bootstrap

[react-bootstrap](react-bootstrap.github.io/) is included for ease of use of the Bootstrap library, making for much cleaner React components:

{% highlight xml linenos %}
<Row>
    <Col sm="4" md="6">
        Something
    </Col>
    <Col sm="4" md="6">
        Something else
    </Col>
</Row>
{% endhighlight %}

### Routing

[react-router](https://github.com/rackt/react-router) is included and configured with sane defaults and is ridiculously easy to configure: 

{% highlight js linenos %}
var navigationItems = [
    {text: 'Home', icon: 'fa fa-home', handler: require('./routes/Home')},
    {text: 'About', icon: 'fa fa-question-circle', handler: require('./routes/About')},
    {text: 'Contact', icon: 'fa fa-envelope-o', handler: require('./routes/Contact')}
];
{% endhighlight %}

## How it works

<a id="how-live-editing-works"></a>

### Live Editing

[Webpack](http://webpack.github.io/) is a module bundler similar in concept to browserify however it has some really useful features and concepts that enhance both development & delivery.

**Loaders** perform preprocessing on any file types e.g. the CoffeeScript loader will transform CoffeeScript into JavaScript. The interesting thing with loaders is that they are capable of bundling *any* static file into the Javascript bundle. Anything from styles, fonts and even images if you're so inclined:

{% highlight js linenos %}
// Bundle styles
require('./styles/scss/main.scss');
require('./styles/css/extra.css');

// Bundle images
var img = document.createElement('img');
img.src = require('./glyph.png');
{% endhighlight %}

In short: With Webpack, ***anything*** can be a module.

**Hot Module Replacement** is a plugin for webpack that will update modules in your live application. It's basically a method of updating only modules that have changed rather than a full page reload.

e.g in the case of React:

```
// MyComponent.jsx
var MyComponent = React.createClass({
    renderComponent: function () {
        return (<div>My component</div>)
    } 
});
module.exports = MyComponent;
```

If we change this file, all `MyComponent` instances in our application will be updated, without performing a full page render. 

## Caveats

One caveat is that modules are to be hot replaced cannot (should not) have any side effects e.g. if you change something that causes a hot replace of the module that calls `React.render`, you can probably guess what happens. Your whole application is re-rendered. The positive of this is that it encourages a modular approach to building your app.

## Summary

Don't wanna waste your time? Use [Red Hot React](http://mtford90.github.io/red-hot-react)