####################
#중간고사 대체 과제#
####################

# 1.1 ggplot2 패키지 안에 있는 실습데이터 txhousing을 df_tx라는 이름의 
# 데이터 프레임 형태로 불러오세요. (이때, 데이터만 불러오도록 하세요.)
library(ggplot2)
df_tx <- data.frame(txhousing)
View(df_tx)

# 1.2 txhousing의 도움말(매뉴얼)을 살펴보세요. 데이터와 각 변수에 대한 
# 설명을 보고 정리해서 간단히 주석으로 남기도록 하세요.
?txhousing
# txhousing 데이터 설명:
# 데이터는 텍사스 주(Texas)의 부동산 거래 정보
# city: 도시명 
# date(year, month, date): 날짜
# sales: 거래건
# volume: 거래량
# median: 주택가격중앙값
# listings: 총 활성 목록
# inventory: "월 재고": 현재 판매 속도로 모든 현재 목록을 판매하는 데 걸리는 시간.

# 1.3 데이터 파악하기에서 배운 모든 함수를 사용해서 데이터를 파악하세요. 
# 이때 출력된 결과를 보고 파악한 내용을 간단히 주석으로 남기도록 하세요. 
# 특히 데이터 내부구조를 반드시 확인하여 기재하세요.

# 데이터 앞부분 보기(데이터의 첫 6개 행 출력)
head(df_tx)

# 데이터 뒷부분 보기(데이터의 마지막 6개 행 출력)
tail(df_tx)

# 데이터 세트 변수명 보기
names(df_tx)

# 데이터 세트 데이터 내부구조 보기
str(df_tx) 
# txhousing 데이터는 8602개의 행과 9개의 열로 이루어진 데이터프레임이다.
# city : 문자형
# year : 정수형 
# month : 정수형 
# sales : 수치형 
# volume : 수치형 
# median : 수치형 
# listings : 수치형 
# inventory : 수치형 
# date : 수치형 형태의 연도와 월 정보를 합친 값

# 데이터 세트 데이터 차원 보기
dim(df_tx)  # 8602개의 행과 9개의 열로 구성

# 데이터 세트 기초통계량 요약 보기
summary(df_tx)


# 2.1 모든 변수에 대하여 각각 결측치가 있는 변수인지 확인하세요. 
table(is.na(df_tx$city)) #없다
table(is.na(df_tx$year)) #없다
table(is.na(df_tx$month)) #없다
table(is.na(df_tx$sales)) #있다
table(is.na(df_tx$volume)) #있다
table(is.na(df_tx$median)) #있다
table(is.na(df_tx$listings)) #있다
table(is.na(df_tx$inventory)) #있다
table(is.na(df_tx$date)) #없다

# 2.2 sales, volume, median 변수에 대해서 내장함수를 사용하여 결측치들을 0으로 변환하세요.
df_tx$sales <- ifelse(is.na(df_tx$sales), 0, df_tx$sales)
df_tx$volume <- ifelse(is.na(df_tx$volume), 0, df_tx$volume)
df_tx$median <- ifelse(is.na(df_tx$median), 0, df_tx$median)

# 2.3 극단치가 있는지 확인이 필요한 모든 변수에 대해서만 각각 극단치가 있는지 확인하세요.
# 극단치가 있는 변수들에 대해서 극단치의 경계를 확인하고 주석으로 기록하세요.
boxplot(df_tx$sales)
boxplot(df_tx$volume)
boxplot(df_tx$median)
boxplot(df_tx$listings)
boxplot(df_tx$inventory)

boxplot(df_tx$sales)$stats
# 수염 아래 경계선: 0, 수염 위 경계선: 969

boxplot(df_tx$volume)$stats
# 수염 아래 경계선: 0, 수염 위 경계선: 152978919

boxplot(df_tx$median)$stats
# 수염 아래 경계선: 50000, 수염 위 경계선: 228700

boxplot(df_tx$listings)$stats
# 수염 아래 경계선: 0, 수염 위 경계선: 6355

boxplot(df_tx$inventory)$stats
# 수염 아래 경계선: 0.80, 수염 위 경계선: 13.00


# 3.1 제공된 cpi CSV파일을 cpi 라는 이름의 데이터프레임으로 불러오세요. 
# (변수명 일부가 깨져서 나온다면 fileEncoding="UTF-8-BOM" 파라미터를 설정하세요.)
cpi <- read.csv("cpi.csv", fileEncoding="UTF-8-BOM")

