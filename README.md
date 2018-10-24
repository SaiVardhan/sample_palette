# README

* Problem Overview
	Build a simple server &amp; frontend presenting a user with a 20x20 grid of squares the user can
&quot;draw&quot; on to create a simple design.

* Project Requirements
- All users should be presented with a shared board
- Each user should have a palette of colors to choose from
- Clicking on a square, colors the square in with the user&#39;s currently selected color
- A visitor can overwrite the color of a previously-colored square (set by a different visitor
or themselves)
- Each visitor to the site should be assigned a randomly generated username (there does
not need to be any login or authentication), which should be shown to that visitor
- Hovering over a colored in square should display in some way which user placed that
color, and when it was placed
- The board should intermittently update to reflect any changes other users have made
- Appropriate testing should be in place

* Ruby version - 2.4.0
* Rails Version - 5.2.1
* Color Palette - jquery-minicolors-rails
* Testing Framework- Rspec

rake db:create
rake db:migrate


* Test
	bundle exec rspec

