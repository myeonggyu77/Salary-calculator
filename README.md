# 급여 계산기

일급/시급 단가를 입력해서 하루 단위 급여와 추가(연장) 근무수당을 자동으로 계산해주는 개인용 웹앱이에요.
빌드 과정이 필요 없는 **단일 HTML 파일**(`salary-calculator.html`)로 만들어졌고, GitHub Pages로 바로 배포해서 쓸 수 있어요.

## 기능

- 시급제 / 일급제 선택, 1일 소정근로시간·연장근무 할증률 설정
- 날짜별 근무 기록 등록 (정규 근무시간 + 추가 근무시간)
- 등록한 기록을 바탕으로 일자별 정규급여·연장근무수당·합계 자동 계산
- 월별 필터와 이번 달 합계 요약
- Supabase를 연결하면 여러 기기에서 로그인해서 같은 데이터를 사용 가능 (미연결 시 이 브라우저에만 저장되는 로컬 모드로 자동 동작)

## 처음 설정하는 방법 (초보자용, 하나씩 따라하시면 돼요)

### 1. Supabase 프로젝트 만들기

1. https://supabase.com 에서 회원가입 후 로그인해요.
2. "New project" 버튼으로 새 프로젝트를 만들어요. (이름은 자유롭게, 예: `salary-calculator`)
3. 프로젝트가 만들어지면 왼쪽 메뉴에서 **SQL Editor**를 열고, 이 저장소의 `setup.sql` 파일 내용을 전부 복사해서 붙여넣은 뒤 실행(Run)해요. 이렇게 하면 데이터를 저장할 표(테이블)와 보안 규칙이 만들어져요.
4. 왼쪽 메뉴 **Project Settings → API**로 들어가서 다음 두 값을 복사해 둬요.
   - **Project URL** (예: `https://xxxxx.supabase.co`)
   - **anon public** 키 (공개돼도 안전한 키예요)

### 2. 로그인 계정 만들기

1. 왼쪽 메뉴 **Authentication → Users**로 들어가요.
2. "Add user"로 본인이 사용할 이메일/비밀번호 계정을 하나 만들어요. (이 계정으로 앱에 로그인해요)

### 3. HTML 파일에 값 채워넣기

1. `salary-calculator.html` 파일을 열어요.
2. 상단의 `BACKEND CONFIG` 부분을 찾아요.
   ```javascript
   const SUPABASE_URL = '';
   const SUPABASE_ANON_KEY = '';
   ```
3. 따옴표 안에 1번에서 복사해둔 Project URL과 anon public 키를 각각 붙여넣고 저장해요.
   - 이 값들을 비워두면 앱은 자동으로 "로컬 모드"(이 브라우저에만 저장)로 동작해요. 여러 기기에서 쓰려면 꼭 채워주세요.

### 4. GitHub Pages로 배포하기

1. 이 저장소의 **Settings → Pages**로 들어가요.
2. Source를 "Deploy from a branch"로 설정하고, 브랜치는 `main`, 폴더는 `/ (root)`로 선택 후 저장해요.
3. 1~2분 뒤 `https://<사용자명>.github.io/<저장소이름>/salary-calculator.html` 주소로 접속하면 앱이 열려요.

## 파일 구조

| 파일 | 역할 |
|---|---|
| `salary-calculator.html` | 앱 본체 (전부 이 파일 하나) |
| `setup.sql` | Supabase 테이블·보안 규칙 생성 스크립트 (최초 1회 실행) |
