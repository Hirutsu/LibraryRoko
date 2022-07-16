const selectNewsPaperInfo = document.getElementById('GetNewsPaper');

const inputFields = ["ISSN", "Title", "PublicationHouse", "Date",];

selectNewsPaperInfo.addEventListener('change', (event) => {
    const opt = event.target.value;
    const config = {};

    opt.split(',').forEach((curInputValue, index) => {
        config[inputFields[index]] = curInputValue;
    })

    inputFields.forEach((inputId) => {
        const curInput = document.getElementById(inputId);
        if (curInput.name === "Date") {
            const date = config[inputId];
            const [month, day, year] = date.split('/');
            curInput.value = `${year}-${month}-${day}`;
        }
        else {
            curInput.value = config[inputId];
        }
    })
})