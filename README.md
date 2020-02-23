# Awesomium HTML Tests
This is used to verify specific HTML features and workarounds in Awesomium in Garry's Mod.

* Font 'Trebuchet MS'
* Custom select box
* Flexbox _(uses the 2009 box version via webkit)_
    * Flexbox columns
    * Flexbox grow
* Transitions _(via webkit)_
* Transform _(via webkit)_

# Tested operating systems
* Windows 10 ✅
* Windows 7 ✅ _(Thanks to muh_memoose_more_magical_tea)_
* Mac ❓
* Linux ❓

# Awesomium Issues
* Doesn't implement SELECT elements fully
    * Select elements render, but they cannot be interacted with
* Doesn't support modern flexbox
    * Supports 2009 flexbox (box)
    * `display: -webkit-box;` [Read about it here](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Mixins)
    * This is missing some features such as flex shrink (elements will not shrink below their contents size)
* Requires webkit for transforms
* Requires webkit for transitions
* Doesn't support javascript template strings, default parameter values, `let`
* Doesn't properly implement `.toLocaleDateString` (doesn't seem to support any parameters)
* Doesn't support inline SVGs


# In-game tests

## Expected outcome
UI elements<br>
![Elements](https://i.imgur.com/KpWLIax.gif)

Custom select element usage<br>
![Element select](https://i.imgur.com/NCWK71p.gif)


## User instructions
```
Could you type `!htmltest` into chat.

Could you check the following.
If any of these are different, could you take a screenshot and send it to me.

• The output looks the same as https://i.imgur.com/KpWLIax.gif
• The green area is scrollable
• The red area is scrollable
• Inside the orange area
    • The area under "Rainbow" is changing colour smoothly
    • The area under "Moving" is moving smoothly
    • The area under "Rotated" looks like the example picture
• You can select an element from the dropdown
    • This is at the top of the green area
    • You will need to scroll to see all the options
    • Make sure the "You have selected:" text updates to the selected option
    • E.g. https://i.imgur.com/NCWK71p.gif
```