# 3.2 아래의 표는 month_name에 대해서 숫자로 변환하기 위한 표입니다. 
# month_list라는 이름의 데이터 프레임으로 만들어보세요.
month_list <- data.frame(month_name=c("jan", "feb", "mar", "apr", "may", "jun", 
                                      "jul", "aug", "sep", "oct", "nov", "dec"),
                         month=c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))

# 3.3 month_list 데이터 프레임을 활용하여 cpi 데이터에 month 라는 변수가 
# 오른쪽에 파생변수로 추가되도록 하세요.
library(dplyr)
cpi <- left_join(cpi, month_list, by = "month_name")

# 3.4 추가된 cpi 데이터에서 month_name 칼럼을 dplyr 함수를 사용하여 제외한 뒤 재할당하세요.
cpi <- cpi %>% 
  select(year, cpi, month)

# 3.5 앞선 작업을 마친 cpi 데이터를 활용하여 df_tx 데이터에 cpi 라는 변수가 
# 오른쪽에 파생변수로 추가되도록 하세요.
View(cpi)
df_tx <- df_tx %>%
  left_join(cpi, by = c("year", "month"))


# 4.1 각 도시별 빈도수를 내장함수를 사용하여 빈도표로 확인하세요.
table(df_tx$city)

# 4.2 dplyr 함수를 사용하여 도시이름의 abc순서대로 정렬되고, 
# 이때 같은 이름인 경우 월별순으로 정렬되고, 같은 도시, 같은 월일 경우, 
# 연도순으로 정렬되도록 하여 df_tx_ar에 할당하세요.
df_tx_ar <- df_tx %>%
  arrange(city, month, year)
df_tx_ar

# 4.3 df_tx_ar에서 city, year, month, sales, volume 변수만 추출하여 df_tx_pre에 할당하세요.
df_tx_pre <- df_tx_ar %>%
  select(city, year, month, sales, volume)
df_tx_pre

# 4.4 전년 동월 대비 증감률을 파생변수로 만들기 위해 피벗테이블을 다음 장의 
# 코드를 복사 붙여넣기 한 뒤 실행하여 생성하고, 피벗테이블이 무엇인지 파악해보세요.
install.packages('tidyr')
library(tidyr)
df_tx_pv <- df_tx_pre |> pivot_wider(names_from = year, 
                                     values_from = c(sales, volume))
View(df_tx_pv)

?pivot_wider
# 긴 데이터에서 넓은 데이터로 피벗
# names_from, values_from:
# - names_from 인자에는 행으로 들어갈 변수를, values_from 인자에는 값으로 들어갈 
#   변수를 넣어주면 해당 변수들이 열로 정리된다. 
# 피벗테이블은 데이터프레임에서 특정 변수를 행과 열에 각각 배치하여 
# 데이터를 요약하고 분석하기 쉽게 만든 표 형식의 데이터이다.


# 5.1 전년 동월 대비 증감률을 파생변수로 아래 예시를 참고하여 각 연도 각 변수별로 
# 만들어 df_tx_pv_new에 할당하세요.
#sales_inc_2000 = 0
#sales_inc_2001 = ((sales_2001 - sales_2000) / sales_2000) * 100
#(즉, sales_inc_2000부터 volume_inc_2015까지 만들면 됩니다.)
library(dplyr)

