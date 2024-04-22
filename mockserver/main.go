package main

import (
    "io/ioutil"
    "net/http"
    "log"
)

func echoHandler(w http.ResponseWriter, r *http.Request) {
    // 요청 메서드 확인
    if r.Method != http.MethodPost {
        http.Error(w, "Only POST method is allowed", http.StatusMethodNotAllowed)
        return
    }

    // 요청 바디 읽기
    body, err := ioutil.ReadAll(r.Body)
    if err != nil {
        http.Error(w, "Error reading body", http.StatusInternalServerError)
        return
    }
    defer r.Body.Close()

    // 응답으로 바디 내용 그대로 출력
    w.Write(body)
}

func main() {
    http.HandleFunc("/webhook", echoHandler) // "/webhook" 경로에 핸들러 등록
    log.Fatal(http.ListenAndServe(":9080", nil)) // 8080 포트에서 서버 실행
}
