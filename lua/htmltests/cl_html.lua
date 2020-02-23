HTMLTESTS_HTML = [===[
<!doctype html>
<html>

<head>
  <meta charset="UTF-8" />
  <!-- BOOTSTRAP STYLES -->
  <style>
    body {
      position: absolute;
      left: 0;
      top: 0;
      bottom: 0;
      right: 0;
      width: 100%;
      height: 100%;
      padding: 0;
      margin: 0;
      color: black;
      font-family: 'Trebuchet MS', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
      font-weight: bold;
      overflow: scroll;
    }

    *,
    ::after,
    ::before {
      box-sizing: border-box;
    }
  </style>

  <!-- Awesomium 'mixins' -->
  <style>
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
  </style>

  <!-- Custom select -->
  <style>
    .select-input {
      position: relative;
      cursor: pointer;
      border-radius: 0;
      background-color: rgb(32, 32, 32);
      border: 0;
      color: white;
      padding: .375rem .75rem;
    }

    .select-input .select-display {
      padding-right: 20px;
    }

    .select-input .select-display:after {
      position: absolute;
      content: "";
      top: 14px;
      right: 10px;
      width: 0;
      height: 0;
      border: 6px solid transparent;
      border-color: white transparent transparent transparent;
    }

    .select-input.open .select-display:after {
      border-color: transparent transparent white transparent;
      top: 7px;
    }

    .select-input .select-options {
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
      background: rgb(32, 32, 32);
      border: 1px solid rgb(11, 11, 11);
      display: none;
    }

    .select-input.open .select-options {
      display: block;
    }

    .select-input .select-options .select-option {
      padding: 7px 5px;
    }

    .select-input .select-options .select-option:hover {
      color: white;
      background-color: rgb(0, 120, 215);
    }
  </style>
</head>

<body>
  <div class="flex flex-direction-column" style="height: 100%">
    <div class="flex-grow" style="background: green;padding:10px;overflow:auto">
      <div id="custom-select"></div>
      <div>You have selected: <span id="custom-select-value"></span></div>

      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
        eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
        ullamco laboris nisi ut aliquip ex ea commodo consequat.
      </p>
    </div>
    <div style="background: orange;padding:10px;overflow:auto">
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
        dolore magna aliqua.
      </p>
      <div style="display: inline-block">
        Rainbow
        <div id="rainbow-div" class="transition-all-1s-linear" style="width: 100px;height:50px;background-color: red;">
        </div>
      </div>
      <div style="display: inline-block">
        Moving
        <div id="moving-div" class="transition-all-1s-linear" style="background: #999;width:100px;height:0;">
        </div>
      </div>
      <div style="display: inline-block">
        Rotated
        <div
          style="-webkit-transform: rotate(45deg);transform: rotate(45deg);width:25px;height:25px;background-color: white;margin-top: 10px;margin-left:10px;">
        </div>
      </div>
    </div>
    <div class="flex-grow" style="background: red;padding:10px;overflow:auto">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
      magna aliqua. At quis risus sed vulputate odio ut enim blandit volutpat. Sed risus ultricies tristique nulla
      aliquet enim tortor at auctor. Ac felis donec et odio pellentesque diam volutpat commodo. Nunc non blandit massa
      enim nec dui. Sit amet commodo nulla facilisi nullam vehicula ipsum. Adipiscing bibendum est ultricies integer
      quis auctor. Varius quam quisque id diam vel. Vitae aliquet nec ullamcorper sit amet risus nullam eget.
      Consectetur adipiscing elit ut aliquam purus sit amet. Id diam maecenas ultricies mi eget mauris pharetra.
      Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. Lacus suspendisse faucibus interdum
      posuere lorem ipsum dolor. Turpis nunc eget lorem dolor sed viverra ipsum. Massa vitae tortor condimentum lacinia
      quis vel eros. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Semper eget duis at
      tellus at urna.
    </div>
  </div>

  <script>
    window.addEventListener('load', function (event) {
      RenderSelect();

      ChangeColour();
      setInterval(ChangeColour, 1000)
      ChangeDirection();
      setInterval(ChangeDirection, 1000)
    });

    var rainbowColours = ["red", "orange", "yellow", "green", "blue", "purple"];
    var currentColourIndex = 0;

    function ChangeColour() {
      currentColourIndex++;
      if (currentColourIndex >= rainbowColours.length) currentColourIndex = 0;
      document.getElementById("rainbow-div").style.backgroundColor = rainbowColours[currentColourIndex];
    }

    var currentHeight = 0;
    function ChangeDirection() {
      if (currentHeight == 0) currentHeight = 50;
      else currentHeight = 0;
      document.getElementById("moving-div").style.height = currentHeight + "px";
    }

    function RenderSelect() {
      var optionText = ["One", "This is the second option", "Three", "Four"]
      var options = [];

      for (var i = 0; i < optionText.length; i++) {
        options.push({
          text: optionText[i]
        });
      }

      var dropdown = document.getElementById("custom-select");
      dropdown.innerHTML = "";
      AppendSelect(dropdown, options, function (newValue) {
        document.getElementById("custom-select-value").innerHTML = newValue;
      });
    }
  </script>

  <!-- Custom select -->
  <script>
    function findAncestorStartingWithMe(element, classname) {
      var currentElement = element;
      while (!currentElement.classList.contains(classname) && (currentElement = currentElement.parentElement));
      return currentElement;
    }

    function AppendSelect(parent, options, callback) {
      var hasOptions = typeof (options) == "object" && options.length > 0;

      var selectElement = document.createElement("div");
      selectElement.classList.add("select-input")
      selectElement.classList.add("form-control")
      selectElement.classList.add("noselect")

      var selectedOptionDisplayElement = document.createElement("div");
      selectedOptionDisplayElement.classList.add("select-display")
      if (hasOptions) {
        selectedOptionDisplayElement.innerHTML = options[0].text;

        var value = options[0].value;
        if (value == "undefined" || value == null)
          value = options[0].text;
        selectElement.setAttribute("data-select-value", value)
        callback(value);
      }
      selectElement.appendChild(selectedOptionDisplayElement);

      var longestOptionLength = 0;

      if (hasOptions) {
        var optionsWrapperElement = document.createElement("div");
        optionsWrapperElement.classList.add("select-options");

        for (var i = 0; i < options.length; i++) {
          var option = options[i];
          var optionElement = document.createElement("div");
          optionElement.classList.add("select-option");
          optionElement.innerHTML = option.text;
          optionElement.setAttribute("data-select-value", option.value);

          optionElement.addEventListener("click", function (e) {
            var parentSelect = findAncestorStartingWithMe(e.target, "select-input");
            var selectedOptionElement = findAncestorStartingWithMe(e.target, "select-option");

            var text = selectedOptionElement.textContent;
            var value = selectedOptionElement.getAttribute("data-select-value");
            if (value == "undefined" || value == null)
              value = text;

            var display = parentSelect.querySelector(".select-display");
            display.innerHTML = text;

            var currentValue = parentSelect.getAttribute("data-select-value");
            if (currentValue != value) {
              parentSelect.setAttribute("data-select-value", value);
              callback(value);
            }
          });

          if (option.text.length > longestOptionLength) longestOptionLength = option.text.length;

          optionsWrapperElement.appendChild(optionElement);
        }
        selectElement.appendChild(optionsWrapperElement);
      }


      selectElement.addEventListener("click", function (e) {
        e.stopPropagation();
        var select = findAncestorStartingWithMe(e.target, "select-input");
        select.classList.toggle("open");
      });

      selectElement.style.width = (longestOptionLength * 10) + "px";
      parent.appendChild(selectElement);
    }

    window.addEventListener('click', function (e) {
      var openSelects = document.getElementsByClassName("select-input open");
      for (var i = 0; i < openSelects.length; i++) {
        const select = openSelects[i];
        select.classList.remove("open");
      }
    });
  </script>
</body>

</html>
]===]