xctest-objc
---

This is a sample project for Test Driven Development in Objective C. In addition, there include a ui automation test on appium. You can learn TDD from commit history:

```
......
* d79652a  add greater function (10 days ago) <Jian Lv>
* d46a2be  refactor tet (10 days ago) <Jian Lv>
* 655b194  save reminder id (10 days ago) <Jian Lv>
* 624c296  add a first test, add pass it quickly (10 days ago) <Jian Lv>
* 9975da1  first init (10 days ago) <Jian Lv>
* bcd8d4a  Initial Commit (10 days ago) <Jian Lv>
```

Tools
===

* XCTest
* [OCHarmcrest](https://github.com/hamcrest/OCHamcrest) for assertion
* [OCMockito](https://github.com/jonreid/OCMockito) for mock

Requirement
===

* XCode 6.2+ and iOS 8
* [cocoapods](http://cocoapods.org/)
* node and [appium](http://appium.io/)
* ruby and [rspec](http://rspec.info/)

How to use it
===

1. clone the project		

2. install dependencies using cocoapods: 
```
pod install
```
3. open __tdd.xcworkspace__	
4. __cmd + u__ to run test.


How to run ui automation test
===

1. install appium in your laptop & run it: 
```
npm install -g appium & appium
```

2. install ruby gems: 
```
bundle install
```

3. run test: 
```
be rake
```
