CREATE TABLE [dbo].[dbcc_history](
[Error] [int] NULL,
[Level] [int] NULL,
[State] [int] NULL,
[MessageText] [varchar](7000) NULL,
[RepairLevel] [int] NULL,
[Status] [int] NULL,
[DbId] [int] NULL,
[DbFragId] [int] NULL,
[ObjectId] [int] NULL,
[IndexId] [int] NULL,
[PartitionID] [int] NULL,
[AllocUnitID] [int] NULL,
[RidDbId] [int] NULL,
[RidPruId] [int] NULL,
[File] [int] NULL,
[Page] [int] NULL,
[Slot] [int] NULL,
[RefDbId] [int] NULL,
[RefPruId] [int] NULL,
[RefFile] [int] NULL,
[RefPage] [int] NULL,
[RefSlot] [int] NULL,
[Allocation] [int] NULL,
[TimeStamp] [datetime] NULL CONSTRAINT [DF_dbcc_history_TimeStamp] DEFAULT (GETDATE())
) ON [PRIMARY]
GO

INSERT INTO dbcc_history ([Error], [Level], [State], MessageText, RepairLevel, [Status], 
[DbId], DbFragId, ObjectId, IndexId, PartitionId, AllocUnitId, RidDbId, RidPruId, [File], Page, Slot, 
RefDbId, RefPruId, RefFile, RefPage, RefSlot,Allocation)
EXEC ('dbcc checkdb(''db_sistema'') with tableresults')


select timestamp data,* from dbcc_history where MessageText like '%checkdb found%'