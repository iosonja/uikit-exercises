# 100 Days of Swift

### The repository contains my solutions to Paul Hudson's 100 Days of Swift challenge. The challenge is to make small iOS apps built using UIKit.

The "Tutorial-based Exercises" folder contains apps that are built on top of tutorials and only slightly modified by me. The "Built From Scratch" folder only contains projects that are made by me from start to finish.

---

### Summary of apps I've built so far

#### Project 1: Storm Viewer (tutorial-based)

- An application that lets users scroll through a list of images, then select one to view.
- Topics covered:
   - table views and image views
   - app bundles
   - `FIleManager`
   - typecasting
   - view controllers
   - storyboards
   - outlets
   - Auto Layout
   - `UIImage`

#### Project 2: Guess the Flag (tutorial-based)

- A game that shows some random flags to users and asks them to choose which one belongs to a particular country.
- Topics covered:
   - @2x and @3x images
   - asset catalogs
   - `UIButton`
   - `CALayer`
   - `UIColor`
   - random numbers
   - actions
   - `UIAlertController`

#### Project 3:

- A version of Storm Viewer that allows images to be shared.
- Topics covered:
   - `UIBarButtonItem`
   - `UIActivityViewController`
   - \#selector
   - Asking for permissions & Info.plist

#### Challenge 1: Flag Listing (built from scratch, unfinished)

- An app that lists various world flags in a table view and opens the fags in a detail view.
- Tasks:
   - [x] Start with a Single View App template, then change its main `ViewController`class so that builds on `UITableViewController` instead.
   - [x] Load the list of available flags from the app bundle. You can type them directly into the code if you want, but it’s preferable not to.
   - [ ] Create a new Cocoa Touch Class responsible for the detail view controller, and give it properties for its image view and the image to load.
   - [ ] You’ll also need to adjust your storyboard to include the detail view controller, including using Auto Layout to pin its image view correctly.
   - [ ] You will need to use `UIActivityViewController` to share your flag.

#### Project 4: Simple web browser (tutorial-based)

- A web browser built using WebKit. Allows visiting only certain web sites.
- Topics covered:
   - `loadView()`
   - `WKWebView`
   - delegation
   - `URL`  & `URLRequest`
   - `UIToolbar`
   - `UIProgressView`
   - KVO

