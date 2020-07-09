import 'amazon-connect-streams';

const instanceURL = 'https://demo-covid.awsapps.com/connect/ccp-v2';

const containerDiv = document.querySelector('#containerDiv');
var phNumber = document.querySelector("meta[name='phone_number']").content;

connect.core.initCCP(containerDiv, {
  ccpUrl: instanceURL /*REQUIRED*/,
  loginPopup: true /*optional, default TRUE*/,
  region: 'us-east-1' /*REQUIRED for chat, optional otherwise*/,
  softphone: {
    /*optional*/ allowFramedSoftphone: true /*optional*/,
    disableRingtone: false /*optional*/,
    // ringtoneUrl: "./ringtone.mp3"  /*optional*/
  },
});

if (phNumber) {
  connect.agent(function (agent) {
    var endpoint = connect.Endpoint.byPhoneNumber(phNumber);
    var agent = new connect.Agent();
    agent.connect(endpoint, {
      success: function () {
        console.log('outbound call connected');
      },
      failure: function (err) {
        console.log(err);
      },
    });
  });
}
