codeunit 50402 "BCCountry/Region-Install"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase();
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall()
        else
            HandleReinstall();

        UpgradeTag.SetAllUpgradeTags();
    end;

    procedure HandleFreshInstall();
    var
        CountryRegionSetup: Record "BCCountry/Region Setup";
    begin
        CountryRegionSetup.Init();
        CountryRegionSetup."Country/Region Code" := 'NO';
        CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::RS;
        if not CountryRegionSetup.Insert() then;
    end;

    local procedure HandleReinstall();
    var
        CountryRegionSetup: Record "BCCountry/Region Setup";
    begin
        CountryRegionSetup.Init();
        CountryRegionSetup."Country/Region Code" := 'NO';
        CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::RS;
        if not CountryRegionSetup.Insert() then;
    end;
}

//moja nova izmena
//moja druga izmena
//treca izmena
//cetvta izmena
//peta izmena
//sesta izmena koda