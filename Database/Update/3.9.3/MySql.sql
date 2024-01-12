delete from `DataDictionary` where `DicName`='WidgetStatus';
insert into `DataDictionary`(`DicName`,`Title`,`DicValue`,`Order`,`Pid`,`IsSystem`,`Status`)
select 'WidgetStatus','Visible',1,1,0,1,1 union all
select 'WidgetStatus','Hidden',2,2,0,1,1 union all
select 'WidgetStatus','Deleted',3,3,0,1,1