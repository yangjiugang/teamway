var Constant = {
	school : [
		{title:"幼儿园",options:[{id:"1001",text:"步行15分钟"},{id:"1002",text:"开车20分钟"},{id:"1003",text:"公交15分钟"}]},
		{title:"小学",options:[{id:"1011",text:"步行15分钟"},{id:"1012",text:"开车20分钟"},{id:"1013",text:"公交15分钟"}]},
		{title:"中学",options:[{id:"1021",text:"步行15分钟"},{id:"1022",text:"开车20分钟"},{id:"1023",text:"公交15分钟"}]}
	],
	hospital : [
	    {title:"社康门诊",options:[{id:"1101",text:"步行15分钟"},{id:"1102",text:"开车20分钟"},{id:"1103",text:"公交15分钟"}]},
		{title:"三甲医院",options:[{id:"1111",text:"步行15分钟"},{id:"1112",text:"开车20分钟"},{id:"1113",text:"公交15分钟"}]},
		{title:"一般医院",options:[{id:"1121",text:"步行15分钟"},{id:"1122",text:"开车20分钟"},{id:"1123",text:"公交15分钟"}]}
	],
	view : [//{title:"景观",options:[
	    {id:"1",text:"山景"},{id:"2",text:"海景"},{id:"3",text:"湖景"},{id:"4",text:"江河景"},
	    					   {id:"5",text:"公园或游乐场"},{id:"6",text:"高尔夫球场"},{id:"7",text:"体育馆"},
	    					   {id:"8",text:"市政休闲广场"},{id:"9",text:"大学"}
	    					 //  ]}
	],
	traffic : [
		{title:"交通",options:[{id:"1301",text:"地铁"},{id:"1302",text:"公交"},{id:"1303",text:"长途汽车站"},
		                     {id:"1304",text:"客运码头"},{id:"1305",text:"机场"}]}
	],
	live : [
		{title:"菜市场",options:[{id:"1401",text:"步行5分钟"},{id:"1402",text:"步行15分钟"}]},
		{title:"大型超市",options:[{id:"1411",text:"步行5分钟"},{id:"1412",text:"步行15分钟"}]},
		{title:"餐饮",options:[{id:"1421",text:"步行5分钟"},{id:"1422",text:"步行15分钟"}]},
		{title:"商场",options:[{id:"1431",text:"步行5分钟"},{id:"1432",text:"步行15分钟"}]},
		{title:"城市综合体",options:[{id:"1441",text:"步行5分钟"},{id:"1442",text:"步行15分钟"}]},
		{title:"CDB",options:[{id:"1451",text:"步行5分钟"},{id:"1452",text:"步行15分钟"}]}
	],
	city : [//城市
	        {id:1,text:'常德'},{id:8,text:'宝鸡'},{id:15,text:'吉林'},{id:21,text:'合肥'},{id:27,text:'株洲'},{id:33,text:'昆明'},{id:39,text:'海南'},
		    {id:2,text:'大连'},{id:9,text:'石家庄'},{id:16,text:'哈尔滨'},{id:22,text:'芜湖'},{id:28,text:'深圳'},{id:34,text:'红河'},{id:40,text:'武汉'},
		    {id:3,text:'唐山'},{id:10,text:'大庆'},{id:17,text:'杭州'},{id:23,text:'东莞'},{id:29,text:'广州'},{id:35,text:'海口'},{id:41,text:'宜昌'},
		    {id:4,text:'太原'},{id:11,text:'苏州'},{id:18,text:'宁波'},{id:24,text:'南昌'},{id:30,text:'三亚'},{id:36,text:'成都'},{id:42,text:'长治'},
		    {id:5,text:'南京'},{id:12,text:'福州'},{id:19,text:'赣州'},{id:25,text:'兰州'},{id:31,text:'绵阳'},{id:37,text:'郑州'},{id:43,text:'济南'},
		    {id:6,text:'厦门'},{id:13,text:'贵阳'},{id:20,text:'张掖'},{id:26,text:'西安'},{id:32,text:'洛阳'},{id:38,text:'青岛'},{id:44,text:'长沙'},
		    {id:7,text:'遵义'},{id:14,text:'西宁'},{id:45,text:'北京'},{id:46,text:'上海'}
	],
	temperament : [//房屋性质
	        {id:1,text:'普通住宅'},{id:2,text:'花园洋房'},{id:3,text:'别墅'},{id:4,text:'商住楼'},{id:5,text:'写字楼'},
	        {id:6,text:'商铺'},{id:7,text:'厂房'},{id:8,text:'仓库'},{id:9,text:'其他'}
	],
	price : [//价格区间
	        {id:'0-3000',text:'0-3000元/平'},{id:'3000-4500',text:'3000-4500元/平'},{id:'4500-6000',text:'4500-6000元/平'},{id:'6000-8000',text:'6000-8000元/平'},{id:'8000-10000',text:'8000-10000元/平'},
	        {id:'10000-15000',text:'10000-15000元/平'},{id:'15000-150000000',text:'15000元/平以上'}
	],
	area : [//面积区间
	        {id:'0-45',text:'0-45平'},{id:'45-60',text:'45-60平'},{id:'60-80',text:'60-80平'},{id:'80-100',text:'80-100平'},{id:'100-120',text:'100-120平'},{id:'120-150',text:'120-150平'},
	        {id:'150-200',text:'150-200平'},{id:'200-300',text:'200-300平'},{id:'300-500',text:'300-500平'},{id:'500-1000',text:'500平以上'},
	],
	housetype : [//房屋户型
	        {id:'一室',text:'一室'},{id:'二室',text:'二室'},{id:'三室',text:'三室'},{id:'四室',text:'四室'},
	        {id:'五室',text:'五室'},{id:'六室',text:'六室'}
	],
	build : [//建设情况
	         {id:1,text:'蓝图规划'},{id:2,text:'破土动工'},{id:3,text:'工程完工'},{id:4,text:'装修完成'}
	],
	fitment : [//房屋装修
	         {id:1,text:'毛坯房'},{id:2,text:'简单装修'},{id:3,text:'精致装修'},{id:4,text:'豪华装修'},{id:5,text:'个性装修'},{id:6,text:'艺术装修'}
	],
	activity : [//营销活动
	         {id:1,text:'筹备开盘'},{id:2,text:'已经开盘'},{id:3,text:'开盘已久'},
	],
	journey : [//行程时间
	         '1天','2天1夜','3天2夜','4天3夜','5天4夜'
	],
	grouptime : [//发团时间
	             {id:1,text:'不限'},{id:2,text:'3天内'},{id:3,text:'7天内'},{id:4,text:'15天内'},{id:5,text:'1个月内'}
	],
	destination : [//目的地
	        '常德','宝鸡','吉林','合肥','株洲','昆明','海南','大连','石家庄','哈尔滨','芜湖','深圳','红河','武汉','唐山','大庆','杭州','广州','海口','宜昌','太原',
	        '苏州','宁波','南昌','三亚','成都','长治','南京','福州','赣州','兰州','绵阳','郑州','济南','厦门','贵阳','张掖','西安','洛阳','青岛','长沙','遵义','西宁'
	],
	buytoletpurpose : [//购房目的
	         {id:1,text:'阶段性居住养生'},{id:2,text:'小住度假'},{id:3,text:'投资'},{id:4,text:'常住'}
	],
	houseproperty : [//房产性质
	         {id:1,text:'普通住宅'},{id:2,text:'花园洋房'},{id:3,text:'别墅'},{id:4,text:'商住楼'},{id:5,text:'写字楼'},{id:6,text:'商铺'},{id:7,text:'厂房'},
	         {id:8,text:'仓库'},{id:9,text:'其他'}
	],
	lineproperty : [//线路性质
	         {id:1,text:'本地'},{id:2,text:'外地'},{id:3,text:'港澳台'},{id:4,text:'亚洲'},{id:5,text:'欧洲'},{id:6,text:'大洋洲'}
	],
	ordertype : [//订单类型
	   	     {id:1,text:'购房订单'},{id:2,text:'看房订单'},{id:3,text:'旅游看房订单'},{id:4,text:'会所活动订单'}
	],
	contactManner : [ //约会方式
	         {id:1,text:'面谈'},{id:2,text:'电话'},{id:3,text:'邮件'},{id:4,text:'短信'}
    ],
    incomeData : [
			        {id:1,text:'请选择...'},{id:2,text:'3000以下'},{id:3,text:'3001~4000'},{id:4,text:'4001~5000'},
			        {id:5,text:'5001~6000'},{id:6,text:'6001~7000'},{id:7,text:'7001~8000'},{id:8,text:'8000以上'}
	],
	costPeject : [//开销项目
	         {id:1,text:'餐费'},{id:2,text:'车费'},{id:3,text:'购物'},{id:4,text:'娱乐'},{id:5,text:'买生活日用'},{id:6,text:'电话费'},{id:7,text:'送礼'},{id:8,text:'购买奢侈品'}
	],
	content : [//洽谈内容
	         {id:1,text:'介绍楼盘'},{id:2,text:'介绍购房团'},{id:3,text:'介绍活动'},{id:4,text:'家庭生活'},{id:5,text:'兴趣爱好'},{id:6,text:'教育'},{id:7,text:'投资理财'},
	         {id:8,text:'社会热点'},{id:9,text:'娱乐休闲'},{id:10,text:'新鲜事物'},{id:11,text:'艺术'},{id:12,text:'体育'},{id:13,text:'置业'},{id:14,text:'时尚'}
	],
	groupIntention : [// 参团意向
	         {id:1,text:'没有意向'},{id:2,text:'一般'},{id:3,text:'较有意向'},{id:4,text:'非常愿意'}
	],
	ActivityIntention : [// 参加活动意向
	         {id:1,text:'没有意向'},{id:2,text:'一般'},{id:3,text:'较有意向'},{id:4,text:'非常愿意'}
	],
	buyHouseIntention : [// 购房意向
             {id:1,text:'没有意向'},{id:2,text:'一般'},{id:3,text:'较有意向'},{id:4,text:'非常愿意'}
    ],
};