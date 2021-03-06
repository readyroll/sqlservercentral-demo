﻿IF OBJECT_ID('[dbo].[WidgetPriceList]') IS NOT NULL
	DROP VIEW [dbo].[WidgetPriceList];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[WidgetPriceList]
WITH SCHEMABINDING 
AS
SELECT     dbo.Widgets.RecordID, dbo.Widgets.Description AS Widget, dbo.WidgetPrices.Price
FROM       dbo.Widgets INNER JOIN
           dbo.WidgetPrices ON dbo.Widgets.RecordID = dbo.WidgetPrices.RecordID
GO
CREATE UNIQUE CLUSTERED INDEX [IX_WidgetPriceList] ON [dbo].[WidgetPriceList] ([RecordID])
GO
