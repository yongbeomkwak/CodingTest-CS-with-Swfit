# TCP/IP 4계층 모델 

### OSI 7계층
- 애플리케이션 계층
- 프레젠테이션 계층
- 세션 계층
- 전송 계층
- 네트워크 계층
- 데이터 링크 계층
- 물리 계층

### TCP/IP
- 애플리케이션 계층: 애플리케이션 + 프레젠테이션 + 세션
- 전송 계층: 전송 계층 
- 인터넷 계층: 네트워크 계층
- 링크 계층: 데이터 링크 + 물리 

<br>

<details>
<summary><b><i>애플리케이션 계층</b></i></summary>
<div markdown="1">
    <ul>
      <li><b><i>응용 프로그램이 사용되는 프로토콜</i></b></li>
      <li>FTP : 장치간 파일을 전송하는데 사용되는 표준 통신 프로토콜</li>
      <li>SSH : 보안되지 않은 네트워크에서 안전하게 운영하기 위한 암호화 네트워크 프로토콜</li>
      <li>HTTP : WWW을 위한 데이터 통신의 기초이자 웹사이트 이용을 위한 프로토콜</li>
      <li>SMTP : 전자 메일 전송을 위한 표준 통신 프로토콜</li>
      <li>DNS : 도메인 이름과 IP 주소를 매핑해주는 서버</li>
    </ul>
</div>
</details>

<br>

<details>
<summary><b><i>전송 계층</b></i></summary>
<div markdown="1">
    <ul>
      <li><b><i>애플리케이션과 인터넷 계층 사이의 데이터가 전달을 중계</i></b></li>
      <li>TCP : 순서를 보장, 보내기 전 반드시 연결 , 가상회선 패킷 교환 방식 , 이메일 , 채팅에 사용 </li>
      <li>TCP는 연결할 때 3-웨이 , 해제할 때는 4-웨이 핸드쉐이크 과정이 발생함 </li>
      <li>UDP : 순서 보장 X , 수신 여부 확인 X , 데이터그램 패킷 교환 방식 , 스트르밍 게임에 사용</li>
    </ul>

</div>
</details>

<br>

<details>
<summary><b><i>인터넷 계층</b></i></summary>
<div markdown="1">
    <ul>
      <li><b><i>네트워크 패킷을 IP주소로 지정된 목적지로 전송하는 계층</i></b></li>
      <li> IP , ARP , ICMP 등이 있음, 제대로 받았는지 보장 x</li>
    </ul>

</div>
</details>

<br>

<details>
<summary><b><i>링크 계층</b></i></summary>
<div markdown="1">
    <ul>
      <li><b><i>실질적으로 데이터를 주고받는 규칙을 정하는 계층</i></b></li>
    </ul>

</div>
</details>

