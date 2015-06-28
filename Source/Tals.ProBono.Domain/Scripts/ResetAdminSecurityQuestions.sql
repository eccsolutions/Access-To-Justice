DECLARE @userId UNIQUEIDENTIFIER

SELECT @userId = UserId FROM dbo.aspnet_Users WHERE UserName='admin1'
UPDATE dbo.aspnet_Membership SET PasswordQuestion=NULL,PasswordAnswer=NULL WHERE UserId=@userId

SELECT @userId = UserId FROM dbo.aspnet_Users WHERE UserName='admin2'
UPDATE dbo.aspnet_Membership SET PasswordQuestion=NULL,PasswordAnswer=NULL WHERE UserId=@userId

SELECT @userId = UserId FROM dbo.aspnet_Users WHERE UserName='admin3'
UPDATE dbo.aspnet_Membership SET PasswordQuestion=NULL,PasswordAnswer=NULL WHERE UserId=@userId