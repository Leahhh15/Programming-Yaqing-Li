###################
# 3주차 주별 과제 #
###################
# !!주의사항!!
# 각 문제에 제시되어 있는 결과 예시와 같게 나오는지 반드시 확인하세요.
# 각 문제에서 요구되는 함수나 조건 등을 반드시 꼼꼼하게 읽어보세요.
# 각 문제의 다음 줄에 각 문제당 답을 작성하여 진행하세요.
# 파일명을 task02-학번.R (예시:task02-2000000000.R)로 제출해주세요.
# 각 문제에 대한 답에는 주석을 달아 각 줄의 코드가 어떤 의미인지에 대해서 노트해두세요.
# 한글 깨짐 현상이 없도록 주의하세요.(텍스트 인코딩 설정)
# 수업 시간에 배운 내용이 아닌 경우 같은 결과 출력되더라도 감점됩니다.
# 타인과 상의하거나 답을 공유하면 0점 처리됩니다.

# 다음 표는 뷰티몰의 회원등급관리 데이터입니다.
# 
# 이름  회원등급  구매액
# aaa     VIP      35000
# bbb     gold     25000
# ccc     new      15000
# ddd     gold     23000
# eee     VIP      42000


# 1. 위 표의 내용을 아래와 같은 실행결과가 나오도록 데이터 프레임 구조로 만들어 변수에 저장하고, 출력해보세요.
# 
#   name grade purchase
# 1    a   VIP    35000
# 2    b  gold    25000
# 3    c   new    15000
# 4    d  gold    23000
# 5    e   VIP    42000

#첫 번째 방법:
name <- c("a", "b", "c", "d", "e") #name 칼럼 값 입력
grade <- c("VIP", "gold", "new", "gold", "VIP") #grade 칼럼 값 입력
purchase <- c(35000, 25000, 15000, 23000, 42000) #purchase 칼럼 값 입력
df_grade <- data.frame(name, grade, purchase) #데이터 프레임 생성
df_grade
#두 번째 방법: 데이터 프레임 생성
df_grade <- data.frame(name = c("a", "b", "c", "d", "e"),
                       grade = c("VIP", "gold", "new", "gold", "VIP"),
                       purchase = c(35000, 25000, 15000, 23000, 42000))
df_grade

# 2. 기초통계량 함수를 이용해 구매액의 최대값, 최소값, 중앙값, 평균값을 순서대로 구해보세요.

max(df_grade$purchase) #최대값max( ): 자료를 순서대로 정렬했을 때 가장 큰 값
min(df_grade$purchase) #최소값min( ): 자료를 순서대로 정렬했을 때 가장 작은 값
median(df_grade$purchase) #중앙값median( ): 자료를 순서대로 정렬했을 때 가운데 있는 값
mean(df_grade$purchase)#평균값mean( ): 자료를 모두 더한 후 개수로 나눈 값

# 3. 문자열 함수를 이용해 회원등급의 VIP를 gold로, gold를 silver로 변경한 후 아래와 같은 실행결과가 나오도록 데이터 프레임을 확인해보세요.
# 
#   name  grade purchase
# 1    a   gold    35000
# 2    b silver    25000
# 3    c    new    15000
# 4    d silver    23000
# 5    e   gold    42000

#데이터프레임명[조건식, ]
df_grade$grade <- gsub("gold", "silver", df_grade$grade)
df_grade$grade <- gsub("VIP", "gold", df_grade$grade)
df_grade

# 4. 논리식을 활용하여 회원등급이 gold이면서 구매액이 40000원 이상인 회원의 모든 정보를 아래와 같은 실행결과가 나오도록 추출하세요. 이때, 두 조건을 모두 작성하여 진행하도록 하세요.
# 
#   name grade purchase
# 5    e  gold    42000

#데이터프레임명[조건식, ]
df_grade[df_grade$grade == "gold" & df_grade$purchase >= 40000,]


# 5. 논리식을 활용하여 회원등급이 silver인 회원의 이름만 아래와 같은 실행결과가 나오도록 추출하세요.
# 
#[1] "b" "d"

#데이터프레임명[조건식, ]
df_grade[df_grade$grade == "silver", "name"]


# 6. ggplot2를 이용해 회원등급별 구매액을 상자그림(박스플랏)으로 그려보세요. 회원등급이 가로, 구매액이 세로에 표시되도록 하세요. 이때, 이미 패키지는 설치된 상태에서 Rstudio를 학습 후 재부팅했다는 가정에서 진행된다는 점을 유의하도록 하세요.

library(ggplot2) #library(패키지명):설치된 패키지를 가져오기
ggplot(df_grade, aes(x=grade, y=purchase)) + 
  geom_boxplot()
#데이터 연결하기:ggplot(data, aes(x = x축데이터, y = y축데이터))
#그래프 모양 지정하기:geom_boxplot( )
# + 기호로 그래프 연결하기
