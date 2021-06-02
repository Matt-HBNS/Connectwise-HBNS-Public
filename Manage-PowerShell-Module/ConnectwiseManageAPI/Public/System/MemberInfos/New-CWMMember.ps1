﻿function New-CWMMember {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification = 'Used by sub-function')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '', Justification = 'Required for API')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingUsernameAndPasswordParams', '', Justification = 'Required for API')]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [int]$id,
        [ValidateLength(1,15)]
        [Parameter(Mandatory=$true)]
        [string]$identifier,
        [ValidateLength(1,60)]
        [string]$password,
        [ValidateLength(1,30)]
        [Parameter(Mandatory=$true)]
        [string]$firstName,
        [ValidateLength(1,1)]
        [string]$middleInitial,
        [ValidateLength(1,30)]
        [Parameter(Mandatory=$true)]
        [string]$lastName,
        [ValidateLength(1,50)]
        [string]$title,
        [hashtable]$reportCard,
        [Parameter(Mandatory=$true)]
        [ValidateSet('F','A','C','X')]
        [string]$licenseClass,
        [boolean]$disableOnlineFlag,
        [boolean]$enableMobileFlag,
        [hashtable]$type,
        [ValidateLength(1,10)]
        [string]$employeeIdentifer,
        [string]$vendorNumber,
        [string]$notes,
        [hashtable]$timeZone,
        [hashtable]$TimeZoneSetupReference,
        [hashtable]$country,
        [int[]]$serviceBoardTeamIds,
        [boolean]$enableMobileGpsFlag,
        [string]$inactiveDate,
        [boolean]$inactiveFlag,
        [string]$lastLogin,
        [hashtable]$photo,
        [boolean]$partnerPortalFlag,
        [string]$clientId,
        [string]$stsUserAdminUrl,
        [string]$token,
        [boolean]$toastNotificationFlag,
        [int[]]$memberPersonas,
        [hashtable]$office365,
        [ValidateLength(1,250)]
        [string]$officeEmail,
        [ValidateLength(1,15)]
        [string]$officePhone,
        [ValidateLength(1,10)]
        [string]$officeExtension,
        [ValidateLength(1,250)]
        [string]$mobileEmail,
        [ValidateLength(1,15)]
        [string]$mobilePhone,
        [ValidateLength(1,10)]
        [string]$mobileExtension,
        [ValidateLength(1,250)]
        [string]$homeEmail,
        [ValidateLength(1,15)]
        [string]$homePhone,
        [ValidateLength(1,10)]
        [string]$homeExtension,
        [Parameter(Mandatory=$true)]
        [ValidateSet('Office','Mobile','Home')]
        [string]$defaultEmail,
        [ValidateLength(1,250)]
        [string]$primaryEmail,
        [Parameter(Mandatory=$true)]
        [ValidateSet('Office','Mobile','Home')]
        [string]$defaultPhone,
        [hashtable]$securityRole,
        [boolean]$adminFlag,
        [hashtable]$structureLevel,
        [hashtable]$securityLocation,
        [hashtable]$defaultLocation,
        [hashtable]$defaultDepartment,
        [hashtable]$reportsTo,
        [boolean]$restrictLocationFlag,
        [boolean]$restrictDepartmentFlag,
        [hashtable]$workRole,
        [hashtable]$workType,
        [hashtable]$timeApprover,
        [hashtable]$expenseApprover,
        [double]$billableForecast,
        [double]$dailyCapacity,
        [double]$hourlyCost,
        [double]$hourlyRate,
        [boolean]$includeInUtilizationReportingFlag,
        [boolean]$requireExpenseEntryFlag,
        [boolean]$requireTimeSheetEntryFlag,
        [boolean]$requireStartAndEndTimeOnTimeEntryFlag,
        [boolean]$allowInCellEntryOnTimeSheet,
        [boolean]$enterTimeAgainstCompanyFlag,
        [boolean]$allowExpensesEnteredAgainstCompaniesFlag,
        [boolean]$timeReminderEmailFlag,
        [int]$daysTolerance,
        [double]$minimumHours,
        [string]$timeSheetStartDate,
        [Parameter(Mandatory=$true)]
        [string]$hireDate,
        [hashtable]$serviceDefaultLocation,
        [hashtable]$serviceDefaultDepartment,
        [hashtable]$serviceDefaultBoard,
        [boolean]$restrictServiceDefaultLocationFlag,
        [boolean]$restrictServiceDefaultDepartmentFlag,
        [int[]]$excludedServiceBoardIds,
        [hashtable]$projectDefaultLocation,
        [hashtable]$projectDefaultDepartment,
        [hashtable]$projectDefaultBoard,
        [boolean]$restrictProjectDefaultLocationFlag,
        [boolean]$restrictProjectDefaultDepartmentFlag,
        [int[]]$excludedProjectBoardIds,
        [hashtable]$scheduleDefaultLocation,
        [hashtable]$scheduleDefaultDepartment,
        [double]$scheduleCapacity,
        [hashtable]$serviceLocation,
        [boolean]$restrictScheduleFlag,
        [boolean]$hideMemberInDispatchPortalFlag,
        [hashtable]$calendar,
        [hashtable]$salesDefaultLocation,
        [boolean]$restrictDefaultSalesTerritoryFlag,
        [hashtable]$warehouse,
        [hashtable]$warehouseBin,
        [boolean]$restrictDefaultWarehouseFlag,
        [boolean]$restrictDefaultWarehouseBinFlag,
        [string]$mapiName,
        [boolean]$calendarSyncIntegrationFlag,
        [boolean]$enableLdapAuthenticationFlag,
        [hashtable]$ldapConfiguration,
        [ValidateLength(1,50)]
        [string]$ldapUserName,
        [Parameter(Mandatory=$true)]
        [ValidateSet('SummaryList','DetailList')]
        [string]$companyActivityTabFormat,
        [Parameter(Mandatory=$true)]
        [ValidateSet('SummaryList','DetailList')]
        [string]$invoiceTimeTabFormat,
        [Parameter(Mandatory=$true)]
        [ValidateSet('ShowInvoicingTab','ShowAgreementInvoicingTab')]
        [string]$invoiceScreenDefaultTabFormat,
        [Parameter(Mandatory=$true)]
        [ValidateSet('RemainOnInvoicingScreen','ShowRecentInvoices')]
        [string]$invoicingDisplayOptions,
        [Parameter(Mandatory=$true)]
        [ValidateSet('RemainOnInvoicingScreen','ShowRecentInvoices')]
        [string]$agreementInvoicingDisplayOptions,
        [ValidateSet('LogMeIn','NTR')]
        [string]$remotePackage,
        [ValidateLength(1,250)]
        [string]$remotePackagePlatform,
        [ValidateLength(1,50)]
        [string]$remotePackageUserName,
        [ValidateLength(1,50)]
        [SecureString]$remotePackagePassword,
        [ValidateLength(1,250)]
        [string]$remotePackageAccount,
        [ValidateSet('AuthAnvil','GoogleAuthenticator')]
        [string]$authenticationServiceType,
        [boolean]$timebasedOneTimePasswordActivated,
        [hashtable]$ssoSettings,
        [boolean]$autoStartStopwatch,
        [boolean]$autoPopupQuickNotesWithStopwatch,
        [string]$signature,
        [ValidateSet('OpenRecords','ClosedRecords','AllRecords')]
        [string]$globalSearchDefaultTicketFilter,
        [ValidateSet('None','LastUpdatedDesc','LastUpdatedAsc','CreatedDesc','CreatedAsc')]
        [string]$globalSearchDefaultSort,
        [string]$phoneSource,
        [ValidateSet('TAPI','SKYPE','NONE')]
        [string]$phoneIntegrationType,
        [hashtable]$_info,
        [boolean]$copyPodLayouts,
        [boolean]$copySharedDefaultViews,
        [boolean]$copyColumnLayoutsAndFilters,
        [int]$fromMemberRecId,
        [hashtable[]]$customFields
    )

    $URI = "https://$($script:CWMServerConnection.Server)/v4_6_release/apis/3.0/system/members"
    return Invoke-CWMNewMaster -Arguments $PsBoundParameters -URI $URI
}
