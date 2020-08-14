import 'amazon-connect-streams';

const targetNode = document.getElementById('sidebar');
const config = {
  attributes: false,
  childList: true,
  subtree: true,
  characterData: true,
};

function addPhonebutton() {
  const phoneNumberList = document.querySelectorAll('.phone-number');
  phoneNumberList.forEach((phoneNumber) => {
    const callButton = document.createElement('span');
    callButton.innerHTML = "<i class='call-button fa fa-phone'></i>";
    callButton.addEventListener('click', (event) => {
      var phNumber = event.currentTarget.parentElement.innerText;
      launchCCP(phNumber);
    });
    phoneNumber.insertAdjacentElement('beforeend', callButton);
  });
}

function callBack(mutationsList, observer) {
  for (let mutation of mutationsList) {
    if (mutation.addedNodes.length > 1) {
      const phoneNumberList = targetNode.querySelectorAll('.phone-number');
      phoneNumberList.forEach((phoneNumber) => {
        const callButton = document.createElement('span');
        callButton.innerHTML = "<i class='call-button fa fa-phone'></i>";
        callButton.addEventListener('click', (event) => {
          var phNumber = event.currentTarget.parentElement.innerText;
          launchCCP(phNumber);
        });
        phoneNumber.insertAdjacentElement('beforeend', callButton);
      });
    }
  }
}

const observer = new MutationObserver(callBack);

addPhonebutton();

if (document.body.contains(targetNode)) {
  observer.observe(targetNode, config);
}
