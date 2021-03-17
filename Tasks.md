#### Project 1: Storm Viewer (tutorial-based)
- [x] Project 1 Quiz
- [x] Use Interface Builder to select the text label inside your table view cell and adjust its font size to something larger – experiment and see what looks good.
- [x] In your main table view, show the image names in sorted order, so “nssl0033.jpg” comes before “nssl0034.jpg”.
- [x] Rather than show image names in the detail title bar, show “Picture X of Y”, where Y is the total number of images and X is the selected picture’s position in the array. Make sure you count from 1 rather than 0.
- [x] Day 22: Add a bar button item to the main view controller that recommends the app to other people.

#### Project 2: Guess the Flag (tutorial-based)
- [x] Project 2 Quiz
- [x] Try showing the player’s score in the navigation bar, alongside the flag to guess.
- [x] Keep track of how many questions have been asked, and show one final alert controller after they have answered 10. This should show their final score.
- [x] When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
- [x] Day 22: Add a bar button item that shows the score when tapped.

#### Project 3: Shareable version of Storm Viewer
- [x] Project 3 Quiz
- [x] Try adding the image name to the list of items that are shared. The activityItems parameter is an array, so you can add strings and other things freely.

#### Challenge 1: Flag Listing (built from scratch)
- [x] Start with a Single View App template, then change its main `ViewController`class so that builds on `UITableViewController` instead.
- [x] Load the list of available flags from the app bundle. You can type them directly into the code if you want, but it’s preferable not to.
- [ ] Create a new Cocoa Touch Class responsible for the detail view controller, and give it properties for its image view and the image to load.
- [ ] You’ll also need to adjust your storyboard to include the detail view controller, including using Auto Layout to pin its image view correctly.
- [ ] You will need to use UIActivityViewController to share your flag.

#### Project 4: Simple web browser (tutorial-based)
- [x] Project 4 Quiz
- [x] If users try to visit a URL that isn’t allowed, show an alert saying it’s blocked.
- [ ] Try making two new toolbar items with the titles Back and Forward. You should make them use webView.goBack and webView.goForward.
- [ ] For more of a challenge, try changing the initial view controller to a table view like in project 1, where users can choose their website from a list rather than just having the first in the array loaded up front.

#### Project 5: Word Scramble
- [x] Project 5 Quiz
- [x] Disallow answers that are shorter than three letters or are just our start word.
- [x] Refactor all the else statements we just added so that they call a new method called showErrorMessage(). This should accept an error message and a title, and do all the UIAlertController work from there.
- [x] Add a left bar button item that calls startGame(), so users can restart with a new word whenever they want to.
- [ ] Disable adding the same word both lower- and uppercased.

#### Project 6: Auto Layout
- [x] Project 6 Quiz
- [ ] Try replacing the widthAnchor of our labels with leadingAnchor and trailingAnchor constraints, which more explicitly pin the label to the edges of its parent.
- [ ] Once you’ve completed the first challenge, try using the safeAreaLayoutGuide for those constraints. You can see if this is working by rotating to landscape, because the labels won’t go under the safe area.
- [ ] Try making the height of your labels equal to 1/5th of the main view, minus 10 for the spacing. Hints here: https://www.hackingwithswift.com/read/6/6/wrap-up

#### Challenge 2: Shopping List
- [x] Create a table view that displays a list of text items
- [x] Allow the user to add elements through a text field
- [x] Add a left bar button item that clears the shopping list

#### Project 7: Whitehouse Petitions
- [ ] Add a Credits button to the top-right corner using UIBarButtonItem. When this is tapped, show an alert telling users the data comes from the We The People API of the Whitehouse.
- [ ] Let users filter the petitions they see. This involves creating a second array of filtered items that contains only petitions matching a string the user entered. Use a UIAlertController with a text field to let them enter that string. This is a tough one, so I’ve included some hints below if you get stuck.
- [ ] Experiment with the HTML.
