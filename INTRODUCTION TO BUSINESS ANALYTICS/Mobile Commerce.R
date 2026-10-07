########################################################
## Interim Test 1: Mobile Commerce
## Datasets: OnlineMember.dta, MobileMember.dta, MobileOrder.dta
########################################################

# Set working directory
getwd()
setwd("C:/Users/yb/Dropbox/1. Teaching/data for teaching/mobile commerce/")

library(foreign)

# Read adopter / non-adopter member data
OnlineMember <- read.dta("OnlineMember.dta")
head(OnlineMember, n = 30)
MobileMember <- read.dta("MobileMember.dta")
head(MobileMember)

#1 Compare average age of adopters vs non-adopters.
#  Is there an age difference between the two groups?
class(OnlineMember$Birth)
as.numeric(OnlineMember$Birth)
OnlineMember$Birth <- as.numeric(as.character(OnlineMember$Birth))
OnlineMember$Age   <- 2011 - OnlineMember$Birth
head(OnlineMember, n = 30)
mean(OnlineMember$Age)
mean(OnlineMember$Age, na.rm = TRUE)

MobileMember$Birth <- as.numeric(as.character(MobileMember$Birth))
MobileMember$Age   <- 2011 - MobileMember$Birth
head(MobileMember, n = 30)
mean(MobileMember$Age, na.rm = TRUE)

t.test(OnlineMember$Age, MobileMember$Age, na.rm = TRUE)
t.test(OnlineMember$Age, MobileMember$Age)

# Formula syntax version
tmp <- data.frame(
  adopter = c(rep("1", times = length(MobileMember$Age)),
              rep("0", times = length(OnlineMember$Age))),
  age     = c(MobileMember$Age, OnlineMember$Age))
str(tmp)
t.test(tmp$age ~ tmp$adopter)

#2 Compare proportion of female between adopters and non-adopters.
#  Is there a gender difference between the two groups?
OnlineMemberGender <- subset(OnlineMember, OnlineMember$Gender != "Z")
head(OnlineMemberGender)
MobileMemberGender <- subset(MobileMember, MobileMember$Gender != "Z")
head(MobileMemberGender)

table(OnlineMemberGender$Gender)
table(MobileMemberGender$Gender)

F <- c(17426, 14395)
M <- c(12388, 15533)
gender.difference <- as.data.frame(rbind(F, M))
names(gender.difference) <- c("non-adopters", "adopters")
gender.difference
chisq.test(gender.difference)

# rbind(), cbind(), merge() examples
rbind()
cbind()
merge()
?rbind

# Load order data and create Mobile dummy
MobileOrder <- read.dta("MobileOrder.dta")
head(MobileOrder)

MobileOrder$Mobile <- ifelse(
  MobileOrder$Mall == "03" &
    (MobileOrder$AccessRoute == "1000132495" |
     MobileOrder$AccessRoute == "1000132496" |
     MobileOrder$AccessRoute == "1000013091"), 1, 0)

#3 Compare PC vs Mobile transactions on OrderPrice.
#  Which has larger OrderPrice? Is it consistent with your conjecture?
t.test(MobileOrder$OrderPrice ~ MobileOrder$Mobile, na.rm = TRUE)

#4 Compare confirmation rate between PC and Mobile.
#  CRate = 1 if OrderQuantity == ConfirmedQuan, else 0.
#  What are the confirmation rates for PC and Mobile?
MobileOrder$CRate <- ifelse(MobileOrder$OrderQuantity == MobileOrder$ConfirmedQuan, 1, 0)
head(MobileOrder)
t.test(MobileOrder$CRate ~ MobileOrder$Mobile, na.rm = TRUE)

#5 Compare dependence on certificates (OkSeller, QuickSeller, BigSeller)
#  between PC and Mobile. Which depends more on certificates?
table(MobileOrder$OkSeller, MobileOrder$Mobile)
chisq.test(MobileOrder$OkSeller, MobileOrder$Mobile)

809612 / (809612 + 367560)
75809  / (75809  + 29979)

MobileOrder_OK <- subset(MobileOrder, MobileOrder$OkSeller != "Z")
table(MobileOrder_OK$OkSeller, MobileOrder_OK$Mobile)
chisq.test(MobileOrder$OkSeller, MobileOrder$Mobile)

str(MobileOrder_OK)
t.test(MobileOrder_OK$OkSeller ~ MobileOrder_OK$Mobile, na.rm = TRUE)

# QuickSeller and BigSeller
table(MobileOrder$QuickSeller, MobileOrder$Mobile)
chisq.test(MobileOrder$QuickSeller, MobileOrder$Mobile)

table(MobileOrder$BigSeller, MobileOrder$Mobile)
chisq.test(MobileOrder$BigSeller, MobileOrder$Mobile)