df_tx_pv_new <- df_tx_pv %>%
  mutate(sales_inc_2000 = 0,
         sales_inc_2001 = ((sales_2001 - sales_2000) / sales_2000) * 100,
         sales_inc_2002 = ((sales_2002 - sales_2001) / sales_2001) * 100,
         sales_inc_2003 = ((sales_2003 - sales_2002) / sales_2002) * 100,
         sales_inc_2004 = ((sales_2004 - sales_2003) / sales_2003) * 100,
         sales_inc_2005 = ((sales_2005 - sales_2004) / sales_2004) * 100,
         sales_inc_2006 = ((sales_2006 - sales_2005) / sales_2005) * 100,
         sales_inc_2007 = ((sales_2007 - sales_2006) / sales_2006) * 100,
         sales_inc_2008 = ((sales_2008 - sales_2007) / sales_2007) * 100,
         sales_inc_2009 = ((sales_2009 - sales_2008) / sales_2008) * 100,
         sales_inc_2010 = ((sales_2010 - sales_2009) / sales_2009) * 100,
         sales_inc_2011 = ((sales_2011 - sales_2010) / sales_2010) * 100,
         sales_inc_2012 = ((sales_2012 - sales_2011) / sales_2011) * 100,
         sales_inc_2013 = ((sales_2013 - sales_2012) / sales_2012) * 100,
         sales_inc_2014 = ((sales_2014 - sales_2013) / sales_2013) * 100,
         sales_inc_2015 = ((sales_2015 - sales_2014) / sales_2014) * 100,
         volume_inc_2000 = 0,
         volume_inc_2001 = ((volume_2001 - volume_2000) / volume_2000) * 100,
         volume_inc_2002 = ((volume_2002 - volume_2001) / volume_2001) * 100,
         volume_inc_2003 = ((volume_2003 - volume_2002) / volume_2002) * 100,
         volume_inc_2004 = ((volume_2004 - volume_2003) / volume_2003) * 100,
         volume_inc_2005 = ((volume_2005 - volume_2004) / volume_2004) * 100,
         volume_inc_2006 = ((volume_2006 - volume_2005) / volume_2005) * 100,
         volume_inc_2007 = ((volume_2007 - volume_2006) / volume_2006) * 100,
         volume_inc_2008 = ((volume_2008 - volume_2007) / volume_2007) * 100,
         volume_inc_2009 = ((volume_2009 - volume_2008) / volume_2008) * 100,
         volume_inc_2010 = ((volume_2010 - volume_2009) / volume_2009) * 100,
         volume_inc_2011 = ((volume_2011 - volume_2010) / volume_2010) * 100,
         volume_inc_2012 = ((volume_2012 - volume_2011) / volume_2011) * 100,
         volume_inc_2013 = ((volume_2013 - volume_2012) / volume_2012) * 100,
         volume_inc_2014 = ((volume_2014 - volume_2013) / volume_2013) * 100,
         volume_inc_2015 = ((volume_2015 - volume_2014) / volume_2014) * 100)

# 5.2 df_tx_pv_new 에서 첫번째, 두번째, 35번째부터 50번째까지의 칼럼만 내장함수로 
# 추출하여 df_tx_sales_inc에 할당하고, 첫번째, 두번째, 51번째부터 66번째까지의 
# 칼럼만 내장함수로 추출하여 df_tx_volume_inc 할당세요.    
df_tx_sales_inc <- df_tx_pv_new %>%
  select(1:2, 35:50)

df_tx_volume_inc <- df_tx_pv_new %>%
  select(1:2, 51:66)

# 5.3 전년 동월 대비 증감률을 파생변수로 추가하기 위한 사전작업 다음단계로 
# 다음 장의 코드를 복사 붙여넣기 한 뒤 실행하여 생성하고, 데이터가 어떻게 
# 변형되었는지 파악해보세요.
df_tx_sales_inc_long <- df_tx_sales_inc |> pivot_longer(c(3:18), 
                                                        names_to = 'cate', 
                                                        values_to = 'sales_inc')
df_tx_sales_inc_long_new <- df_tx_sales_inc_long %>% 
  filter(!(is.na(sales_inc) & cate == 'sales_inc_2015' & month %in% c(8, 9, 10, 11, 12)))
df_tx_sales_inc_long_new$sales_inc <- ifelse(is.finite(df_tx_sales_inc_long_new$sales_inc), 
                                             df_tx_sales_inc_long_new$sales_inc, 0)
df_tx_volume_inc_long <- df_tx_volume_inc |> pivot_longer(c(3:18), 
                                                          names_to = 'cate', 
                                                          values_to = 'volume_inc')
df_tx_volume_inc_long_new <- df_tx_volume_inc_long %>% 
  filter(!(is.na(volume_inc) & cate == 'volume_inc_2015' & month %in% c(8, 9, 10, 11, 12)))
df_tx_volume_inc_long_new$volume_inc <- ifelse(is.finite(df_tx_volume_inc_long_new$volume_inc), 
                                               df_tx_volume_inc_long_new$volume_inc, 0)

