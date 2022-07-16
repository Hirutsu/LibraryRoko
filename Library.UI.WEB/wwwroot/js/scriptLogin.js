const submitLogin = document.getElementById('login-user')
submitLogin.addEventListener("click", (event) => {

    const login = document.getElementById('login');
    const pass = document.getElementById('pass');
    const regex = /_{2,}/;

    if (regex.test(login.value)) {
        window.confirm("invalid in login, u have 2 and more symbols (_)");
        event.preventDefault();
    }

    if (login.value.toLowerCase().includes(pass.value.toLowerCase())) {
        window.confirm('login in Password');
        event.preventDefault();
    }

    for (var i = 0; i < pass.value; i++) {
        if (pass.value.charCodeAt(i) < 32) {
            window.confirm('Symbol in pass has less 32 code');
            event.preventDefault();
        }
    }
})