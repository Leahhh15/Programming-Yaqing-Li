###################
# 4주차 주별 과제 #
###################
#
## 1. R에서 제공하는 내부 데이터 세트 중 CO2 데이터 세트의 데이터를 다음과 같이 조회해보세요.이때, 데이터 세트를 가져오는 방법과 문제에서 표기된 데이터 세트 이름에 주의하세요.
#
# 1.1. CO2의 전체 데이터를 조회하세요.

data('CO2') #데이터 불러오기:data(“데이터세트이름”)
CO2

# 1.2. CO2의 행과 열의 개수(차원)를 조회하세요.

dim(CO2) #데이터 세트 데이터 차원 보기:dim(데이터이름)

# 1.3. CO2의 앞부분 10개의 데이터만 조회하세요.

#데이터 앞부분 보기:head(데이터이름, n = 행의 수)
#첫 번째 방법
head(CO2, 10)
#두 번째 방법
head(CO2, n = 10)

# 1.4. CO2의 뒷부분 10개의 데이터만 조회하세요.

#데이터 뒷부분 보기:tail(데이터이름, n = 행의 수
tail(CO2, n = 10)

# 1.5. CO2의 데이터 내부구조를 조회하세요.

str(CO2) #데이터 세트 데이터 내부구조 보기:str(데이터이름)

# 1.6. CO2의 기초통계량 요약 정보를 조회하세요.

summary(CO2) #데이터 세트 기초통계량 요약 보기:summary(데이터이름)



##2. R에서 제공하는 내부 데이터 세트 중 state.x77 데이터에 대해 다음 코드를 작성하세요.이때, 우리가 배운 방법으로 데이터 세트를 가져올 수 없다면, 도움말을 실행시켜 방법을 찾아보세요.
#
#2.1. state.x77 데이터 세트의 데이터 타입을 확인하고 데이터 프레임 형태가 아닌 경우, 데이터 프레임 형태로 불러와서 st 변수에 저장(할당)하세요.

#state.x77 데이터 타입 확인하기
class(state.x77)
#데이터 프레임 형태로 불러와서 st 변수에 저장
? as.data.frame
st <- as.data.frame(state.x77)
st

# 2.2. state.x77 데이터 세트의 인구(population)와 수입(income) 열의 값들만 추출하여 “state_x77.txt” 파일로 저장하세요.

# 인구와 수입 열만 추출
st_subset <- st[, c("Population", "Income")]
st_subset
# "state_x77.txt" 파일로 저장
write.table(st_subset, "state_x77.txt", sep = ",")

# 2.3. 위 항목에서 작성한 “state_x77.txt” 파일을 읽어서 ds 변수에 저장한 후 ds의 내용을 출력하세요.

#텍스트 파일 읽기: 데이터프레임이름 <- read.csv(“저장된경로/저장된파일이름“, header = T)
ds <- read.csv("state_x77.txt", header = T)
ds



## 3. R에서 제공하는 내부 데이터 세트 중 iris 데이터에 대해 다음 작업을 수행 하세요.
#
# 3.1. iris 데이터 세트의 변수명(칼럼명) 확인하는 함수를 사용하여 변수명(칼럼명)을 출력하세요.

names(iris) #데이터 세트 변수명 보기

# 3.2. iris 데이터 세트의 “Sepal.Length”, “Sepal.Width”, “Species” 열의 모든 데이터를 iris_subset 변수에 저장하고, names( ) 함수를 이용하여 변수명을 “V1”, “V2”, “V3”으로 변경하세요.

iris_subset <- iris[, c("Sepal.Length", "Sepal.Width", "Species")]
names(iris_subset) <- c("V1", "V2", "V3")  #names(데이터이름) <- c(“새변수명1”, “새변수명2”, “새변수명3”, ...)
iris_subset

# 3.3. iris_subset 데이터 세트의 변수명을 dplyr 패키지의 rename( ) 함수를 사용하여 “Length”, “Width”, “Variety”로 변경하여 iris_subset2 변수로 저장하세요.

