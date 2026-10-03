###################
# 5주차 주별 과제 #
###################

#1. mtcars 데이터를 불러와서 다음 내용을 작성하세요.
#1.1. dplyr 패키지의 함수를 사용하여 무게(wt)가 가벼운 순으로 상위 5종의 자동차를 1위부터 5위 순서대로(가장 가벼운 것부터 5개) 출력하세요.
library(dplyr) #library(패키지명):설치된 패키지를 가져오기
data("mtcars") #데이터 불러오기:data(“데이터세트이름”)
mtcars %>%
  arrange(wt) %>%
  head(5)      #변수를 오름차순 -> 데이터 앞부분 보기:상위 5종

#1.2. dplyr 패키지의 함수를 사용하여 엔진 실린더(cyl)가 6인 자동차들 중에 연비(mpg)가 
#높은 상위 5종의 자동차를 상위 5위부터 1위 순서대로(가장 연비가 높은 것이 마지막에 오도록) 출력하세요.
mtcars %>%
  filter(cyl == 6) %>%
  arrange(-mpg) %>%
  head(5) %>%
  arrange(mpg)

#2. mtcars 데이터를 계속 이용하여 다음과 같은 파생 변수를 생성해보세요.
#2.1. dplyr 패키지의 함수를 사용하여 year 칼럼을 추가하고 모든 데이터 값은 1974가 되도록 출력하세요. 
#(같은 값으로 할당할 때는 해당하는 값을 등호로 변수 또는 칼럼명과 연결하면 됩니다.)
mtcars %>%
  mutate(year = 1974) #mutate( ) 변수 추가

#2.2. dplyr 패키지의 함수를 사용하여 am의 값이 0이면 automatic, 1이면 manual인 trans1 변수를 추가하세요.
mtcars <- mtcars %>%
  mutate(trans1 = ifelse(am == 0, "automatic", "manual"))

#2.3. 내장함수를 사용하여 am의 값이 0이면 automatic, 1이면 manual인 trans2 변수를 추가하세요.
mtcars <- mtcars %>%
  mutate(trans2 = ifelse(am == 0, "automatic", "manual"))
View(mtcars)

#3. mtcars 데이터를 계속 이용하여 다음 문제를 해결해보세요.
#3.1. dplyr 패키지의 함수를 사용하여 trans1의 값(“automatic”, “manual”)에 따른 
#연비(mpg)의 평균, 배기량(disp)의 중앙값을 한번에 출력하세요.
mtcars %>%
  group_by(trans1) %>%   
  summarise(mean_mpg = mean(mpg),   
            median_disp = median(disp))
#group_by( ) 집단별로 나누기: 그룹별 통계치 산출
#summarise( ) 통계치 산출: 평균, 중앙값

#3.2. dplyr 패키지의 함수를 사용하여 엔진 실린더(cyl) 별로 각각 몇 대의 자동차가 있는지 한번에 출력해보세요.
mtcars %>%
  group_by(cyl) %>%
  summarise(cnt_cyl = n()) # n( ) 함수를 사용하여 개수를 구할 수 있다

#4.1. 실습에서 사용된 데이터 프레임 df_a에 대하여 dplyr 패키지의 left_join( ), 
#inner_join( ), full_join( ) 함수를 사용하여 df_ex1과 결합하여 각각 df_left, 
#df_inner, df_full에 저장해보고, 어떤 차이가 있는지 간단히 서술하세요.

# df_a                            # df_ex1
# name birthyear                  # name gen
#   a   1984                      #  b    F
#   b   1989                      #  c    M
#   c   1985                      #  e    F
#   d   1991                      #  d    M
df_a <- data.frame(name = c("a", "b", "c", "d"),
                   birthyear = c(1984, 1989, 1985, 1991))
df_ex1 <- data.frame(name = c("b", "c", "e", "d"),
                     gen = c("F", "M", "F", "M"))
df_a
df_ex1

##left_join은 왼쪽에 있는 데이터 프레임의 key를 기준으로 결합
df_left <- left_join(df_a, df_ex1, by = "name")
df_left
##inner_join은 가장 간단한 조인 유형으로 key가 되는 변수 값이 동일할 때만 가로로 결합
df_inner <- inner_join(df_a, df_ex1, by = "name")
df_inner
##full_join은 기준으로 정한 변수를 기준으로 모든 데이터를 가로로 결합
df_full <- full_join(df_a, df_ex1, by = "name")
df_full

