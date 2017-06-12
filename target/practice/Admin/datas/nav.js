
// 管理员
var navs3 = [{
	"title": "学生信息管理",
	"icon": "fa fa-mortar-board ",
	"spread": false,
	"children": [{
		"title": "学生信息详情",
		"icon": " fa fa-id-card",
		"href": "Admin_StudentInfo.jsp"
	}]
}, {
	"title": "老师信息管理",
	"icon": "fa fa-user",
	"spread": false,
	"children": [{
		"title": "老师信息详情",
		"icon": "fa fa-address-book-o",
		"href": "Admin_TeacherInfo.jsp"
	}]
}, {
	"title": "学生成绩",
	"icon": "fa fa-bank",
	"spread": false,
	"children": [{
		"title": "学生成绩信息",
		"icon": "fa-check-square-o",
		"href": "Admin_StudentScore.jsp"
	}]
}, {
	"title": "课程详情",
	"icon": "fa-address-book",
	"href": "",
	"spread": false,
	"children": [{
		"title": "课程管理",
		"icon": "fa fa-dedent",
		"href": "Admin_currise.jsp"
	}]
},{
    "title": "关于我们",
    "icon": "fa fa-hand-o-right",
    "spread": false,
    "children": [{
        "title": "我们的简介",
        "icon": "&#xe641;",
        "href": "weiwancheng.html"
    }, {
            "title": "联系我们",
            "icon": " fa fa-envelope",
            "href": "weiwancheng.html"
	}]
}
];


//学生
var navs1 = [{
    "title": "我的信息",
    "icon": "fa fa-mortar-board ",
    "spread": false,
    "children": [{
        "title": "信息详情",
        "icon": " fa fa-id-card",
        "href": "student_info.jsp"
    }]
}, {
    "title": "查看成绩",
    "icon": "fa fa-bank",
    "spread": false,
    "children": [{
        "title": "查看成绩信息",
        "icon": "fa-check-square-o",
        "href": "student_score.jsp"
    }]
},
    {
        "title": "给老师留言评价",
        "icon": "fa fa-bank",
        "spread": false,
        "children": [{
            "title": "留言板",
            "icon": "fa-check-square-o",
            "href": "student_evaluaate.jsp"
		},
            {
                "title": "查看老师通告",
                "icon": "fa-check-square-o",
                "href": "student_SeachMessag.jsp"
            }
		]
    },
	{
    "title": "课程详情",
    "icon": "fa-address-book",
    "href": "",
    "spread": false,
    "children": [{
        "title": "软件工程课程",
        "icon": "fa fa-dedent",
        "href": "weiwancheng.html"
    }, {
        "title": "通信工程课程",
        "icon": "fa fa-dedent",
        "href": "weiwancheng.html"
    }, {
        "title": "电子信息技术课程",
        "icon": "fa fa-dedent",
        "href": "weiwancheng.html"
    }]
},{
    "title": "关于我们",
    "icon": "fa fa-hand-o-right",
    "spread": false,
    "children": [{
        "title": "我们的简介",
        "icon": "&#xe641;",
        "href": "weiwancheng.html"
    }, {
        "title": "联系我们",
        "icon": " fa fa-envelope",
        "href": "weiwancheng.html"
    }]
}
];


//老师
var navs2 = [ {
    "title": "老师信息",
    "icon": "fa fa-user",
    "spread": false,
    "children": [{
        "title": "信息详情",
        "icon": "fa fa-address-book-o",
        "href": "weiwancheng.html"
    }]
}, {
    "title": "学生成绩",
    "icon": "fa fa-bank",
    "spread": false,
    "children": [{
        "title": "学生成绩信息",
        "icon": "fa-check-square-o",
        "href": "teacher_score.jsp"
    }]
}, {
    "title": "课程详情",
    "icon": "fa-address-book",
    "href": "",
    "spread": false,
    "children": [{
        "title": "软件工程课程",
        "icon": "fa fa-dedent",
        "href": "weiwancheng.html"
    }, {
        "title": "通信工程课程",
        "icon": "fa fa-dedent",
        "href": "weiwancheng.html"
    }, {
        "title": "电子信息技术课程",
        "icon": "fa fa-dedent",
        "href": "weiwancheng.html"
    }]
},
    {
        "title": "发布查看消息",
        "icon": "fa fa-bank",
        "spread": false,
        "children": [{
            "title": "发布任务",
            "icon": "fa-check-square-o",
            "href": "teacher_evaluaate.jsp"
        },
            {
                "title": "查看留言",
                "icon": "fa-check-square-o",
                "href": "teacher_SeachMessag.jsp"
            }
        ]
    },
	{
    "title": "关于我们",
    "icon": "fa fa-hand-o-right",
    "spread": false,
    "children": [{
        "title": "我们的简介",
        "icon": "&#xe641;",
        "href": "weiwancheng.html"
    }, {
        "title": "联系我们",
        "icon": " fa fa-envelope",
        "href": "weiwancheng.html"
    }]
}
];
