<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Info - Pockito</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css">
</head>
<body>
    <div class="pockito-wrap">
        <div class="pockito-card">
            <div class="pockito-logo">
                <img src="${url.resourcesPath}/img/logo.svg" alt="Pockito"/><span>Pockito</span>
            </div>
            <h1 class="pockito-title">${message.summary! "Info"}</h1>
            <p class="footer">${message.detail! ""}</p>
            <div class="links" style="justify-content:center;margin-top:1rem">
                <a href="${url.loginUrl}">${msg("backToLogin")! "Back to login"}</a>
            </div>
        </div>
    </div>
    <script src="${url.resourcesPath}/js/custom.js"></script>
</body>
</html>
