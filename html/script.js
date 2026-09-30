document.addEventListener('DOMContentLoaded', function() {
    window.addEventListener('message', function(event) {
        if (event.data.action === 'openApp') {
            document.getElementById('app').style.display = 'block';
        }
    });

    document.getElementById('closeButton').addEventListener('click', function() {
        document.getElementById('app').style.display = 'none';
        fetch('https://gta-online/closeApp', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({})
        }).then(resp => resp.json());
    });
});