?pivot_longer
# df_tx_sales_inc_long: 월별 매출 증감률을 long format으로 변환한 데이터
# df_tx_sales_inc_long_new: 월별 매출 증감률을 long format으로 변환한 데이터 에서 
#                           NA 값을 제거하고 0으로 대체한 데이터
# df_tx_volume_inc_long: 월별 거래량 증감률을 long format으로 변환한 데이터
# df_tx_volume_inc_long_new: 월별 거래량 증감률을 long format으로 변환한 데이터 
#                            에서 NA 값을 제거하고 0으로 대체한 데이터


# 5.4 df_tx 데이터에 새로운 변수 sales_inc와 volume_inc를 추가하세요. 
# 이때, 결합 함수를 사용하지말고 단순하게 값이 추가되도록 내장 함수로 할당하세요.
df_tx$sales_inc <- df_tx_sales_inc_long_new$sales_inc
df_tx$volume_inc <- df_tx_volume_inc_long_new$volume_inc
View(df_tx)

# 6.1 거래건 증감률 상위(높게 증가한) 5위부터 1위까지의 도시명, 연도, 월, 
# 거래건 증감률을 출력하세요.
df_tx %>%
  arrange(sales_inc) %>%
  tail(5)%>%
  select(city, year, month, sales_inc)

# 6.2 도시별 median(주택가격중앙값)의 평균을 구하고, 
# 평균이 높은 상위 1위부터 10위까지의 도시명만 출력하세요.
df_tx %>%
  group_by(city) %>%
  summarize(mean_median= mean(median)) %>%
  arrange(desc(mean_median)) %>%
  head(10) %>%
  select(city)

# 6.3 도시별 거래건 증감률과 거래량 증감률의 평균을 구하고, 
# 두 증감률이 모두 음수(마이너스)인 도시명만 출력하세요. 
# 이때, 주석에 해당 도시명을 남기도록 하세요.
df_tx_mean <- df_tx %>% 
  group_by(city) %>% 
  summarize(mean_sales_inc = mean(sales_inc),
            mean_volume_inc = mean(volume_inc))
df_tx_mean

df_tx_negative <- df_tx_mean %>% 
  filter(mean_sales_inc < 0 & mean_volume_inc < 0)
df_tx_negative
#Brazoria County, Harlingen, San Marcos


# 7.1 거래량 증감률을 기준으로 아래 등급표를 참고하여 파생변수 
# volume_inc_grade를 dplyr 함수를 사용하여 추가하세요.
df_tx <- df_tx %>%
  mutate(volume_inc_grade = 
           ifelse(volume_inc >= 50, "A_high_increase",
                  ifelse(volume_inc > 0, "B_increase",
                         ifelse(volume_inc == 0, "C_maintain",
                                ifelse(volume_inc > -50, "D_decrease","E_high_decrease")))))

View(df_tx)

# 7.2 거래량 증감률 등급별 각각 몇 월씩 있는지 내장함수로 빈도표를 확인해보세요.
table(df_tx$volume_inc_grade, df_tx$month)

# 7.3 거래량 증감률 등급별 주택가격중앙값을 막대그래프로 나타내보세요. 
# 이때 막대그래프는 주택가격중앙값의 평균이 낮은 것부터 왼쪽에서 오른쪽으로 보여지게 하세요.
library(ggplot2)

df_tx %>%
  group_by(volume_inc_grade) %>%
  summarize(mean_median = mean(median)) %>%
  ggplot(aes(x = reorder(volume_inc_grade, mean_median), y = mean_median)) +
  geom_col() 


# 8.1 도시명, 거래건, 연도 칼럼에서 도시별 그리고 연도별 거래건의 평균을 구하세요. 
# 이때, 거래건의 평균은 반올림하여 정수로 표시하세요. 
# 그리고 거래건의 평균이 700 이상인 데이터만 df_cityyear_mean_sales에 할당하세요
df_cityyear_mean_sales <- df_tx %>%
  select(city, sales, year) %>%
  group_by(city, year) %>%
  summarize(mean_sales = round(mean(sales), digits = 0)) %>%
  filter(mean_sales >= 700)

df_cityyear_mean_sales

# 8.2 df_cityyear_mean_sales 데이터에서 가로축이 연도, 세로축이 거래건의 평균, 
# 색구분이 도시명이 되도록 하는 선그래프를 그리고, 선그래프에서 거래건 평균이 
# 꾸준히 많은 두 도시명을 주석으로 기록하세요.

ggplot(data = df_cityyear_mean_sales, aes(x = year, y = mean_sales, color = city)) +
  geom_line()
#Houston, Dallas

