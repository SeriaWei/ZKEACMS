DELETE FROM [Language] WHERE LanKey = N'{{LanKey}}' AND CultureName = N'{{Culture}}';
INSERT INTO [Language] (LanKey,CultureName,LanValue) values(N'{{LanKey}}',N'{{Culture}}',N'{{LanValue}}');