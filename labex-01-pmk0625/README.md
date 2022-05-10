# SafeWalkVolunteer
In this activity we will create a simple application that asks the user to provide their information to volunteer to the SafeWalk program. It helps monitor crosswalks to keep children safe on their way to school/home.

## Learning objectives:
1. Design and implement a class.
1. Design and implement a computed property.
1. Design and implement a class that implements a protocol.

## Instructions
1. Open [Volunteer.swift](SafeWalkVolunteer/Volunteer.swift) and go over the `Volunteer` protocol. 
1. Create a class called `SafeWalkVolunteer` that implementes the `Volunteer` protocol. Write your code inside [Volunteer.swift](SafeWalkVolunteer/Volunteer.swift).
1. Create an initializer without parameters for the `SafeWalkVolunteer` class. It should set `name` to an empty String and `age` to 0.
1. Create another initializer that accepts a String parameter called `name` and an Int parameter called `age`. Assign the parameter values to the corresponding properties of the class.
1. Create an Int `maxHours` computed property. It is a get-only property that returns 1 if the volunteer's `age` is less than 18 and returns 3 if the volunteer's `age` is 18 and over.

## Running the application
1. You can run the application by clickng on the play button icon (▶) at the top of XCode's screen. This will run the iOS simulator. Take note that you can choose any other device, but the layout may look different as it was designed for an iPhone 12.
1. Type in a name and age on the text box then click on the `Volunteer!` button.
1. You should see a page showing the name and hours assigned to the volunteer.

## Testing your code
1. You can verify your code by using the provided unit test. You can click on `Product > Test` on XCode's menu to initiate the test. See the FAQ on our Canvas page to see more details about debugging your code using unit tests.
1. You will get full points if all unit tests passed.

## Submission
1. Commit and push your code to GitHub to submit it. See the FAQ on our Canvas page to see more details about commiting and pushing code to GitHub using XCode.
1. You can verify your submission by refreshing the main page of the repository. It should show your commit message and the timestamp when you pushed the code.
