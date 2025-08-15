<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${msg("emailForgotTitle")! "Forgot password"} - Pockito</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css">
</head>
<body>
    <div class="pockito-wrap">
        <div class="pockito-card">
            <div class="pockito-logo">
                <img src="${url.resourcesPath}/img/logo.svg" alt="Pockito"/><span>Pockito</span>
            </div>
            <h1 class="pockito-title">${msg("emailForgotTitle")! "Forgot password"}</h1>
            <p class="page-description">No worries! Enter your email or username and we'll send you a reset link.</p>
            
            <#if message?has_content>
                <div class="alert ${message.type}">
                    <#if message.type == 'error'>
                        <strong>Unable to reset password:</strong> ${message.summary}
                    <#elseif message.type == 'success'>
                        <strong>Success:</strong> ${message.summary}
                    <#else>
                        ${message.summary}
                    </#if>
                </div>
            </#if>
            
            <form id="kc-reset-password-form" action="${url.loginResetCredentialsUrl}" method="post">
                <div class="form-group">
                    <label class="label" for="username">${msg("usernameOrEmail")! "Email or Username"}</label>
                    <input class="input" id="username" name="username" type="text" value="${username!}" autofocus/>
                </div>
                <button class="btn btn-primary" type="submit">${msg("doSubmit")! "Send reset link"}</button>
                <div class="links">
                    <a href="${url.loginUrl}">${msg("backToLogin")! "Back to login"}</a>
                </div>
                <div class="app-links">
                    <a href="http://localhost:4200" class="app-link">← Back to Pockito App</a>
                </div>
            </form>
        </div>
    </div>
    <script src="${url.resourcesPath}/js/custom.js"></script>
</body>
</html>
