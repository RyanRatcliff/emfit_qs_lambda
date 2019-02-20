const QS = require('emfit-qs')
const AWS = require('aws-sdk');

const s3 = new AWS.S3({
    accessKeyId: process.env.AWS_ACCESS_KEY,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY
});

let qs = new QS();

exports.handler = function(event, context, callback) {
    qs.login(process.env.EMFIT_USER, process.env.EMFIT_PASSWORD).then(function (data) {
        console.log(data.device_settings.length + ' devices found for ' + data.user.email)


        // get latest data for first device found
        let deviceId = data.device_settings[0].device_id;
        qs.latest(deviceId).then(function (sleep) {
            let d = new Date(sleep.time_end * 1000);
            let fileName = Date.now() + ".json";

            const params = {
                Bucket: process.env.EMFIT_BUCKET, // pass your bucket name
                Key: fileName, // file will be saved as testBucket/contacts.csv
                Body: JSON.stringify(sleep, null, 2)
            };
            s3.upload(params, function(s3Err, data) {
                if (s3Err) throw s3Err;
                console.log(`File uploaded successfully at ${data.Location}`)
            });

            console.log('Latest sleep ended at ' + d + ' with score: ' + sleep.sleep_score)
        })
    }).catch(function (error) {
        console.error(error)
    })
};