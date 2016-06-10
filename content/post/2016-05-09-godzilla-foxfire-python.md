+++
date = 2016-05-09T00:00:00Z
tags = ["dev", "web", "python", "flask", "mongodb"]
title = "Godzilla Foxfire, the quickening"
slug = "/godzilla-foxfire-python/"
notoc = true
totop = true
+++

I started writing a trivial bookmarking app in [Python](https://www.python.org/) / [Flask](http://flask.pocoo.org/) for the main purpose of learning that stack. I must say that it was informative and fun.

The source can be found on my [github account](https://github.com/quandrei/godzilla-foxfire-flask) and here are the resources I used:

* [Flask tutorial by Miguel Grinberg](http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world) for general application implementation and guide
* [MongoDB documentation example for MongoEngine](https://docs.mongodb.com/ecosystem/tutorial/write-a-tumblelog-application-with-flask-mongoengine/) for general usage
* [OAUTH example #1 by Miguel Grinberg](http://blog.miguelgrinberg.com/post/oauth-authentication-with-flask) (not part of his original tutorial)
* [OAUTH example #2 on StackOverflow](http://stackoverflow.com/questions/9499286/using-google-oauth2-with-flask)

### The dizzying highs:

#### Python

Writing something in Python, with its simple and clean syntax, was satisfying. Little verbosity, and getting the logic I needed into classes and organized accordingly, was not a big hurdle. As an example, here is the defined model class for a User:

```
class User(UserMixin, db.Document):
    created_at = db.DateTimeField(default=datetime.datetime.now, required=True)
    social_id = db.StringField(max_length=255, required=True)
    username = db.StringField(max_length=255, required=True)
    email = db.StringField(max_length=255, required=False)

    def __unicode__(self):
        return self.username

    meta = {
        'allow_inheritance': True,
        'indexes': ['social_id','username','email','-created_at'],
        'ordering': ['-created_at']
    }
```

In only ~10 lines of code, I am able to map out the model attributes to the database fields, how the object will be output, and some other metadata, such as indices and ordering when returning collections.

#### Flask

The microframework, Flask, did a good job of staying out of my way, and giving me what I needed when defining my routes. Unlike Django, which I had tried previously (with all its batteries included), I was able to get everything defined with a proper [RESTful API](http://www.restapitutorial.com/) in very little time. Here is an example of the *'/index'* route:

```
@app.route('/index', methods=['GET'])
@login_required
def index():
    user = current_user
    return render_template('index.html',
                         title='Godzilla Foxfire',
                         user=user)
```

In a few short lines, I was able to define the named route, specify the HTTP verb(s) permitted to access the route, enforce that a user must be logged in to access the route, and render a specific html file. Simple and effective.

#### OAUTH

Implementing OATH (through some examples found online), turned out to be fairly straightforward. The only exception was integrating the app with [MongoDB](https://www.mongodb.com/) (more on that later), since it isn't your classic SQL DB.

#### MongoDB

The piece that took me the most time was having Python/Flask and MongoDB talk to each other. After going through a few tutorials, I settled on [MongoEngine](http://mongoengine.org/) to map out my DB collection fields to my class model attributes. The differences from the SQL mappings are not that different, as you can see here:

```
/*** SQL ***/
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nickname = db.Column(db.String(64), index=True, unique=True)
    email = db.Column(db.String(120), index=True, unique=True)

/*** MongoDB No-SQL ***/
class User(UserMixin, db.Document):
    created_at = db.DateTimeField(default=datetime.datetime.now, required=True)
    social_id = db.StringField(max_length=255, required=True)
    username = db.StringField(max_length=255, required=True)
    email = db.StringField(max_length=255, required=False)
```

Note that 'UserMixin' has nothing to do with No-SQL, but there for the OAUTH implementation. However, the rest is pretty evident. The SQL implementation refers to database columns for each class attribute, and the types they adhere to, within the associated database table. The No-SQL implementation refers to fields for each class attribute, with a specified type, within the named collections (associated to the class). They each (column or field) have their own parameters to specify if columns are unique (SQL) or fields are required (No-SQL).

### The terrifying lows:

Implementing class definitions with MongoDB turned out to be the most challenging part, since most of the tutorials were using some flavor of SQL. I fully expected this, and to be honest, wanted the challenge so as to determine if I was actually learning something. The main issue was finding a document-object mapper that I could use to connect the MongoDB No-SQL data fields and the model class attributes, in an appropriate/functional way. Through some reading, trial by fire, and testing, I was able to implement it successfully using MongoEngine.

Decorators still mystify me, and I confess I did not take the time to fully understand them. I am sure I am missing other core concepts. As a result, I don't feel like I know Python/Flask confidently enough to dive into production code, but that usually comes with time (and more fire trials).

### The creamy middles:

I am not certain if I will ever return to this specific stack, as I have found some other tools I prefer for developing web applications and microservices (enter [Go](https://golang.org/)), but it was fun to prototype something with it, and get back to using MongoDB again.

The next step for me will likely be reproducing this functionality using Go, not for any groundbreaking app or discovery, but for the more important reason: [because it's there.](https://youtu.be/qL1WqN1XKK0?t=36s).
