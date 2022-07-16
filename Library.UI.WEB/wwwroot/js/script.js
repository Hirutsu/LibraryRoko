$(document).ready(function(){
    $('.multi_select').selectpicker();
})

async function sendOptions(selector) {
    const selectedOptions = selector.selectedOptions;
    const data = []
    for (let item of selectedOptions) {
        console.log(item);
        data.push(item.innerHTML);
    }
    return data
}

const selector = document.getElementById("GetAuthors");

const submitButton = document.getElementById('AddProduct');
submitButton.addEventListener("click", (event) => {
    sendOptions(selector).then((data) => {
        const hidden = document.getElementById("hidden-input");
        hidden.value = data;
    })
})

const submitAuthorAdd = document.getElementById('author-add')
submitAuthorAdd.addEventListener("click", (event) => {
    let selectedOption = selector.options[selector.selectedIndex];
    // 2)
    let authorFirName = document.getElementById('author-fir-name');
    let authorSecName = document.getElementById('author-sec-name');
    let newOption = new Option(`${authorFirName.value} ${authorSecName.value}`);
    selector.appendChild(newOption);
    // 3)
    newOption.selected = true;
})


const form = document.getElementById('Add')
const formFields = form.elements;

let submitBtn = document.getElementById("AddProduct")
submitBtn.addEventListener('click', clearStorage);

function clearStorage() {
    sessionStorage.clear();
}
 
function changeHandler() {
    sessionStorage.setItem(this.name, this.value);
}

function attachEvents() {
    for (let i = 0; i < formFields.length; i++) {
        formFields[i].addEventListener('change', changeHandler);
    }
}


function checkStorage() {
    for (let i = 0; i < formFields.length; i++) {
        if (formFields[i].type != 'submit') {
            if (formFields[i].type != 'hidden') {
                formFields[i].value = sessionStorage.getItem(formFields[i].name);
            }
        }
    }
    attachEvents();
}

checkStorage();