#dplyr 패키지의 rename( ) 함수: rename(데이터세트, 새변수명 = 기존변수명)
library(dplyr)
iris_subset2 <- rename(iris_subset, 
                       Length = V1, 
                       Width = V2, 
                       Variety = V3)
iris_subset2



## 4. R에서 제공하는 내부 데이터 세트 중 women 데이터를 파악하고, 다음과 같이 파생 변수를 생성 하세요.
#
# 4.1. women의 데이터 내부구조와 데이터 앞부분을 출력하세요.

#데이터 세트 데이터 내부구조 보기
str(women)
#데이터 앞부분 보기
head(women)

# 4.2. women의 height와 weight 변수를 height_in와 weight_lb로 변수명을 변경하세요.

names(women) <- c("height_in", "weight_lb") #names( ) 함수: names(데이터이름) <- c(“새변수명1”, “새변수명2”, “새변수명3”, ...)
women

# 4.3. women의 height_in와 weight_lb 값을 센티미터(cm)와 킬로그램(kg)으로 변환하여 height_cm와 weight_kg으로 파생 변수를 생성하세요. (1in = 2.54cm, 1lb = 0.453592kg)

women$height_cm <- women$height_in * 2.54 
women$weight_kg <- women$weight_lb * 0.453592
women


# 4.4. women의 height_cm와 weight_kg를 이용하여 bmi 파생 변수를 생성하세요. 
# (bmi = 체중(kg) / (신장(m) * 신장(m)))

women$bmi <- women$weight_kg/((women$height_cm/100)*(women$height_cm/100))
women

# 4.5. bmi 값에 따라 비만 여부를 result 파생 변수로 생성하세요.
# (bmi: 20이하(저체중), 20초과25이하(표준), 25초과(과체중))

#중첩 조건문을 활용하여 파생 변수 만들기 -> ifelse( ) 함수를 여러 겹으로
women$result <- ifelse(women$bmi <= 20, "저체중",
                       ifelse(women$bmi > 20 & women$bmi <= 25, "표준", "과체중"))
women



## 5. mtcars 데이터를 이용하여 다음에 해당하는 R코드를 작성하세요.
#
# 5.1. 엔진 실린더(cyl) 변수가 6인 데이터만 추출해보세요.

#첫 번째 방법
mtcars[mtcars$cyl == 6,]
#두 번째 방법
mtcars %>%
  filter(cyl == 6) #filter( ) 행 추출: 조건에 맞는 관측 값만 추출

# 5.2. cyl가 4이고 연비(mpg)가 25보다 큰 데이터만 추출해보세요.
#첫 번째 방법
mtcars[mtcars$cyl == 4 & mtcars$mpg > 25,]
#두 번째 방법
mtcars %>%
  filter(cyl == 4 & mpg > 25) #filter( ) 행 추출: 조건에 맞는 관측 값만 추출

# 5.3. 변속기(am)가 1(manual)인 자동차의 mpg, cyl, disp를 추출해보세요.

mtcars %>%
  filter(am == 1) %>%
  select(mpg, cyl, disp) #select( ) 열 추출: 필요한 변수만 추출
  


## 6. mtcars 데이터를 이용하여 다음 내용을 작성하세요.
#
# 6.1. 연비(mpg)가 높은 순으로 모든 자동차 데이터를 출력하세요.

#arrange( ) 함수는 데이터를 오름차순 또는 내림차순으로 정렬할 때 사용
#내림차순으로 정렬 desc( )를 함께 사용
#desc는 마이너스(-) 기호로 대체할 수 있다.
#첫 번째 방법
mtcars %>%
  arrange(desc(mpg))
#두 번째 방법
mtcars %>%
  arrange(-mpg)

# 6.2. 엔진 실린더(cyl)를 기준으로 오름차순 정렬하고, 같은 값인 경우 연비(mpg)를 기준으로 내림차순정렬하여 연비(mpg)만 출력하세요

#첫 번째 방법
mtcars %>%
  arrange(cyl, desc(mpg)) %>%
  select(mpg)
#두 번째 방법
mtcars %>%
  arrange(cyl, -mpg) %>%
  select(mpg)

