# 급여 계산기

일급/시급 단가를 입력해서 하루 단위 급여와 추가(연장) 근무수당을 자동으로 계산해주는 개인용 웹앱이에요.
빌드 과정이 필요 없는 **단일 HTML 파일**(`salary-calculator.html`)로 만들어졌고, GitHub Pages로 바로 배포해서 쓸 수 있어요.

## 기능

- 시급제 / 일급제 선택, 1일 소정근로시간·연장근무 할증률 설정
- 날짜별 근무 기록 등록 (정규 근무시간 + 추가 근무시간)
- 등록한 기록을 바탕으로 일자별 정규급여·연장근무수당·합계 자동 계산
- 월별 필터와 이번 달 합계 요약
- Supabase를 연결하면 여러 기기에서 로그인해서 같은 데이터를 사용 가능 (미연결 시 이 브라우저에만 저장되는 로컬 모드로 자동 동작)

## Supabase 백엔드

이 앱은 **포트폴리오 원장(`portfolio-tracker`)과 같은 Supabase 프로젝트**를 함께 사용해요. 새 프로젝트를 따로 만들지 않고, 같은 프로젝트 안에 `salary_data`라는 새 테이블만 추가해서 데이터가 서로 섞이지 않게 분리했어요.

`salary-calculator.html` 상단의 `BACKEND CONFIG`에 이미 값이 채워져 있어서 별도 설정 없이 바로 로그인해서 쓸 수 있어요. **로그인 계정도 포트폴리오 원장과 동일한 이메일/비밀번호**를 그대로 쓰면 돼요 (Supabase Auth는 프로젝트 단위라서 같은 계정을 공유해요).

### 최초 1회 — 테이블 생성

Supabase 대시보드 → **SQL Editor** → 이 저장소의 `setup.sql` 내용을 붙여넣고 **Run**을 눌러 `salary_data` 테이블을 만들어 주세요. (기존 `portfolio_data` 테이블에는 영향 없어요.)

### GitHub Pages로 배포하기

1. 이 저장소의 **Settings → Pages**로 들어가요.
2. Source를 "Deploy from a branch"로 설정하고, 브랜치는 `main`, 폴더는 `/ (root)`로 선택 후 저장해요.
3. 1~2분 뒤 `https://<사용자명>.github.io/<저장소이름>/salary-calculator.html` 주소로 접속하면 앱이 열려요.

## 파일 구조

| 파일 | 역할 |
|---|---|
| `salary-calculator.html` | 앱 본체 (전부 이 파일 하나) |
| `setup.sql` | Supabase 테이블·보안 규칙 생성 스크립트 (최초 1회 실행) |
