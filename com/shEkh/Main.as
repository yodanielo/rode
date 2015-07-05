class com.shEkh.Main extends MovieClip
{
    var _xmlErr, getNextHighestDepth, attachMovie, _xml, _ldngMc, _astId, _thmbArr, _totThmb, k, _lngMcBse, _txtLdngMc, _skpMc, createEmptyMovieClip, image_mc, mclListener, image_mcl, _tmpMc, _bgClrMc, _lgoMc, _listMc, _plyrMain, _cpyMc, _flScrn, _mnuMain;
    function Main()
    {
        super();
    } // End of the function
    function onLoad()
    {
        _xmlErr = "error loading data";
        this.attachMovie("_ldngMc", "_ldngMc", this.getNextHighestDepth(), {_x: 25, _y: 25});
        _root._dir = "dat/xml/";
        var _loc4 = _root._dir;
        var _loc3 = _loc4 + "xmlx.xml";
        _xml = new XML();
        new com.shEkh.XmlMngr(_xml, _loc3, mx.utils.Delegate.create(this, _ldAllThmbFnc), mx.utils.Delegate.create(this, _errFnc));
    } // End of the function
    function _ldAllThmbFnc()
    {
        _ldngMc.removeMovieClip();
        _astId = _xml.idMap.assets;
        _thmbArr = new Array();
        _root._hmeArr = new Array();
        var _loc3 = _astId.childNodes[0];
        for (var _loc4 = 0; _loc4 < _loc3.childNodes.length; ++_loc4)
        {
            _root._hmeArr[_loc4] = {_txt: _loc3.attributes.txt, _txt2: _loc3.attributes.txt2, _bgClr: "0x" + _loc3.attributes.bgClr, _img: _loc3.childNodes[_loc4].attributes.path, _xpos: _loc3.childNodes[_loc4].attributes.xpos, _ypos: _loc3.childNodes[_loc4].attributes.ypos};
        } // end of for
        var _loc5;
        var _loc12 = _xml.idMap.menu;
        var _loc13 = _loc3.childNodes.length;
        var _loc14 = _loc12.childNodes.length;
        _totThmb = _loc13 + _loc14;
        for (var _loc4 = 0; _loc4 < _totThmb; ++_loc4)
        {
            if (_loc4 < _loc13)
            {
                _loc5 = _root._hmeArr[_loc4]._img;
            }
            else
            {
                _loc5 = _loc12.childNodes[_loc4].attributes.path;
            } // end else if
            if (_loc5 != undefined || _loc5 != null)
            {
                if (_loc5 != "null")
                {
                    _thmbArr.push(_loc5);
                } // end if
            } // end if
        } // end of for
        _totThmb = _thmbArr.length;
        k = 0;
        _lngMcBse = _root._lngMcBse;
        _txtLdngMc = _lngMcBse.attachMovie("_txtLdngMc", "_txtLdngMc", this.getNextHighestDepth(), {_y: 100});
        this._goLdnFnc();
        this._updteFnc();
        _skpMc = _lngMcBse.attachMovie("_skpMc", "_skpMc", this.getNextHighestDepth(), {_y: 150});
        _skpMc.onPress = mx.utils.Delegate.create(this, _fnshLdng);
    } // End of the function
    function _goLdnFnc()
    {
        image_mc = this.createEmptyMovieClip("image_mc", this.getNextHighestDepth());
        image_mc._alpha = 0;
        mclListener = new Object();
        mclListener.onLoadProgress = mx.utils.Delegate.create(this, _prgrsLdng);
        mclListener.onLoadInit = mx.utils.Delegate.create(this, _initLdng);
        image_mcl = new MovieClipLoader();
        image_mcl.addListener(mclListener);
        image_mcl.loadClip(_thmbArr[k], image_mc);
    } // End of the function
    function _updteFnc()
    {
        _txtLdngMc._txt = "Loading graphics " + (k + 1) + " of " + _totThmb;
        _txtLdngMc._txtT.autoSize = true;
        _txtLdngMc._txtT._x = -_txtLdngMc._txtT._width / 2;
    } // End of the function
    function _prgrsLdng(target, bytesLoaded, bytesTotal)
    {
        _lngMcBse._txt = Math.ceil(bytesLoaded / bytesTotal * 100) + "%";
    } // End of the function
    function _fnshLdng()
    {
        new mx.transitions.Tween(_skpMc, "_alpha", mx.transitions.easing.Back.easeIn, _skpMc._alpha, 0, 5.000000E-001, true);
        var _loc2 = new mx.transitions.Tween(_lngMcBse, "_alpha", mx.transitions.easing.Back.easeIn, _lngMcBse._alpha, 0, 8.000000E-001, true);
        _loc2.onMotionFinished = mx.utils.Delegate.create(this, _startFnc);
    } // End of the function
    function _initLdng(target_mc)
    {
        _lngMcBse._txt = "";
        ++k;
        if (k == _totThmb)
        {
            this._fnshLdng();
        }
        else
        {
            this._updteFnc();
            image_mcl.loadClip(_thmbArr[k], image_mc);
        } // end else if
    } // End of the function
    function _errFnc()
    {
        _ldngMc._txtMc._txt = _xmlErr;
        _ldngMc._txtMc._txtT.autoSize = true;
    } // End of the function
    function _startFnc()
    {
        _lngMcBse.removeMovieClip();
        _skpMc.removeMovieClip();
        image_mcl.removeListener(mclListener);
        _tmpMc = this.attachMovie("_bgMc", "_tmpMc", this.getNextHighestDepth(), {_alpha: 0, _width: 740, _height: 555});
        _bgClrMc = this.attachMovie("_bgMc", "_bgClrMc", this.getNextHighestDepth(), {_alpha: 0, _width: Stage.width, _height: Stage.height});
        _bgClrMc.colorTo(_root._hmeArr[0]._bgClr, 5.000000E-001, "easeOutExpo");
        _bgClrMc.alphaTo(100, 1, "easeOutExpo");
        _lgoMc = this.attachMovie("_lgoMc", "_lgoMc", this.getNextHighestDepth());
        _lgoMc._txt = _xml.idMap.logo;
        _lgoMc._txtT.autoSize = "center";
        _lgoMc._icn = _xml.idMap.logo.firstChild.attributes.iconx;
        _listMc = this.attachMovie("_listMc", "_listMc", this.getNextHighestDepth());
        _plyrMain = this.attachMovie("_plyrMain", "_plyrMain", this.getNextHighestDepth(), {_x: Stage.width, _y: Stage.height});
        _cpyMc = this.attachMovie("_cpyMc", "_cpyMc", this.getNextHighestDepth(), {_x: 20, _y: Stage.height, _alpha: 0});
        _cpyMc._txt = _xml.idMap.copy;
        _cpyMc._txtT.autoSize = true;
        _cpyMc.alphaTo(100, 1, "easeInOutExpo");
        _flScrn = this.attachMovie("_flScrnMc", "_flScrnMc", this.getNextHighestDepth(), {_x: _cpyMc._width + 20, _y: _cpyMc._y, _alpha: 0});
        _flScrn._txt = "FULLSCREEN";
        _flScrn._txtT.autoSize = true;
        _flScrn.alphaTo(100, 1, "easeInOutExpo");
        _mnuMain = this.attachMovie("_mnuMain", "_mnuMain", this.getNextHighestDepth());
        this._rszeFnc();
    } // End of the function
    function _rszeFnc()
    {
        _bgClrMc._width = _plyrMain._x = Stage.width;
        _flScrn._y = _bgClrMc._height = _cpyMc._y = _plyrMain._y = Stage.height;
        _flScrn._x = _cpyMc._width + 20;
        _listMc._x = _tmpMc._x = Math.round((Stage.width - _tmpMc._width) / 2);
        _tmpMc._y = Math.round((Stage.height - _tmpMc._height) / 2);
        _mnuMain._y = _tmpMc._y + 85;
        _mnuMain._rzeFnc();
        _lngMcBse._x = _lgoMc._x = Math.round(Stage.width / 2);
        _lgoMc._y = _tmpMc._y;
        _listMc._y = _tmpMc._y + 170;
        _lngMcBse._y = Stage.height / 2;
    } // End of the function
} // End of Class
