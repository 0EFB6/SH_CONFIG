/* See LICENSE file for copyright and license details. */

/* appearance */

static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 16;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "fontawesome:size=8" };
/* "monospace:size=15" */
static const char dmenufont[]       = "fontawesome:size=13";
static const char col_gray1[]       = "#f9ea0e";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#01070C";
static const char col_gray4[]       = "#01070C";
static const char col_cyan[]        = "#89e85d";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
/* static const char *tags[] = { "", "", "", "", "", "", "", "", "", "", "", "12"}; */
static const char *tags[] = { "                                        ", "                                     ", "                                      ", "                                  ", "                           ", "                               ", "                                ", "                               ", "                            "};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 1,       	    0,           -1 },
	{ "Xmessage", NULL,	  NULL,	      0,            1,		 -1 },
	{ "obs",      NULL,	  NULL,	      1 << 8,      0,		 -1},
	{ "Alacritty",NULL,	  NULL,	      1 << 7,      0,		 -1},
	{ "discord",  NULL,	  NULL,			  0,	        0,	    	 -1},
	/*{ "Pcmanfm",  NULL,	  NULL,	      1 << 2,	    0,		 -1},*/
};


/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      monocle },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      tile },
};

/*
 *shift       Shift_L (0x32),  Shift_R (0x3e)
 *lock        Caps_Lock (0x42)
 *control     Control_L (0x25),  Control_R (0x6d)
 *mod1        Alt_L (0x40),  Alt_L (0x7d),  Meta_L (0x9c)
 *mod2        Num_Lock (0x4d)
 *mod3      
 *mod4        Super_L (0x7f),  Hyper_L (0x80)
 *mod5        Mode_switch (0x5d),  ISO_Level3_Shift (0x7c)
*/

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *web[] = { "firefox", NULL };
static const char *webp[] = { "webp", NULL };
static const char *file[] = { "pcmanfm", NULL };
static const char *dd[] = { "discord", NULL };
static const char *ddkill[] = { "ddkill", NULL };
static const char *lock[] = { "slock", NULL };
static const char *brave[] = { "brave", NULL };
static const char *music[] = { "spotify", NULL };
static const char *print_screen_cmd[] = { "scrot", NULL};
static const char *screencapturing[] = { "obs", NULL };
static const char *shutdown[] = { "/sbin/poweroff", NULL };
static const char *restart[] = { "/sbin/reboot", NULL };
static const char *audio[] = { "audio", NULL };
static const char *windowcapture[] = { "winsct", NULL };
static const char *rofi[] = { "rof", NULL};
static const char *stui[] = { "stui", NULL };
static const char *rofiwindow[] = { "rofwin", NULL};
static const char *skoolon[] = { "pseudocamon", NULL };
static const char *skooloff[] = { "pseudocamoff", NULL };
static const char *chrome[] = { "chromium", NULL };
static const char *zoomoff[] = { "zoomoff", NULL };
static const char *htop[] = { "st-htop", NULL };
static const char *bpytop[] = { "st-bpytop", NULL };

#include "movestack.c"

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,	   spawn,          {.v = rofi } },
	{ MODKEY,             		XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,			XK_w,	   spawn,	   {.v = web } },
	{ MODKEY|ShiftMask,		XK_w,	   spawn,	   {.v = webp } },
	{ MODKEY,			XK_e,	   spawn,	   {.v = file } },
	{ MODKEY,			XK_d,	   spawn,	   {.v = dd } },
	{ MODKEY|ShiftMask,		XK_d,	   spawn,	   {.v = ddkill } },
	{ MODKEY,			XK_o,	   spawn,	   {.v = screencapturing } },
	{ MODKEY,                       XK_x,      spawn,          {.v = skoolon } },
	{ MODKEY|ShiftMask,             XK_x,      spawn,          {.v = skooloff } },
	{ MODKEY,			XK_v,	   spawn,	   {.v = chrome } },
	{ 0,							XK_Print,  spawn,		   {.v = print_screen_cmd } },
	{ MODKEY,			XK_Print,  spawn,	   {.v = windowcapture } },
	{ MODKEY,			XK_y,	   spawn,		   {.v = stui } },
	{ MODKEY,			XK_l,	   spawn,		   {.v = lock } },
	{ MODKEY,			XK_b,	   spawn,		   {.v = brave} },
	{ MODKEY|ShiftMask,		XK_b,	   spawn,	   {.v = bpytop } },
	{ MODKEY,			XK_s,	   spawn,		   {.v = music} },
	{ MODKEY,                       XK_n,      togglebar,      {0} },
	{ MODKEY,                       XK_grave,      focusstack,     {.i = +1 } },
	{ MODKEY,			XK_z,	   focusstack,     {.i = +1 } },
	{ MODKEY|ShiftMask,		XK_z,	   spawn,	   {.v = zoomoff } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	/* Movestack Patches*/
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY,			XK_q,	   spawn,	   {.v = audio } },
	/*{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },*/
	/*{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },*/
	{ MODKEY,                       XK_g,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,		XK_h,	   spawn,	   {.v = htop } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = +0.05} },
	{ MODKEY|ControlMask,           XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,	                XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY,			XK_a,	   spawn,	   {.v = rofiwindow } },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY|ShiftMask,		XK_u,	   spawn,	   {.v = shutdown } },
	{ MODKEY|ShiftMask,		XK_r,	   spawn,	   {.v = restart } },
	/*{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },*/
	/*{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },*/
	/*{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },*/
	/*{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },*/
	{ 0,				XK_F6,	   spawn,	   {.v = lock } },
	{ 0, 				XK_F3,	   focusstack,     {.i = +1 } },
	{ 0,				XK_F4,     focusstack,     {.i = -1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

