class com.shEkh.ImgLdr extends MovieClip
{
    var _ldrMcx, _alphx, _sucsFnc, _prcnt;
    function ImgLdr(_mc, _pth, _ldrMc, _sucsFncP, _alph)
    {
        super();
        _mc.stopTween();
        _ldrMcx = _ldrMc;
        _alphx = _alph;
        _sucsFnc = _sucsFncP;
        _mc._lockroot = true;
        _mc._alpha = 0;
        var _loc4 = new MovieClipLoader();
        _loc4.addListener(this);
        _loc4.loadClip(_pth, _mc);
    } // End of the function
    function onLoadProgress(mc, bytesLoaded, bytesTotal)
    {
        _prcnt = Math.round(bytesLoaded / bytesTotal * 100);
        _ldrMcx._txt = _prcnt;
    } // End of the function
    function onLoadInit(mc)
    {
        _ldrMcx._txt = "";
        mc.forceSmoothing = true;
        _ldrMcx.alphaTo(0, 5.000000E-001, "easeOutExpo");
        mc.alphaTo(_alphx, 7.000000E-001, "linear");
        this._sucsFnc();
    } // End of the function
} // End of Class
