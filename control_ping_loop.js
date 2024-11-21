const { spawn } = require('child_process');
const fs = require('fs');

let pingLoopProcess = null;

const startPingLoop = () => {
    if (!pingLoopProcess) {
        pingLoopProcess = spawn('bash', ['/storage/emulated/0/ping_loop.sh']);
        console.log('Memulai Ping loop.');

        pingLoopProcess.stdout.on('data', (data) => {
            console.log(`stdout: ${data}`);
        });

        pingLoopProcess.stderr.on('data', (data) => {
            console.error(`stderr: ${data}`);
        });

        pingLoopProcess.on('close', (code) => {
            console.log(`Ping loop keluar dengan kode ${code}`);
            pingLoopProcess = null;
            // Automatically restart the ping loop if it stops
            startPingLoop();
        });
    } else {
        console.log('Ping loop sudah berjalan.');
    }
};

const stopPingLoop = () => {
    if (pingLoopProcess) {
        pingLoopProcess.kill();
        console.log('Hentikan Ping loop.');
        pingLoopProcess = null;
    } else {
        console.log('Ping loop sudah tidak berjalan.');
    }
};

const getLogs = () => {
    const logFilePath = '/storage/emulated/0/network_log.txt';
    fs.readFile(logFilePath, 'utf8', (err, data) => {
        if (err) {
            console.error('Gagal membaca catatan file:', err);
            return;
        }
        const logs = data.trim().split('\n').slice(-5).join('\n');
        console.log('Catatan terbaru:\n', logs);
    });
};

// Start the ping loop initially
startPingLoop();

// Periodically display the last 5 log entries every minute
setInterval(getLogs, 60000);