install.packages("stringr")
install.packages("dplyr")
install.packages("tidyr")
library(stringr)

# Creating a copy of the ReportData Dataset
EditAudit <- ReportData

# Print EditAudit info
EditAudit

#Filter dataset by selecting all the records with "EditAudit" in the "name" column
EditAudit <- EditAudit %>% filter(EditAudit$Name == "EditAudit")

#Create a single column for each of the following parameters and add them to the previous table:
EditAudit <- separate(EditAudit, Parameters, 
                      into = c("NMCAccount", "DrvSelectByID", "DrvSelectByGroup", "StartDate", "EndDate", 
                               "ReportTime", "DeploymentSite", "Timezone", "CompanyName", "Mode", "EditedType"), 
                      sep = "&")

#Filter dataset by omitting all the records which contains "DrvSelectByID:isnull=true"
EditAudit <- EditAudit %>% filter(EditAudit$DrvSelectByID != "DrvSelectByID:isnull=true")

#Create the following datasets individually
EditAudit_Name <- str_remove(EditAudit$Name, "Name=")
EditAudit_NMCAccount <- str_remove(EditAudit$NMCAccount, "NMCAccount=")
EditAudit_DrvSelectByID <- str_remove(EditAudit$DrvSelectByID, "DrvSelectByID=")
#EditAudit_DrvSelectByID <- str_remove(EditAudit$DrvSelectByID, "DrvSelectByID:isnull=true") ##
EditAudit_DrvSelectByGroup <- str_remove(EditAudit$DrvSelectByGroup, "DrvSelectByGroup=")
EditAudit_StartDate <- str_remove(EditAudit$StartDate, "StartDate=")
EditAudit_EndDate <- str_remove(EditAudit$EndDate, "EndDate=")
EditAudit_ReportTime <- str_remove(EditAudit$ReportTime, "ReportTime=")
EditAudit_DeploymentSite <- str_remove(EditAudit$DeploymentSite, "DeploymentSite=")
EditAudit_Timezone <- str_remove(EditAudit$Timezone, "Timezone=")
EditAudit_CompanyName <- str_remove(EditAudit$CompanyName, "CompanyName=")
EditAudit_Mode <- str_remove(EditAudit$Mode, "Mode=")
EditAudit_EditedType <- str_remove(EditAudit$EditedType, "EditedType=")
EditAudit_TimeStart <- str_remove(EditAudit$TimeStart, "TimeStart=")
EditAudit_TimeEnd <- str_remove(EditAudit$TimeEnd, "TimeEnd=")
EditAudit_TimeDataRetrieval <- str_remove(EditAudit$TimeDataRetrieval, "TimeDataRetrieval=")
EditAudit_TimeProcessing <- str_remove(EditAudit$TimeProcessing, "TimeProcessing=")
EditAudit_RowCount <- str_remove(EditAudit$RowCount, "RowCount=")


#Clean the Hexadecimal values
EditAudit_StartDate <- gsub('%2F', '/', EditAudit_StartDate)
EditAudit_StartDate <- gsub('%20', ' ', EditAudit_StartDate)
EditAudit_StartDate <- gsub('%3A', ':', EditAudit_StartDate)

EditAudit_EndDate <- gsub('%2F', '/', EditAudit_EndDate)
EditAudit_EndDate <- gsub('%20', ' ', EditAudit_EndDate)
EditAudit_EndDate <- gsub('%3A', ':', EditAudit_EndDate)

EditAudit_ReportTime <- gsub('%2F', '/', EditAudit_ReportTime)
EditAudit_ReportTime <- gsub('%20', ' ', EditAudit_ReportTime)
EditAudit_ReportTime <- gsub('%3A', ':', EditAudit_ReportTime)

EditAudit_Timezone <- gsub('%2F', '/', EditAudit_Timezone)
EditAudit_Timezone <- gsub('%20', ' ', EditAudit_Timezone)
EditAudit_Timezone <- gsub('%3A', ':', EditAudit_Timezone)

EditAudit_CompanyName <- gsub('%20', ' ', EditAudit_CompanyName)
EditAudit_CompanyName <- gsub('%2C', ',', EditAudit_CompanyName)
EditAudit_CompanyName <- gsub('%26', '&', EditAudit_CompanyName)

EditAudit_DrvSelectByGroup <- gsub('%20', ' ', EditAudit_DrvSelectByGroup)
EditAudit_DrvSelectByGroup <- gsub('%2C', ',', EditAudit_DrvSelectByGroup)


EditAudit <- cbind(EditAudit_Name, EditAudit_NMCAccount, EditAudit_DrvSelectByID, EditAudit_DrvSelectByGroup,
                   EditAudit_StartDate, EditAudit_EndDate, EditAudit_ReportTime, EditAudit_DeploymentSite,
                   EditAudit_Timezone, EditAudit_CompanyName, EditAudit_Mode, EditAudit_EditedType,
                   EditAudit_TimeStart, EditAudit_TimeEnd, EditAudit_TimeDataRetrieval, EditAudit_TimeProcessing,
                   EditAudit_RowCount)

