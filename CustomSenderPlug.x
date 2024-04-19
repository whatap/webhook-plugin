boolean on = true;

if(on) {
    String requestURL="http://localhost:7710/rest/api/v1/evm/create";
    try {
        String msg = "noti-plugin-test: " + $message;
        log("noti-plugin-test:" + msg);
        java.lang.System.out.println(msg);
    } catch (Exception e) {
        log(">>>>>>>>>>" + e.getMessage());
        log(e);
    }
}
