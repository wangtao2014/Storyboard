You’ll be using the delegate pattern a few more times in this tutorial. Here’s a handy checklist for setting up the connections between two scenes:
1、Create a segue from a button or other control on the source scene to the destination scene. (If you’re presenting the new screen modally, then often the destination will be a Navigation Controller.)
2、Give the segue a unique Identifier. (It only has to be unique in the source scene; different scenes can use the same identifier.)
3、Create a delegate protocol for the destination scene.
4、Call the delegate methods from the Cancel and Done buttons, and at any other point your destination scene needs to communicate with the source scene.
5、Make the source scene implement the delegate protocol. It should dismiss the destination view controller when Cancel or Done is pressed.
6、Implement prepareForSegue: in the source view controller and do destination.delegate = self;.