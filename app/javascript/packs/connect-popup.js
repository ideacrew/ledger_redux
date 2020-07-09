var popupWindow = null;

launchCCP = function (phoneNumber) {
  if (phoneNumber) {
    var number = phoneNumber.replace(/[^\d]/g, '');
  }

  var windowFeatures =
    'menubar=no,width=320px,height=470px,toolbar=no,location=no,resizable=yes,scrollbars=no,status=no,left=800%,top=300%';
  if (popupWindow && !popupWindow.closed && !phoneNumber) {
    popupWindow.focus();
  } else {
    popupWindow = windowObjectReference = window.open(
      '/connect_streams/connect?phone_number=' + number,
      'Amazon Connect',
      windowFeatures
    );
  }
};
