const searchInput = document.querySelector("[placeholder='Search...']");
const button = document.querySelector("form button");
const form = document.querySelector("form");
const selectKeywords = document.querySelector("#selectKeywords");

// Access to database to get title via ajax
const availableKeywords = [];

document.addEventListener("click", (event) => {
    let ajaxInstance;
    ajaxInstance = new XMLHttpRequest();

    ajaxInstance.open("POST", "get-title-via-ajax.php");

    ajaxInstance.addEventListener("readystatechange", (event) => {
        if (ajaxInstance.readyState === 4) {
            const answer = ajaxInstance.responseText;
            const result = JSON.parse(answer);
            // console.log(result);

            for (const keys of result) {
                availableKeywords.push(keys.title);
                // console.log(availableKeywords);      // Here are the results of all keywords title
            }
        }

    });

    ajaxInstance.send();

}, {once: true});       // The event will be called only once, otherwise the data in array will get duplicated


searchInput.addEventListener("keyup", (event) => {
    let result = [];
    let input = searchInput.value;
    
    selectKeywords.innerHTML = "";     // remove duplicate keyword

    if (input.length) {
        result = availableKeywords.filter((keyword) => {
            return keyword.toLowerCase().includes(input.toLowerCase());
        });
        // console.log(result);

        isSelected = true;
        for (const keywords of result) {
            const individualKeywords = document.createElement("option");
            individualKeywords.textContent = keywords;

            if (isSelected) {
                individualKeywords.setAttribute("selected", "selected");  
                isSelected = false;
                //only the first option in the loop will be selected  
            }

            individualKeywords.addEventListener("click", (event) => {
                searchInput.value = keywords;
                selectKeywords.innerHTML = "";      // after clicking on the keyword it removes option and only the search bar will appear
            });

            selectKeywords.appendChild(individualKeywords);
        }

    }
});

// Prevents searching for keyword, if the user hadnt input anything
form.addEventListener("submit", (event) => {
    if (searchInput.value.trim() === "") {
        event.preventDefault();
    }
});

searchInput.addEventListener("keydown", (event) => {
    if (event.key == "ArrowDown") {
        selectKeywords.focus();
        // console.log(selectKeywords.options);
    }
    if (event.key == "Enter") {
        selectKeywords.focus();
        searchInput.value = selectKeywords.options[0].textContent;
        event.preventDefault();
    }
});


selectKeywords.addEventListener("keydown", (event) => {
    const firstKeyword = selectKeywords.options[0];

    if (firstKeyword && firstKeyword.selected) {
        if (event.key === "ArrowUp") {
            searchInput.focus();
            event.preventDefault();  // Makes so the cursor will be at the end of the input
        }
    }

    if (event.key === "Enter") {
        // This will access the value of the selected option
        const selectedOption = selectKeywords.options[selectKeywords.options.selectedIndex]; 
        searchInput.value = selectedOption.innerText;
    }
    
});


