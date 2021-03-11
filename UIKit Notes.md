# UIKit Notes from 100 Days of Swift

#### Project 1: Storm Viewer

- Auto Layout constraints must always be complete and non-conflicting.
- Custom table view cells don’t have to have a text label.
- Interface Builder creates outlets as implicitly unwrapped optionals. This is because the view won’t exist when the view controller is first created.
- The viewDidLoad() method is called after our view has been created.
- numberOfRowsInSection is called automatically by the table view.
- iOS reuses table view cells that have been moved off the screen to improve performance.
- The Navigation Bar is where the view controller’s title and buttons are displayed.
- All iOS apps are built into a single bundle, which has the extension “.app” and contains all the code and resources.
- UIImage stores images, but does not display them.
- @IBOutlet marks a property that is connected to something in Interface Builder, and that’s all it does.
- While view controllers might have a navigation controller, they also might not.
- UITableViewController inherits from UIViewController. All screens in iOS are represented using UIViewController or one of its subclasses.
- iOS automatically looks for an initial view controller to show when launching an app.
- All iOS apps must have a valid resource path for their bundle.
- Interface Builder’s document outline shows all view controllers in a storyboard.
- Navigation controllers manage a stack of view controllers that can be pushed by us. The stack gives us the sliding animation.

#### Project 2: Guess the Flag

- iOS has a feature called wide color, which enables extremely deep colors on modern devices (RGB values higher than 1.0)
- Multiple buttons can call the same method.
- Auto layout constraints can position one view relative to another.
- All Swift’s numeric types have a random(in: ) method.
- UIImage is compatible with asset catalogs.
- shuffle() randomizes order in place, shuffled() returns a shuffled version of an order.
- CALayer is part of Core Animation and sits behind everything UIKit does.
- Tags are integers attached to each view, and can be used for identification.
- @IBAction should connect to methods, and @IBOutlet to properties.
- App thinning means only device compatible assets are downloaded from the App Store. Asset catalogs store images at different sizes, in optimized format that makes them faster to load.
- The size inspector in storyboard lets you type in specific sizes and positions for views.
- UIAlertControlled should at least have a dismiss button attached to it.
- 2 or 3 pixels is equal to 1 point depending on the device.
- Alpha represents transparency.

#### Project 3: Social Media

- We show view controllers by calling the method present().
- Activity view controllers are capable of handling a variety of data types.
- Each view controller has its own navigationItem.
- The target of an action refers to where the code will be run, and the action refers to what code will be run. Action should point to a method, self is not ok.
- The app’s info.plist-file contains settings that won’t change: things like the name that goes under our icon, any special URLs we want to handle and system messages we want to show to users.
- On iPads, iOS wants to connect activity view controllers to whatever triggered them, so that users have some extra content.
- “self” automatically refers to the current instance (struct, class…) when used inside a method.
- \#selector allows Swift to check that a method exists while building our code.
- Not all apps have a navigation bar.
- Image views may or may not have an image inside.
- @IBAction automatically implies @objc: Because @IBAction means you're connecting storyboards (Objective-C code) to Swift code, it always implies @objc as well.
- You don’t have to provide any custom application activities for alert view controllers.

#### Project 4: Easy Browser

- loadView() is called first, and it's where you create your view; viewDidLoad() is called second, and it's where you configure the view that was loaded.
- Calling sizeToFit() on a view makes it take up the correct amount of space for its content.
- Delegation allows one object to respond on behalf of another.
- If you want to, you can provide a context value for your key-value observers.
- URLs are stored in a data format calles URL in Swift.
- A web view's navigation delegate can control which pages should be loaded.
- The actions in an alert controller can have nil as handler.
- You can have many flexible spaces in a toolbar.

#### Project 5: Word Scramble

- Checking for isEmpty is faster than count == 0 because it can return false as soon as one item exists.
- Weak references must be unwrapped before use; unowned references can be used directly.
- The IndexPath type is the combination of a section and row, making it useful for table views.
- Strong reference cycles cause memory leaks.
- reloadData() will cause all table view methods to be called again.
- Swift and Objective-C store strings differently, so Obj-c APIs need to be worked with carefully.
- randomElement() returns an optional element from an array because the array might be empty.
- A closure’s capture list comes before its parameters (eg: [weak self] param1, param2 in).
- A Swift URL can be used for local files, in addition to web addresses.
- NSRange stores the location and length of something and it’s commonly used with Objective-C APIs (including UIKit).
- Inserting a single row into a table view is more efficient than calling reloadData(), and also animatable.
- The .automatic value for the "with" parameter (eg. in insertRows() method) chooses whichever animation makes sense for the change being made.
- If firstIndex(of:) doesn’t find the element being asked, it returns nil.


#### Project 6: Auto Layout

- Auto Layout lets us position one view relative to another.
- The right-left position of leading and trailing anchors depends on the language being used (eg. Arabic is read right to left).
- Visual Formatting Language metrics let us share sizes across views easily.
- You should find one set of constraints that looks good across all iOS devices of different size.
- Interface Builder warns us if we try to create invalid or incomplete constraints.
- Visual Formatting Language creates horizontal constraints using H: and vertical ones using V:.
- The safe area layout guide automatically excludes rounded edges and any notch.
- Auto Layout constraints get re-evaluated only when you ask for it to happen or make a significant UI change.
- We can create Auto Layout anchors using constant values.
- Aspect Ratio constraints ensure the width and height of a view scale evenly.
- A pipe symbol in Visual Formatting Language means the edge of the parent view.
- Using an Auto Layout priority of 1000 makes it required.
- We can force our app to run only in specific orientations.

