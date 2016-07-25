# README

Challenges Faced:

I wasn't sure how to maintain the user's formatting when submitting posts from an input field.  For example how to handle line breaks for paragraphs.

-I Found out the input fields were recording the line breaks and spaces and used Rails view helper simple_format method to interpret those into html and add tags.


Infinite scrolling was an interesting problem.  First I had to figure out a way to determine when the user's scroll is getting close to the bottom of the page.  Next even via ajax how do I make sure I am selecting the next right articles and in order.  Originally I wanted to just make an ajax request to ask for the next 5 or so articles each time.  I found it difficult to find where you are at in terms of what you asked for last and select the correct articles from the database.  My solution was to just have rails load first 5 or so on page load and then via ajax have js get the rest of the articles and place them in an array.  Cut off the first 5 that rails already displayed and then just pop X amount off the array every time the user scrolls to the bottom of the screen.  This should work in theory but still has the issue of if the database is huge I am asking to load everything every time someone is on the index page of the blog.  This probably cannot work in scale.


I was using a link with "remote: true" set to delete comments via
AJAX.  When doing so I was hitting my controller deleting the post but when I returned to JS I couldn't think of a good way to find and select that comment via JQuery.  

-I ended up adding an event listener to button click and I added a class .to-delete so that after the successful delete from the database I can find the correct element to remove from the page.


Got stuck on a bug trying to AJAX custom data via my forms "remote: true".

-Learned that you can only send custom data with links and not forms (when using remote true) and instead used a hidden input field to get the necessary data I needed from the form.


Had JS giving me unexpected behavior.

-Attempted to use a different form of document.ready for Turbolinks with no success so I turned turbo links off which fixed issues.


Wasn't completely sure what admins abilities should be or how they could safely become an admin.  I decided to just force an admin through the database and am planning to have that admin grant other admins in the future.  Also was unsure if just setting user with a boolean admin true is the proper and safe way of making a user admin.


When deploying to Heroku I had some issues on the initial push.  I found out uglifier cannot compile JS assets that have es6 code in them.

Solution: Removed es6.


Hit a silly bug where I tried to use a variable named "class" to set a views class.  Ruby was a bit confused by this. Renamed variable to "klass".

Overall the process was pretty smooth. These were really the only bugs and challenges I faced.  I definitely want to add a ton more that I couldn't complete due to time constraints.  Below is a list of some things I still want to work on.


Work in Progress:

Additional work and features needed:
*Adding user avatar/image
*Ability to edit post on same page via ajax
*Ability to format text when making posts ex. bold things
*Action Mailer and password resets for devise
*Error handling, didn't focus heavily on this missing some error handling
*More validations
*Tighten up site responsiveness

Infinite scrolling:
*Code nearly there for barebones implementation of infinite scrolling
*Due to heroku js issues and time constraints commented code out
*Probably not the best/most efficient implementation

Efficiencies:
*Look for more n+1 problems
*Efficient implementation of infinite scroll as I am just trying to load all posts to js.

More admin abilities:
*Give someone else admin from gui
*Delete users?
