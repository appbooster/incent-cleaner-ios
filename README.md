# incent-cleaner-ios

Framework for incent traffic cutting off.

## Installation

Need to install an appropriate version of the framework according to your Xcode version:
1) Get the major version of Xcode e.g. `12`
2) CocoaPods:

```
pod 'IncentCleaner' # to install last `1.12` version compatible with Xcode12
```

or

```
pod 'IncentCleaner', '<LAST_RELEASE_VERSION>-xcode<MAJOR_VERSION_OF_XCODE>' # e.g. `1.12-xcode12`
```

3) In the `Info.plist` need to add `App Transport Security Settings`:

Property List:
`App Transport Security Settings`: `Dictionary` > `Allow Arbitrary Loads`: `Boolean` = `YES`

Source Code:
```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

or

Property List:
`App Transport Security Settings`: `Dictionary` > `Exception Domains`: `Dictionary` > `localhost`: `Dictionary` > `NSExceptionAllowsInsecureHTTPLoads`: `Boolean` = `YES`

Source Code:
```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSExceptionDomains</key>
    <dict>
        <key>localhost</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
        </dict>
    </dict>
</dict>
```

## Usage

```
import IncentCleaner
```

### How to check for incenting?

```
IncentCleaner.checkForIncenting(completion: { incent in })
```

Also, you can use "do-activate-do" method.

### "do-activate-do" method

There are three types of blocks:
1) Initial – e.g. initialization of some analytics services
2) Pre – e.g. configuring of some analytics services (setting user properties)
3) Common – e.g. tracking some events

There is the blocks queue that starts execute only when the check for incenting is finished.
Until that moment all incoming blocks are being placed to the queue and sorted according to the following priority order: Initial > Pre > Common.
It can be helpful when you need to track some events in certain order but you do not have enough info to initialize or configure some analytics services making that tracking.

#### Activation

IMPORTANT: Use only on the main thread
```
IncentCleaner.activate() // to start the check for incenting 
```

#### How to enqueue some code block for the execution if the user is non-incent?

IMPORTANT: Use only on the main thread
```
IncentCleaner.doIfNonIncent(type: .initial, // .initial|.pre|.common, .common by default
                            desc: "Some analytics service initialization", // optional, for debug
                            block: {
    // Some analytics service initialization
})
```

### How to debug?

```
IncentCleaner.showDebug = true // false by default, to print all debugging info in the console
IncentCleaner.log = { text in } // to define your own log handler 
```

==================================================

You can see the example of usage in the attached project.
