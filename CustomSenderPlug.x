boolean onOff = true;

if(onOff) {
    try {
        String msg = "";
        msg += "subject: " + $subject + "\n";
        msg += "pcode: " + $pcode + "\n";
        msg += "project: " + $projectName+ "\n";
        msg += "oname: " + $oname+ "\n";
        msg += "level: " + $levelText + "\n";
        msg += "eventTitle: " + $eventTitle+ "\n";
        msg += "eventMessage: " + $eventMessage+ "\n";
        msg += "value: " + $value + "\n";
        msg += "product: " + $product+ "\n";
        msg += "uuid: " + $uuid+ "\n";
        msg += "status: " + $status+ "\n";
        msg += "----msg----" + "\n";
        msg += $message;

        java.util.Map data = new java.util.HashMap();
        java.util.Map messageData = new java.util.HashMap();
        boolean msgSection = false;

        String[] lines = msg.split("\n");
        for (int i = 0; i < lines.length; i++) {
            String line = lines[i];
            if (line.trim().equals("----msg----")) {
                msgSection = true;
                continue;
            }

            String[] parts = line.split(":", 2);
            if (parts.length == 2) {
                String key = parts[0].trim();
                String value = parts[1].trim();

                if (msgSection) {
                    messageData.put(key, value);
                } else {
                    data.put(key, value);
                }
            }
        }

        if (!messageData.isEmpty()) {
            data.put("message", messageData);
        }

        java.util.Map newJsonMap = new java.util.HashMap();
        newJsonMap.put("ServiceCategory", "INFORMATION TECHNOLOGY");
        newJsonMap.put("Service", "Technology Infrastructure & Platform");
        newJsonMap.put("Category", "Whatap");
        newJsonMap.put("Subcategory", $product);
        newJsonMap.put("CustomerLocation", "HEAD OFFICE");
        newJsonMap.put("ProfileFullName", ".Whatap");
        newJsonMap.put("ProfileLink_Category", "Employee");
        newJsonMap.put("ProfileLink_RecID", "6D141BE2B3F64EE0BC369F72D752CC77");
        newJsonMap.put("Owner", ".Whatap APM");
        newJsonMap.put("Status", $subject.contains("RECOVERED") ? "RECOVERED" : "ACTIVE");
        newJsonMap.put("Subject", $subject);
        newJsonMap.put("Symptom", $eventMessage);
        newJsonMap.put("Urgency", $levelText);
        newJsonMap.put("Impact", $levelText);
        newJsonMap.put("OwnerTeam", "Service Desk");
        newJsonMap.put("Source", $projectName);

        // 새로운 JSON 출력
        StringBuffer newJson = new StringBuffer("{\n");
        java.util.Iterator newIt = newJsonMap.entrySet().iterator();
        while (newIt.hasNext()) {
            java.util.Map.Entry newEntry = (java.util.Map.Entry) newIt.next();
            newJson.append("\"").append(newEntry.getKey()).append("\": ")
                .append("\"").append(newEntry.getValue()).append("\"");
            if (newIt.hasNext()) {
                newJson.append(",\n");
            }
        }
        newJson.append("\n}");

        // 로그 함수가 정의되어야 함
        log(newJson.toString());


        // Webhook 호출
        java.net.URL url = new java.net.URL("http://localhost:9080/webhook");
        java.net.HttpURLConnection con = (java.net.HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; utf-8");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);

        java.io.DataOutputStream wr = new java.io.DataOutputStream(con.getOutputStream());
        wr.writeBytes(newJson.toString());
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        // 웹훅 호출 결과 출력
        log("HTTP Response Code: " + responseCode);
        log("HTTP Response Body: " + response.toString());


    } catch (Exception e) {
        log(">>>>>>>>>>" + e.getMessage());
        log(e);
    }
}
