<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${msg("doLogIn")! "Sign in"} - Pockito</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css">
</head>
<body>
    <div class="pockito-wrap">
        <div class="pockito-card">
            <div class="pockito-logo">
                <img src="${url.resourcesPath}/img/logo.svg" alt="Pockito"/><span>Pockito</span>
            </div>
            <h1 class="pockito-title">${msg("doLogIn")! "Sign in"}</h1>
            <#if message?has_content><div class="alert ${message.type}">${message.summary}</div></#if>
            <form id="kc-form-login" action="${url.loginAction}" method="post">
                <div class="form-group">
                    <label class="label" for="username">${msg("usernameOrEmail")! "Email or Username"}</label>
                    <input class="input" id="username" name="username" type="text" value="${username!}" autofocus/>
                </div>
                <div class="form-group">
                    <label class="label" for="password">${msg("password")! "Password"}</label>
                    <div class="password-input-wrapper">
                        <input class="input" id="password" name="password" type="password"/>
                        <button type="button" class="password-toggle" onclick="togglePassword('password')">
                            <svg class="eye-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                                <circle cx="12" cy="12" r="3"/>
                            </svg>
                        </button>
                    </div>
                </div>
                <button class="btn btn-primary" name="login" id="kc-login" type="submit">${msg("doLogIn")! "Sign in"}</button>
                <div class="links">
                    <a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")! "Forgot password?"}</a>
                </div>
                <#if realm.registrationAllowed?? && realm.registrationAllowed>
                <div class="register-section">
                    <p class="register-text">Don't have an account?</p>
                    <a href="${url.registrationUrl}" class="btn btn-secondary">${msg("doRegister")! "Create account"}</a>
                </div>
                </#if>
                <div class="app-links">
                    <a href="http://localhost:4200" class="app-link">← Back to Pockito App</a>
                </div>
                <div class="footer">Secure sign-in · Pockito</div>
            </form>
        </div>
    </div>
    <script src="${url.resourcesPath}/js/custom.js"></script>
    <script>
        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const button = input.nextElementSibling;
            const icon = button.querySelector('.eye-icon');
            
            if (input.type === 'password') {
                input.type = 'text';
                icon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';
            } else {
                input.type = 'password';
                icon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
            }
        }
    </script>
</body>
</html>
