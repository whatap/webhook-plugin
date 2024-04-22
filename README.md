# Notihub CustomSenderPlugin Example

notihub에서 알림이 발생할 때마다 실행되는 플러그인의 예시입니다. 이 코드의 목적은 알림의 내용을 웹훅에 전달하는 것입니다. 자세한 동작 과정은 다음과 같습니다.

- 알림 메시지 파싱 후 json으로 변경(`parsed_example.json` 참고)
- 고객사 웹훅에서 요구하는 양식으로 변경(`example_output.json` 참고)
- webhook 호출(`localhost:9080/webhook`)

플러그인 사용법은 다음과 같습니다.

- `CustomSenderPlug.x`를  `/data/whatap/plugin` 에 복사합니다. 파일의 경로와 이름 모두 변경해선 안 됩니다.
- `/data/whatap/logs/notihub.log 파일에서 `[WA133] CustomSenderPlug loaded` 라는 내용이 있고, 관련 에러 로그가 없다면 정상적으로 로드된 것입니다.
- webhook 서버를 빌드하고 실행합니다
  - (mockserver 디렉토리에서) `go build` 
  - `nohup ./mockserver &`

mockserver는 웹훅을 수신한 뒤 플러그인이 보낸 body를 그대로 리턴합니다.  웹훅이 성공적으로 수행되면  `/data/whatap/logs/plugin.log` 에서 다음과 같은 로그를 확인할 수 있습니다.

```txt
[2024-04-22 01:08:47,754 GMT] HTTP Response Code: 200
[2024-04-22 01:08:47,754 GMT] HTTP Response Body: {"ProfileFullName": ".Whatap","Status": "ACTIVE","Impact": "Warning","Owner": ".Whatap APM","ServiceCategory": "INFORMATION TECHNOLOGY","Category": "Whatap","Service": "Technology Infrastructure & Platform","CustomerLocation": "HEAD OFFICE","Subject": "[Warning][INFRA][alert-test][bspark-dev][Memory Used > 1 %]","Source": "alert-test","ProfileLink_RecID": "6D141BE2B3F64EE0BC369F72D752CC77","OwnerTeam": "Service Desk","Subcategory": "SMS","ProfileLink_Category": "Employee","Urgency": "Warning","Symptom": "Memory Used > 1 %"}
```

플러그인을 수정하고 싶다면 다음의 사항을 주의하세요

- import 문 대신 package full path를 사용해야 합니다.
- 코드 안에서 클래스나 메소드를 선언할 수 없습니다.
- 제네릭을 사용할 수 없는 버그가 있습니다. HashMap등의 컬렉션은 java 1.4 스타일로 사용해야 합니다.