+++
date = 2016-05-09T00:00:00Z
tags = ["dev", "web", "python", "flask", "mongodb"]
title = "Godzilla Foxfire, the quickening"
slug = "/godzilla-foxfire-python/"
notoc = true
totop = true
+++

I started writing a trivial bookmarking app in [Python](https://www.python.org/) / [Flask](http://flask.pocoo.org/) for the main purpose of learning that stack. I must say that it was informative and fun.

### The dizzying highs:

Writing something in Python, with its simple and clean syntax, was satisfying. Little verbosity, and getting the logic I needed into classes and organized accordingly, was not a big hurdle.

The microframework, Flask, did a good job of staying out of my way, and giving me what I needed when defining my routes. Unlike Django, which I had tried previously (with all its batteries included), I was able to get everything defined with a proper [RESTful API](http://www.restapitutorial.com/) in very little time.

Implementing OATH (through some examples found online), turned out to be fairly straightforward. The only exception was integrating the app with [MongoDB](https://www.mongodb.com/) (more on that later), since it isn't your classic SQL DB.

### The terrifying lows:

Implementing OATH and other class definitions with MongoDB turned out to be the most challenging part, since most of the tutorials were using some flavor of SQL. I fully expected this, and to be honest, wanted the challenge so as to determine if I was actually learning something. The issues were mainly finding libraries I could use for MongoDB and then mapping the models using the No-SQL fields, in an appropriate/functional way. Through some reading, trial by fire, and testing, I was able to implement it successfully.

Decorators still mystify me, and I confess I did not take the time to fully understand them. I am sure I am missing other core concepts. As a result, I don't feel like I know Python/Flask confidently enough to dive into production code, but that usually comes with time (and more fire trials).

### The creamy middles:

I am not certain if I will ever return to this specific stack, as I have found some other tools I prefer for developing web applications and microservices (enter [Go](https://golang.org/)), but it was fun to prototype something with it, and get back to using MongoDB again.
