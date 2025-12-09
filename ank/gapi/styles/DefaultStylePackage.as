if(!ank)
{
   _global.ank = new Object();
}
if(!ank.gapi)
{
   _global.ank.gapi = new Object();
}
if(!ank.gapi.styles)
{
   _global.ank.gapi.styles = new Object();
}
var _loc1 = _global.ank.gapi.styles["\x11\x06"].prototype;
// // ASSetPropFlags(_loc1,null,1); // Removed - decompilation error // Removed - decompilation error
_global.ank.gapi.styles["\x11\x06"].Label = {labelfont:"_sans",labelembedfonts:false,labelalign:"center",labelsize:10,labelcolor:16777215,labelbold:true,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].LabelBlack = {labelfont:"_sans",labelembedfonts:false,labelalign:"center",labelsize:10,labelcolor:0,labelbold:true,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].TextInput = {labelfont:"_sans",labelembedfonts:false,labelalign:"left",labelsize:10,labelcolor:0,labelbold:true,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].Button = {labelupstyle:"Label",labeloverstyle:"LabelBlack",labeldownstyle:"Label",bgcolor:16736512,bordercolor:5128232,highlightcolor:15508082,bgdowncolor:5327420,borderdowncolor:13421772,highlightdowncolor:11509893};
_global.ank.gapi.styles["\x11\x06"].ScrollBar = {sbarrowbgcolor:12499352,sbarrowcolor:5327420,sbthumbcolor:5327420,sbtrackcolor:-1};
_global.ank.gapi.styles["\x11\x06"].TextArea = {font:"Font1",embedfonts:true,align:"left",size:10,bold:false,italic:false,scrollbarstyle:"ScrollBar"};
_global.ank.gapi.styles["\x11\x06"].ChatArea = {font:"_sans",embedfonts:false,align:"left",size:10,bold:false,italic:false,scrollbarstyle:"ScrollBar"};
_global.ank.gapi.styles["\x11\x06"].CellRenderer = {defaultstyle:"LabelBlack",leftstyle:"LabelBlack",rightstyle:"LabelBlack"};
_global.ank.gapi.styles["\x11\x06"].List = {cellrendererstyle:"CellRenderer",scrollbarstyle:"ScrollBar",cellbgcolor:[16772812,15654331],cellselectedcolor:16750865,cellovercolor:13421704};
_global.ank.gapi.styles["\x11\x06"].ContainerGrid = {containerbackground:"DefaultBackground",containerhighlight:"DefaultHighlight",scrollbarstyle:"ScrollBar",labelstyle:"Label"};
_global.ank.gapi.styles["\x11\x06"].LookSelectorGrid = {containerbackground:"LookSelectorBackground",containerhighlight:"LookSelectorHighlight",scrollbarstyle:"ScrollBar",labelstyle:"Label"};
_global.ank.gapi.styles["\x11\x06"].Container = {labelstyle:"Label"};
_global.ank.gapi.styles["\x11\x06"].BrownProgressBar = {bgcolor:5327420,upcolor:16737792,uberupcolor:16756480};
_global.ank.gapi.styles["\x11\x06"].BrownProgressBarGain = {bgcolor:5327420,upcolor:16756480,uberupcolor:16737792};
_global.ank.gapi.styles["\x11\x06"].BrownProgressBarLoss = {bgcolor:5327420,upcolor:13369348,uberupcolor:16737792};
_global.ank.gapi.styles["\x11\x06"].EventCheckButton = {bordercolor:14012330,bgcolor:10040166,highlightcolor:16777215,borderdowncolor:14012330,bgdowncolor:10040166,highlightdowncolor:16777215};
_global.ank.gapi.styles["\x11\x06"].BrownLeftMediumSecretAnswerLabel = {labelfont:"Font1",labelembedfonts:false,labelalign:"left",labelsize:11,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].BrownCenterSmallSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"center",labelsize:9,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].BrownLeftSmallSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"left",labelsize:9,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].WhiteCenterSmallSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"center",labelsize:9,labelcolor:16777215,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].WhiteChikiLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"center",labelsize:6,labelcolor:16777215,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].BlackBrownWindow = {cornerradius:{tl:13,tr:13,br:13,bl:13},bordercolor:5327420,borderwidth:3,backgroundcolor:12499352,titlecolor:12499352,titleheight:22,titlestyle:"BrownLeftMediumBoldLabel"};
_global.ank.gapi.styles["\x11\x06"].LightBrownDataGridWithBorder = {labelstyle:"WhiteCenterSmallLabel",bordercolor:5327420,borderwidth:1,liststyle:"LightBrownListNoSelect",titlebgcolor:"0x514A3C"};
_global.ank.gapi.styles["\x11\x06"].WhiteCenterSmall2Label = {labelfont:"Font1",labelembedfonts:true,labelalign:"center",labelsize:7,labelcolor:16777215,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].VIPLeftSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"left",labelsize:10,labelcolor:16776960,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].VIPLeftMediumBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:16776960,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].VIPToolTip = {font:"_sans",embedfonts:false,size:10,color:16776960,bold:false,italic:false,bgcolor:0,bgalpha:70};
_global.ank.gapi.styles["\x11\x06"].loadStylePackage(dofus["\r\x14"].gapi.styles["\x10\x13"]);
_global.ank.gapi.styles["\x11\x06"].Window = {titlestyle:"Label",cornerradius:{tl:13,tr:13,br:13,bl:13},bordercolor:16777215,borderwidth:3,backgroundcolor:14012330,titlecolor:5327420,titleheight:22};
_global.ank.gapi.styles["\x11\x06"].ProgressBar = {bgcolor:5327420,upcolor:16737792};
_global.ank.gapi.styles["\x11\x06"].ToolTip = {font:"_sans",embedfonts:false,size:10,color:16777215,bold:false,italic:false,bgcolor:0,bgalpha:70};
_global.ank.gapi.styles["\x11\x06"].PopupMenu = {bordercolor:16777215,backgroundcolor:5327420,foregroundcolor:14012330,itembgcolor:5327420,itemovercolor:16737792,itemstaticbgcolor:5327420,labelstaticstyle:"Label",labelenabledstyle:"Label",labeldisabledstyle:"Label"};
_global.ank.gapi.styles["\x11\x06"].VolumeSlider = {oncolor:16777215,offcolor:13421772};
_global.ank.gapi.styles["\x11\x06"].CircleChrono = {bgcolor:16777215};
_global.ank.gapi.styles["\x11\x06"].MouseShortcutsGrid = {scrollbarstyle:"BrownScrollBar",containerbackground:"UI_BannerContainerBackground",containerborder:"UI_BannerContainerBorder",containerhighlight:"UI_BannerContainerHighLight",containerstyle:"InventoryGridContainer",containermargin:1};
_global.ank.gapi.styles["\x11\x06"].StylizedRectangle = {cornerradius:{tl:0,tr:13,br:0,bl:0},bgcolor:16777215};
_global.ank.gapi.styles["\x11\x06"].MapNavigator = {buttonstyle:"Button",bordercolor:12104079,gridcolor:12104079,bgcolor:15066553};
_global.ank.gapi.styles["\x11\x06"].DataGrid = {labelstyle:"Label",liststyle:"List",titlebgcolor:"0x22FF00"};
_global.ank.gapi.styles["\x11\x06"].ConsoleLogger = {font:"_sans",embedfonts:false,size:12};
_global.ank.gapi.styles["\x11\x06"].Fps = {labelstyle:"Label",backalpha:50,backcolor:16711680};
_global.ank.gapi.styles["\x11\x06"].ComboBox = {labelstyle:"LabelBlack",buttonstyle:"Button",liststyle:"List",listbordercolor:5128232,bgcolor:16777215,bordercolor:5128232,highlightcolor:13421772};
_global.ank.gapi.styles["\x11\x06"].IconosGrid = {scrollbarstyle:"NewsListScrollBar",containerbackground:"UI_CustomSetContainerBackground",containerborder:"UI_CustomSetContainerBorder",containerhighlight:"UI_CustomSetContainerHighLight",containermargin:1};
_global.ank.gapi.styles["\x11\x06"].NewsListScrollBar = {sbarrowbgcolor:-1,sbarrowcolor:14971431,sbthumbcolor:14971431,sbtrackcolor:-1};
_global.ank.gapi.styles["\x11\x06"].StatsEpicLeftMediumBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:16744667,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].MimoLeftSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"left",labelsize:10,labelcolor:16744667,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].MimoToolTip = {font:"_sans",embedfonts:false,size:10,color:16744667,bold:false,italic:false,bgcolor:0,bgalpha:70};
_global.ank.gapi.styles["\x11\x06"].MimoLeftMediumBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:16744667,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].EventCheckButton = {bordercolor:14012330,bgcolor:10040166,highlightcolor:16777215,borderdowncolor:14012330,bgdowncolor:10040166,highlightdowncolor:16777215};
_global.ank.gapi.styles["\x11\x06"].Event2CheckButton = {bordercolor:14012330,bgcolor:14306834,highlightcolor:16777215,borderdowncolor:11187669,bgdowncolor:14306834,highlightdowncolor:16777215};
_global.ank.gapi.styles["\x11\x06"].BrownRightSmallTextArea = {font:"Font1",embedfonts:true,align:"right",size:10,color:5327420,bold:false,italic:false,scrollbarstyle:"BrownScrollBar"};
_global.ank.gapi.styles["\x11\x06"].WhiteCenterShopLabel = {labelfont:"Font3",labelembedfonts:true,labelalign:"center",labelsize:16,labelcolor:16777215,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].PurpleLeftMediumBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:11403519,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].BrownCenterSmallBoldCardLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"center",labelsize:5,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].BrownCenterExtraSmallBoldCard = {labelfont:"Font2",labelembedfonts:true,labelalign:"center",labelsize:4.5,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].BrownCenterMediumBoldCardLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"center",labelsize:7,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].TtgCardsGridContainer = {labelstyle:"WhiteLeftSansLabel"};
_global.ank.gapi.styles["\x11\x06"].TtgCardsGrid = {scrollbarstyle:"BrownScrollBar",containerbackground:"UI_CardsCollectionContainerBackground",containerhighlight:"UI_CardsCollectionContainerHighlight",containerstyle:"TtgCardsGridContainer",containermargin:2};
_global.ank.gapi.styles["\x11\x06"].HeroGrid = {scrollbarstyle:"BrownScrollBar",containerbackground:"UI_HeroesMyItem",containerhighlight:"",containerstyle:"TtgCardsGridContainer",containermargin:2};
_global.ank.gapi.styles["\x11\x06"].BrownRightVeryVeryExtraSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"right",labelsize:7,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].GuildNotesTextArea = {font:"Verdana",embedfonts:false,align:"left",size:9,color:5327420,scrollbarstyle:"BrownScrollBar"};
_global.ank.gapi.styles["\x11\x06"].GuildInformationsTextArea = {font:"verdana",embedfonts:false,align:"left",size:10,color:5327420,scrollbarstyle:"BrownScrollBar"};
_global.ank.gapi.styles["\x11\x06"].WhiteRightMediumTextArea = {font:"verdana",embedfonts:false,align:"right",size:10,color:16777215,scrollbarstyle:"BrownScrollBar"};
_global.ank.gapi.styles["\x11\x06"].BrownCenterVeryExtraSmallBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"center",labelsize:8,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].LeftMediumBoldLabelLeg = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:16764672,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].LeftMediumBoldLabelRare = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:57087,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].LeftMediumBoldLabelDivin = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:16737279,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].LegLeftSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"left",labelsize:10,labelcolor:9897201,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].LegLeftMediumBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:9897201,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].LegToolTip = {font:"_sans",embedfonts:false,size:10,color:9897201,bold:false,italic:false,bgcolor:0,bgalpha:70};
_global.ank.gapi.styles["\x11\x06"].DivLeftSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"left",labelsize:10,labelcolor:8765492,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].DivLeftMediumBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:8765492,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].DivToolTip = {font:"_sans",embedfonts:false,size:10,color:8765492,bold:false,italic:false,bgcolor:0,bgalpha:70};
_global.ank.gapi.styles["\x11\x06"].RaroLeftSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"left",labelsize:10,labelcolor:6327036,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].RaroLeftMediumBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:6327036,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].RaroToolTip = {font:"_sans",embedfonts:false,size:10,color:6327036,bold:false,italic:false,bgcolor:0,bgalpha:70};
_global.ank.gapi.styles["\x11\x06"].MiticoLeftSmallLabel = {labelfont:"Font1",labelembedfonts:true,labelalign:"left",labelsize:10,labelcolor:6488613,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].MiticoLeftMediumBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:11,labelcolor:6488613,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].MiticoToolTip = {font:"_sans",embedfonts:false,size:10,color:6488613,bold:false,italic:false,bgcolor:0,bgalpha:70};
_global.ank.gapi.styles["\x11\x06"].NotificationsStylizedRectangle = {cornerradius:{tl:12,tr:12,br:12,bl:12},bgcolor:0,alpha:50,bordercolor:16777215,borderwith:3,borderalpha:100};
_global.ank.gapi.styles["\x11\x06"].BrownLeftSmallBoldLabel = {labelfont:"Font2",labelembedfonts:true,labelalign:"left",labelsize:10,labelcolor:5327420,labelbold:false,labelitalic:false};
_global.ank.gapi.styles["\x11\x06"].BrownProgressBarGain = {bgcolor:5327420,upcolor:16750848,uberupcolor:16737792};
_global.ank.gapi.styles["\x11\x06"].DungeonKeyGrid = {scrollbarstyle:"BrownScrollBar",containerbackground:"UI_DungeonKeyGridBackground",containerhighlight:"UI_DungeonKeyGridHighlight",containerstyle:"DungeonKeyGridContainer",containermargin:5};
