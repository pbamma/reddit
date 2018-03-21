# iOS Take Home Excercise

Given a 'listing' endpoint to the reddit API (https://www.reddit.com/dev/api), display a list of reddit listings with the thumbnail and title. This list should be able to be paginated. Clicking on one of the rows should take the user to a view with the comments for that listing.

Possible endpoints can be [hot, new, random, top] anything you like. An example URL would be http://www.reddit.com/r/all/new.json
* using /r/organic

implementation requirements
- use swift (done)
- use automatic cell sizing and autolayout for the tableviewcell heights (done)
- write the UI and constraints programmatically (done)
- feel free to use cocoapods (done)

---------------------------------------------------------------------------------

# Architecture
* MVC-N (Modle-View-Controller-Network)
* RESTful

# Requirements
* iOS 11.0+
* Xcode 9.2+
* Swift 4.0+

# Data Source
* https://www.reddit.com/dev/api
*  /r/organic

# Review Testing
* Some of the linked sites don't have mobile adaptable websites and hence look not so good.


# Dev Notes
* Would love to have a data source that I can format, but since the API returns links, not much I can do in a short time.


