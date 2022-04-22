import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

exports.getLocation = functions.https.onRequest(async (req, res) => {
    try {
        const {name, latitude, longitude, speed, course} = req.body;
        //console.log(JSON.stringify(req).toString());
        //console.log(JSON.stringify(req.query).toString());
        const docs = await admin.firestore().collection('boats').where('name', '==' , name).get();
        docs.forEach(doc => {
            doc.ref.set({'latitude': latitude, 'longitude': longitude, 'speed': speed, 'course': course}, {merge: true})
        });
        res.json({result: true});
    } catch (error) {
        console.log(error);
        res.json({result: false});
    }
});