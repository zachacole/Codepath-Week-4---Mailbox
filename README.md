# Codepath Week 4: Mailbox 

A prototype of the Carousel app in Swift and Xcode. 

Submitted by: Zach Cole

Time spent: 9 hours total time

## User Stories

The following **required** functionality is complete:
* [ ] User can scroll message feed
* [ ] On dragging message right, background color is revealed as grey with transparent check icon, then green with filled check icon, then red with delete icon
* [ ] If a user ends panning while check is visible, the message animates out and is archived, and feed translates up
* [ ] If a user ends panning while delete is visible, the message animates out and is archived, and feed translates up
* [ ] If a user ends panninng while background is still grey, message returns to original state
* [ ] On dragging message left, background color is revealed as grey with transparent later icon, then orange with filled later icon, then brown with list icon
* [ ] If a user ends panning while later is visible, message animates out, reschedule screen appears
* [ ] On tapping the reschedule screen, screen disappears, and message finishes animation, and feed translates up
* [ ] If a user ends panning while list is visible, message animates out, list screen appears
* [ ] On tapping the list screen, screen disappears, and message finishes animation, and feed translates up
* [ ] If a user ends panninng while background is still grey, message returns to original state

The following **optional** features are implemented:
* [ ] Panning from the left screen edge reveals menu
* [ ] If the menu is being revealed when the user lifts their finger, it should continue revealing
* [ ] If the menu is being hidden when the user lifts their finger, it should continue hiding
* [ ] Tapping mailbox on the menu screen returns user to feed



## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![alt tag](https://raw.githubusercontent.com/zachacole/Codepath-Week-4---Mailbox/master/mailbox-gif-2.gif)


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## License

    Copyright 2016 Zach Cole

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

