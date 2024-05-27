boolean onOff = false;
//if(($levelText.equals("Critical") && onOff)) {
//info
////////////////
if($levelText.equals("Info")) {
    java.io.FileWriter fileWriter = null;
    try {
    fileWriter = new java.io.FileWriter("Info_one.txt");
    fileWriter.write($levelText);
    fileWriter.flush();
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
        //logger.info(" {} ", $message);
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
        newJsonMap.put("Category", "WhaTap");
        newJsonMap.put("Subcategory", "Low Disk");
        newJsonMap.put("CustomerLocation", "HEAD OFFICE");
        newJsonMap.put("ProfileFullName", ".WhaTap");
        newJsonMap.put("ProfileLink_Category", "Employee");
        newJsonMap.put("ProfileLink_RecID", "002EB834724C4339AD07C096342C4396");
        newJsonMap.put("Owner", ".Whatap APM");
        newJsonMap.put("Status", "Logged");
        newJsonMap.put("Subject", "Request Clean Disk");
        newJsonMap.put("Symptom", "{ProblemID}<br>{ProblemDetailsText}<br>{ProblemImpact}");
        newJsonMap.put("Urgency", "Medium");
        newJsonMap.put("Impact", "High");
        newJsonMap.put("OwnerTeam", "Service Desk");
        newJsonMap.put("Source", "Network Monitor");
        // New JSON output
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
        // log function must be defined
        log(newJson.toString());
    fileWriter = new java.io.FileWriter("Info_two.txt");
        fileWriter.write($levelText);
        fileWriter.flush();
        // Call the webhook
        java.net.URL url = new java.net.URL("https://servicedesk.adira.co.id/HEAT/api/odata/businessobject/incidents");
        java.net.HttpURLConnection con = (java.net.HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; utf-8");
        con.setRequestProperty("Accept", "application/json");
        con.setRequestProperty("Authorization", "rest_api_key=18DF42D24CF44F4E8305911E792D8B55");
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
        // Result of the webhook call
        log("HTTP Response Code: " + responseCode);
        log("HTTP Response Body: " + response.toString());
    fileWriter = new java.io.FileWriter("Info_three.txt");
        fileWriter.write($levelText);
        fileWriter.flush();
    } catch (Exception e) {
        log(">>>>>>>>>>" + e.getMessage());
        log(e);
    }
}
//Warning
////////////////
if($levelText.equals("Warning")) {
    java.io.FileWriter fileWriter = null;
    try {
    fileWriter = new java.io.FileWriter("Warning_one.txt");
    fileWriter.write($levelText);
    fileWriter.flush();
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
        //logger.info(" {} ", $message);
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
        newJsonMap.put("Category", "WhaTap");
        newJsonMap.put("Subcategory", "Low Disk");
        newJsonMap.put("CustomerLocation", "HEAD OFFICE");
        newJsonMap.put("ProfileFullName", ".WhaTap");
        newJsonMap.put("ProfileLink_Category", "Employee");
        newJsonMap.put("ProfileLink_RecID", "002EB834724C4339AD07C096342C4396");
        newJsonMap.put("Owner", ".Whatap APM");
        newJsonMap.put("Status", "Logged");
        newJsonMap.put("Subject", "Request Clean Disk");
        newJsonMap.put("Symptom", "{ProblemID}<br>{ProblemDetailsText}<br>{ProblemImpact}");
        newJsonMap.put("Urgency", "Medium");
        newJsonMap.put("Impact", "High");
        newJsonMap.put("OwnerTeam", "Service Desk");
        newJsonMap.put("Source", "Network Monitor");
        // New JSON output
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
        // log function must be defined
        log(newJson.toString());
    fileWriter = new java.io.FileWriter("Warning_two.txt");
        fileWriter.write($levelText);
        fileWriter.flush();
        // Call the webhook
        java.net.URL url = new java.net.URL("https://servicedesk.adira.co.id/HEAT/api/odata/businessobject/incidents");
        java.net.HttpURLConnection con = (java.net.HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; utf-8");
        con.setRequestProperty("Accept", "application/json");
        con.setRequestProperty("Authorization", "rest_api_key=18DF42D24CF44F4E8305911E792D8B55");
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
        // Result of the webhook call
        log("HTTP Response Code: " + responseCode);
        log("HTTP Response Body: " + response.toString());
    fileWriter = new java.io.FileWriter("Warning_three.txt");
        fileWriter.write($levelText);
        fileWriter.flush();
    } catch (Exception e) {
        log(">>>>>>>>>>" + e.getMessage());
        log(e);
    }
}
//Critical
/////////////////
if($levelText.equals("Critical")) {
    java.io.FileWriter fileWriter = null;
    try {
	fileWriter = new java.io.FileWriter("Critical_one.txt");
	fileWriter.write($levelText);
	fileWriter.flush();
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
        //logger.info(" {} ", $message);
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
        newJsonMap.put("Category", "WhaTap");
        newJsonMap.put("Subcategory", "Low Disk");
        newJsonMap.put("CustomerLocation", "HEAD OFFICE");
        newJsonMap.put("ProfileFullName", ".WhaTap");
        newJsonMap.put("ProfileLink_Category", "Employee");
        newJsonMap.put("ProfileLink_RecID", "002EB834724C4339AD07C096342C4396");
        newJsonMap.put("Owner", ".Whatap APM");
        newJsonMap.put("Status", "Logged");
        newJsonMap.put("Subject", "Request Clean Disk");
        newJsonMap.put("Symptom", "{ProblemID}<br>{ProblemDetailsText}<br>{ProblemImpact}");
        newJsonMap.put("Urgency", "Medium");
        newJsonMap.put("Impact", "High");
        newJsonMap.put("OwnerTeam", "Service Desk");
        newJsonMap.put("Source", "Network Monitor");
        // New JSON output
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
        // log function must be defined
        log(newJson.toString());
	fileWriter = new java.io.FileWriter("Critical_two.txt");
        fileWriter.write($levelText);
        fileWriter.flush();
        // Call the webhook
        java.net.URL url = new java.net.URL("https://servicedesk.adira.co.id/HEAT/api/odata/businessobject/incidents");
        java.net.HttpURLConnection con = (java.net.HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; utf-8");
        con.setRequestProperty("Accept", "application/json");
        con.setRequestProperty("Authorization", "rest_api_key=18DF42D24CF44F4E8305911E792D8B55");
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
        // Result of the webhook call
        log("HTTP Response Code: " + responseCode);
        log("HTTP Response Body: " + response.toString());
	fileWriter = new java.io.FileWriter("Critical_three.txt");
        fileWriter.write($levelText);
        fileWriter.flush();
    } catch (Exception e) {
        log(">>>>>>>>>>" + e.getMessage());
        log(e);
    }
}
