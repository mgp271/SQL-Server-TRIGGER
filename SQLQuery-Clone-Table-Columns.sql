USE [PBX]
GO
/****** Object:  Trigger [dbo].[PBXDATA_UpdateColumnSALES_REPWhenColumnEXT]    Script Date: 8/4/2015 10:24:24 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[PBXDATA_UpdateColumnSALES_REPWhenColumnEXT]
   ON  [dbo].[PBXDATA]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF UPDATE(EXT)
	BEGIN
		UPDATE dbo.PBXDATA
		SET SALES_REP=i.EXT
		FROM inserted i
		INNER JOIN dbo.PBXDATA t ON i.ID=t.ID
		LEFT JOIN deleted d ON i.ID=d.ID
		WHERE d.ID IS NULL AND i.EXT IS NOT NULL
		OR d.ID IS NOT NULL
	END
END
