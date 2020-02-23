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
* Requires webkit for CSS gradients
    * https://webkit.org/blog/175/introducing-css-gradients/
    * [Example](https://gist.github.com/BadgerCode/30280286900542f9909925ca0b267f04)

# Mixins
These provide the required prefixes for specific HTML features.
```css
.noselect {
    -khtml-user-select: none;
    user-select: none;
}

.select {
    -khtml-user-select: text;
    user-select: text;
}

.flex {
    display: -webkit-box;
    display: flex;
}

.flex-direction-column {
    -webkit-box-direction: normal;
    -webkit-box-orient: vertical;
    flex-direction: column;
}

.flex-grow {
    -webkit-box-flex: 1;
    flex-grow: 1;
    -webkit-flex-shrink: 1;
    flex-shrink: 1;
    -webkit-flex-basis: 0;
    flex-basis: 0;
    /*flex: 1;*/
}

.transition-all-1s-linear {
    -webkit-transition: all 1s ease-out;
    transition: all 1s linear;
}

.gradient-red-to-green-row {
    background: -webkit-gradient(linear, left top, right top, from(#8c230c), to(#588c01));
    background: linear-gradient(to right, #8c230c, #588c01);
}
```


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
