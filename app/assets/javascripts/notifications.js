// Функция для воспроизведения звука уведомления
function playNotificationSound() {
    let audio = new Audio("/audio/notification.mp3");

    audio.play();
}

// Функция для отображения уведомления в браузере
function showBrowserNotification(chatTitle, messageContent) {
    if (!("Notification" in window)) {
        alert("This browser does not support desktop notification");
    } else if (Notification.permission === "granted") {
        new Notification(chatTitle, { body: messageContent });
    } else if (Notification.permission !== "denied") {
        Notification.requestPermission().then(permission => {
            if (permission === "granted") {
                new Notification(chatTitle, { body: messageContent });
            }
        });
    }
}

document.addEventListener("turbo:load", function() {
    // Обработчик события "show-notification" для Turbo-Streams
    document.addEventListener("show-notification", (event) => {
        const { chatTitle, messageContent } = event.detail;
        playNotificationSound();
        showBrowserNotification(chatTitle, messageContent);
    });
});