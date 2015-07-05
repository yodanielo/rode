class com.shEkh.OvrNav extends MovieClip
{
    var btn, _parent;
    function OvrNav()
    {
        super();
        btn.onRollOver = _ovrFnc;
        btn.onRollOut = _outFnc;
    } // End of the function
    function _ovrFnc()
    {
        _parent.alphaTo(100, 1, "easeOutExpo");
    } // End of the function
    function _outFnc()
    {
        _parent.alphaTo(50, 1, "easeOutExpo");
    } // End of the function
} // End of Class
