class com.shEkh.Ldr extends MovieClip
{
    var _fle, _parent, _mc, _prcnt, _bar, _prcntAg, _txt;
    function Ldr()
    {
        super();
        _fle = "flashindex.swf";
        _mc = _parent._mc;
        _mc.loadMovie(_fle);
        var _loc3 = 0;
        function onEnterFrame()
        {
            _prcnt = _mc.getBytesLoaded() / _mc.getBytesTotal() * 100;
            if (isNaN(_prcnt))
            {
                _bar.Wpos = 0;
            } // end if
            _bar.Wpos = _prcnt;
            _prcntAg = Math.round(_bar._width);
            _txt = _prcntAg + "%";
            if (_prcntAg == 100)
            {
                onEnterFrame = null;
                this._prcfFnc();
            } // end if
        } // End of the function
    } // End of the function
    function _prcfFnc()
    {
        _mc._lngMcBse = this;
        _txt = "";
        _mc._alpha = 100;
        _mc.gotoAndPlay(2);
    } // End of the function
} // End of Class
