class com.shEkh.XmlMngr extends Object
{
    var _xmlPth, _sucsFnc, _eRrFnc, _xmlObj, __get__loadedBytes, __get__totalBytes;
    function XmlMngr(_xmlObj, _xmlPthP, _sucsFncP, _eRrFncP)
    {
        super();
        _xmlPth = _xmlPthP;
        _sucsFnc = _sucsFncP;
        _eRrFnc = _eRrFncP;
        _xmlObj.ignoreWhite = true;
        _xmlObj.load(_xmlPth);
        _xmlObj.onLoad = mx.utils.Delegate.create(this, onLoad);
    } // End of the function
    function get totalBytes()
    {
        return (_xmlObj.getBytesTotal());
    } // End of the function
    function get loadedBytes()
    {
        return (_xmlObj.getBytesLoaded());
    } // End of the function
    function onLoad(success)
    {
        if (success)
        {
            return (this._sucsFnc());
        }
        else
        {
            return (this._eRrFnc());
        } // end else if
    } // End of the function
} // End of Class
