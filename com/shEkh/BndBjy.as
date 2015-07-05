class com.shEkh.BndBjy extends MovieClip
{
    var _mainClr, _ovrClr, _alphOvr, _alphMain, volume, _crntAdo, _volMc, _cntrlMc, _pathX, _xml, _ldngMc, _aPth, _trcks, _totAdo, _atoPly, _pusePos, _sndObj, _parent, _objMn;
    function BndBjy()
    {
        super();
        _mainClr = 6710886;
        _ovrClr = 6710886;
        _alphOvr = 100;
        _alphMain = 50;
        volume = 100;
        _crntAdo = 0;
        _volMc._alpha = _cntrlMc._alpha = 0;
        _volMc._visible = _cntrlMc._visible = false;
        _cntrlMc.play_btn.btn.enabled = false;
        _cntrlMc.pause_btn.btn.enabled = false;
        _cntrlMc.stop_btn.btn.enabled = false;
        _cntrlMc.next_btn.btn.enabled = false;
        _cntrlMc.prev_btn.btn.enabled = false;
        _cntrlMc.play_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _cntrlMc.pause_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _cntrlMc.stop_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        new Color(_volMc).setRGB(_mainClr);
        new Color(_cntrlMc.play_btn).setRGB(_mainClr);
        new Color(_cntrlMc.pause_btn).setRGB(_mainClr);
        new Color(_cntrlMc.stop_btn).setRGB(_mainClr);
        new Color(_cntrlMc.next_btn).setRGB(_mainClr);
        new Color(_cntrlMc.prev_btn).setRGB(_mainClr);
        _cntrlMc.next_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _cntrlMc.prev_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _pathX = "dat/xml/player.xml";
        _xml = new XML();
        new com.shEkh.XmlMngr(_xml, _pathX, mx.utils.Delegate.create(this, _startFnc), mx.utils.Delegate.create(this, _errFnc));
        this._cntrlFnc();
    } // End of the function
    function _cntrlFnc()
    {
        _cntrlMc.play_btn.btn.onRelease = _plySng;
        _cntrlMc.stop_btn.btn.onRelease = mx.utils.Delegate.create(this, _stpFnc);
        _cntrlMc.pause_btn.btn.onRelease = mx.utils.Delegate.create(this, _pauseFnc);
        _cntrlMc.next_btn.btn.onRelease = mx.utils.Delegate.create(this, nxtFnc);
        _cntrlMc.prev_btn.btn.onRelease = mx.utils.Delegate.create(this, prvFnc);
    } // End of the function
    function _errFnc()
    {
        _ldngMc._ldngMc._txt = "Error Loading";
        _ldngMc._ldngMc._txtT.autoSize = true;
    } // End of the function
    function _startFnc()
    {
        _volMc._visible = _cntrlMc._visible = true;
        _ldngMc._visible = false;
        new mx.transitions.Tween(_volMc, "_alpha", mx.transitions.easing.Back.easeOut, 0, 100, 2, true);
        new mx.transitions.Tween(_cntrlMc, "_alpha", mx.transitions.easing.Back.easeOut, 0, 100, 2, true);
        _cntrlMc.prev_btn.btn.enabled = _cntrlMc.next_btn.btn.enabled = true;
        _aPth = new Array();
        _trcks = new Array();
        _trcks = _xml.firstChild.childNodes;
        _totAdo = _trcks.length;
        for (var _loc3 = 0; _loc3 < _totAdo; ++_loc3)
        {
            _aPth[_loc3] = _trcks[_loc3].attributes.path;
        } // end of for
        _root.musicon = "_nxtBck";
        _atoPly = _xml.firstChild.attributes.autoStart;
        if (_atoPly == "yes")
        {
            _crntAdo = 0;
            this._plyFnc();
        }
        else if (_atoPly == "no")
        {
        }
        else if (_atoPly == "random")
        {
            _crntAdo = random(_totAdo) + 1;
            this._plyFnc();
        } // end else if
    } // End of the function
    function _plyFnc()
    {
        if (_root.musicon == "pauseM")
        {
            _sndObj.start(_pusePos, 0);
            _pusePos = 0;
        } // end if
        if (_root.musicon == "stopM")
        {
            _sndObj.start(0, 0);
        } // end if
        if (_root.musicon == "_nxtBck")
        {
            _sndObj = new Sound();
            _sndObj.setVolume(volume);
            _sndObj.loadSound(_aPth[_crntAdo], true);
            _sndObj.onSoundComplete = mx.utils.Delegate.create(this, function ()
            {
                if (_atoPly == "random")
                {
                    _crntAdo = random(_totAdo);
                }
                else
                {
                    _pusePos = null;
                    _crntAdo == _totAdo - 1 ? (_crntAdo = 0) : (_crntAdo++);
                } // end else if
                _root.musicon = "_nxtBck";
                this._plyFnc();
            });
        } // end if
        _cntrlMc.play_btn.btn.enabled = false;
        new Color(_cntrlMc.play_btn).setRGB(_ovrClr);
        _cntrlMc.play_btn.alphaTo(_alphOvr, 1, "easeOutExpo");
        _cntrlMc.pause_btn.btn.enabled = true;
        new Color(_cntrlMc.pause_btn).setRGB(_mainClr);
        _cntrlMc.pause_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _cntrlMc.stop_btn.btn.enabled = true;
        new Color(_cntrlMc.stop_btn).setRGB(_mainClr);
        _cntrlMc.stop_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _root.musicon = "playM";
        _root._plyFnc = true;
    } // End of the function
    function _plySng()
    {
        _objMn = _parent._parent._parent;
        _objMn._plyFnc();
    } // End of the function
    function _pauseFnc()
    {
        _root._plyFnc = false;
        _root.musicon = "pauseM";
        _cntrlMc.play_btn.btn.enabled = true;
        _cntrlMc.stop_btn.btn.enabled = true;
        new Color(_cntrlMc.play_btn).setRGB(_mainClr);
        new Color(_cntrlMc.stop_btn).setRGB(_mainClr);
        _cntrlMc.play_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _cntrlMc.stop_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _pusePos = _sndObj.position / 1000;
        _sndObj.stop();
        _cntrlMc.pause_btn.btn.enabled = false;
    } // End of the function
    function _stpFnc()
    {
        _sndObj.stop();
        _pusePos = null;
        _cntrlMc.play_btn.btn.enabled = true;
        _cntrlMc.pause_btn.btn.enabled = false;
        _cntrlMc.stop_btn.btn.enabled = false;
        new Color(_cntrlMc.play_btn).setRGB(_mainClr);
        new Color(_cntrlMc.pause_btn).setRGB(_mainClr);
        new Color(_cntrlMc.stop_btn).setRGB(_ovrClr);
        _cntrlMc.play_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _cntrlMc.pause_btn.alphaTo(_alphMain, 1, "easeOutExpo");
        _root.musicon = "stopM";
        _root._plyFnc = false;
    } // End of the function
    function nxtFnc()
    {
        _pusePos = null;
        _crntAdo == _totAdo - 1 ? (_crntAdo = 0) : (_crntAdo++);
        _sndObj.stop();
        _root.musicon = "_nxtBck";
        _root._plyFnc = false;
        this._plyFnc();
    } // End of the function
    function prvFnc()
    {
        _pusePos = null;
        _crntAdo == 0 ? (_crntAdo = _totAdo - 1) : (_crntAdo--);
        _sndObj.stop();
        _root.musicon = "_nxtBck";
        _root._plyFnc = false;
        this._plyFnc();
    } // End of the function
} // End of Class
