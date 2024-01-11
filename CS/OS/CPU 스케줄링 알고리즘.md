# CPU 스케줄링 알고리즘

### 비선점형 방식
- 프로세스가 스스로 CPU 소유권을 포기하는 방식
- 강제로 프로세스를 종료하지 않음
- 컨텓스트 스위칭 부하가 적음

<br>
<details>
<summary><b><i>FCFS</i></b></summary>
<div markdown="1">
    <ul>
    <br>
    <li><b><i>가장 먼저 온 것을 가장 먼저 처리</i></b></li>
    </ul>
</div>  
</details>

<br>
<details>
<summary><b><i>SJF</i></b></summary>
<div markdown="1">
    <ul>
    <br>
    <li><b><i>실행 시간이 가장 짧은 프로세스를 먼저 실행</i></b></li>
    </ul>
</div>  
</details>

<br>

### 선점형 방식
- 현대 운영체제가 쓰는 방식
- 알고리즘에 의하여 강제로 다른 프로세스에 CPU 소유권 할당

<br>
<details>
<summary><b><i>라운드 로빈</i></b></summary>
<div markdown="1">
    <ul>
    <br>
    <li><b><i>각 프로세스는 동일한 할당 시간을 주고 그 시간 안에 끝나지 않으면 다시 준비 큐 뒤로 가는 알고리즘</i></b></li>
    </ul>
</div>  
</details>

<br>
<details>
<summary><b><i>SRF</i></b></summary>
<div markdown="1">
    <ul>
    <br>
    <li><b><i>SJF에서 중간에 더 짧은 작업이 들어오면 수행하던 프로세스를 중지하고 들어온 짧은 작업을 실행한다.</i></b></li>
    </ul>
</div>  
</details>