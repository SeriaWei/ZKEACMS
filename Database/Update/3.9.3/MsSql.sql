if not exists(select 1 from DataDictionary where DicName=N'WidgetStatus')
begin
	insert into DataDictionary(DicName,Title,DicValue,[Order],Pid,IsSystem,[Status])
	select N'WidgetStatus',N'Visible',1,1,0,1,1 union all
	select N'WidgetStatus',N'Hidden',2,2,0,1,1 union all
	select N'WidgetStatus',N'Deleted',3,3,0,1,1
end