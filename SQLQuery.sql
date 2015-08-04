USE [PBX]
GO
/****** Object:  Trigger [dbo].[PBXDATA_trgIUD_sales_rep]    Script Date: 8/4/2015 10:22:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[PBXDATA_trgIUD_sales_rep]
   ON  [dbo].[PBXDATA]
   AFTER INSERT,UPDATE
AS 
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
IF UPDATE(SALES_REP) 
      UPDATE
        p
      SET
        p.SALES_REP = CASE WHEN p.SALES_REP = '101' THEN 'Ryan Kosterow'
                         WHEN p.SALES_REP = '115' THEN 'Robert Messing'
                         WHEN p.SALES_REP = '114' THEN 'Paul Clark'
                         WHEN p.SALES_REP = '110' THEN 'Aaron Townsley'
                    END
      FROM
        INSERTED I
        JOIN PBXDATA P
          ON I.SALES_REP = P.SALES_REP
      WHERE
        I.SALES_REP IN ( '101', '115', '114', '110' )

  END 