#4.2. dplyr 패키지의 bind_rows( ) 함수를 사용하여 df_ex1에 df_ex2의 3개 데이터를 추가해보세요.
# df_ex2
# name gen
#  f    M
#  g    M
#  h    F
df_ex2 <- data.frame(name = c("f", "g", "h"),
                     gen = c("F", "M", "F"))
df_ex2
df_all <- bind_rows(df_ex1, df_ex2)    #bind_rows( ) 세로로 결합
df_all

#4.3. dplyr 패키지의 데이터 결합 함수를 사용하여 아래 데이터프레임으로 파생변수 vs_name을 mtcars에 추가하세요. 
#이때, 인덱스(행이름)이 사라지더라도 신경쓰지 말고 그대로 진행하세요.
# df_vs_name
# vs  vs_name
# 0   V-shaped
df_vs_name <- data.frame(vs = 0, vs_name = "V-shaped")
df_vs_name
mtcars <- left_join(mtcars, df_vs_name, by = "vs")
View(mtcars)

#5. airquality 데이터를 불러와서 다음을 해결하세요.
#5.1. 태양복사 에너지(Solar.R)의 관측값에 몇 개의 결측치가 있는지 확인하세요.
data("airquality")
View(airquality)
table(is.na(airquality$Solar.R)) #특정변수의 결측치 수 확인: table(is.na(데이터이름$변수이름)

#5.2. dplyr 패키지의 함수를 사용하여 Solar.R의 결측치를 모두 제외하고 평균을 구하세요.
airquality %>%
  summarise(mean_Solar.R = mean(Solar.R , na.rm = T)) #함수 파라미터로 결측치 제거하기: , na.rm = T

airquality %>%
  filter(!is.na(Solar.R)) %>%   #결측치가 없는 행 출력하기: 데이터이름 %>% filter(!is.na(변수이름))
  summarise(mean_Solar.R = mean(Solar.R)) # 평균 계산

#5.3. Solar.R의 결측치를 평균으로 대체하세요. (단, 평균은 소수점 첫째자리에서 반올림한 정수값을 직접 숫자 입력하여 사용하세요.)
df_mean_Solar.R <- airquality %>%
  summarise(mean_Solar.R = mean(Solar.R , na.rm = T)) #Solar.R의 평균값 계산하기
mean_Solar.R_rounded <- round(df_mean_Solar.R[1,]) #반올림평균
mean_Solar.R_rounded
airquality$Solar.R <- ifelse(is.na(airquality$Solar.R), mean_Solar.R_rounded, airquality$Solar.R) 
airquality  
#결측치을 평균값으로 바꾸기:데이터이름$변수이름 <- ifelse(is.na(데이터이름$변수이름), mean, 데이터이름$변수이름)

#5.4. dplyr 패키지의 함수를 사용하여 결측치를 평균으로 대체한 Solar.R의 평균을 구하세요.
airquality %>%
  summarise(mean_Solar.R = mean(Solar.R))

#6. airquality 데이터를 이용하여 다음을 해결하세요.
#6.1. 변수 Ozone에 몇 개의 결측치가 있는지 알아보세요.
data("airquality")
table(is.na(airquality$Ozone))

#6.2. 변수 Ozone에 대한 박스플랏(상자그림)으로 이상치(극단치)가 있는지 어느 경계를 벗어난 극단치인지 확인하고, 
#통계치를 확인하여 어떤 값을 벗어난 값이 이상치(극단치)인지 확인하세요.
boxplot(airquality$Ozone)
x <- boxplot(airquality$Ozone) #연속형의 이상치 찾기: boxplot( )
x

#6.3. 변수 Ozone의 모든 이상치(극단치)를 결측치로 바꾸고, 몇 개의 결측치가 추가됐는지 살펴보세요. 
#(단, 극단치 경계값은 직접 숫자 입력하여 사용하세요. 그리고 극단치가 최소 극단치 경계를 벗어났는지 혹은 최대 극단치 경계를 벗어났는지에 따라 해당하는 부분으로만 진행하도록 하세요.)
airquality$Ozone <- ifelse(airquality$Ozone < 1 | airquality$Ozone > 122, NA, airquality$Ozone)
sum(is.na(airquality$Ozone)) 
##정상범위 확인 후, 이 범위를 벗어나는 이상치를 결측치(NA)로 처리
#data <- ifelse(data < 정상범위최소값 | data > 정상범위최대값, NA, data)

#6.4 dplyr 패키지의 함수를 사용하여 변수 Ozone의 결측치를 제외한 값들의 중앙값을 구하세요.
airquality %>% 
  filter(!is.na(Ozone)) %>% 
  select(Ozone) %>%
  summarise(median_Ozone = median(Ozone))

