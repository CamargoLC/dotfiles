/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 17;        /* gaps between windows */
static const unsigned int snap      = 36;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 10;       /* vertical padding of bar */
static const int sidepad            = 10;       /* horizontal padding of bar */
static const char *fonts[]          = { "Hack Nerd Font:size=12" };
static const char dmenufont[]       = "Hack Nerd Font:size=12";
static const char col_gray1[]       = "#000000"; /* Fundo do painel */
static const char col_gray2[]       = "#1a1a1a"; /* Borda de janelas inativas */
static const char col_gray3[]       = "#d5d6db"; /* Texto padrão */
static const char col_gray4[]       = "#FFFFFF"; /* Texto e Borda da janela ativa */
static const char col_gray5[]       = "#16161E"; /* Fundo do item selecionado no painel */

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_gray5, col_gray4 },
};
/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	/* class     instance  title           tags mask  isfloating  isterminal  noswallow  monitor */
	{ "Gimp",    NULL,     NULL,           0,         1,          0,           0,        -1 },
	{ "Firefox", NULL,     NULL,           1 << 8,    0,          0,          -1,        -1 },
	{ "St",      NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ "st",      NULL,     NULL,           0,         0,          1,           0,        -1 },
	{ NULL,      NULL,     "Event Tester", 0,         0,          0,           1,        -1 }, /* xev */
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int refreshrate = 120;  /* refresh rate (per second) for client move/resize */

#include <X11/XF86keysym.h>

#include "fibonacci.c"

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "(@)",      spiral },   
    { "[\\]",     dwindle },
    { "><>",      NULL },
    { "[M]",      monocle },
    { "[]=",      tile },  
};

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
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-p", "Run:", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *librewolfcmd[] = { "flatpak", "run", "io.gitlab.librewolf-community", NULL };
static const char *rangercmd[]     = { "st", "-e", "ranger", NULL };
static const char *btopcmd[]       = { "st", "-e", "btop", NULL };
static const char *pcmanfmcmd[]    = { "pcmanfm", NULL };
static const char *keepassxcmd[] = { "keepassxc", NULL };

#include "movestack.c"

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_w,      spawn,          {.v = librewolfcmd } },
	{ MODKEY,                       XK_r,      spawn,          {.v = rangercmd } },
	{ MODKEY,                       XK_b,      spawn,          {.v = btopcmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = pcmanfmcmd } },
	{ MODKEY,                       XK_k,      spawn,          {.v = keepassxcmd } },
	{ MODKEY,                       XK_a,      spawn,          SHCMD("nitrogen --set-zoom-fill --random --save /mnt/meu_hd/Wallpapers/") },
	{ MODKEY,                       XK_t,      togglebar,      {0} },
	{ MODKEY,                       XK_Right,  focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_r,      setlayout,      {.v = &layouts[0]} }, /* Fibonacci/dwindle */
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[1]} }, /* Tile */
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} }, /* Floating */
	{ MODKEY|ShiftMask,             XK_m,      setlayout,      {.v = &layouts[3]} }, /* Monocle */
	{ MODKEY,                       XK_s,      setlayout,      {.v = &layouts[4]} }, /* Spiral */
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -5 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +5 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
	/* Scripts */
	{ MODKEY,                       XK_i,      spawn,          SHCMD("/home/lcx/scripts/sys_info.sh") },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("/home/lcx/scripts/powermenu.sh") },
	{ MODKEY|ShiftMask,             XK_u,      spawn,          SHCMD("/home/lcx/scripts/void-updater") },
	{ MODKEY|ShiftMask,             XK_b,      spawn,          SHCMD("/home/lcx/scripts/bateria.sh") },
	{ MODKEY,                       XK_d,      spawn,          SHCMD("/home/lcx/scripts/hora.sh") },
	{ 0,                            XK_Print,  spawn,          SHCMD("~/scripts/print.sh tela") },
	{ ShiftMask,                    XK_Print,  spawn,          SHCMD("~/scripts/print.sh area") },
	{ MODKEY,                       XK_n,      spawn,          SHCMD("dunstctl close") },
	{ ControlMask|Mod1Mask,         XK_Up,     spawn,          SHCMD("/home/lcx/scripts/vol_up.sh") },
	{ ControlMask|Mod1Mask,         XK_Down,   spawn,          SHCMD("/home/lcx/scripts/vol_down.sh") },
	{ ControlMask|Mod1Mask,         XK_Right,  spawn,          SHCMD("/home/lcx/scripts/bright_up.sh") },
	{ ControlMask|Mod1Mask,         XK_Left,   spawn,          SHCMD("/home/lcx/scripts/bright_down.sh") },
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
static const Button buttons[] = {
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

