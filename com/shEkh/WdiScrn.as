class com.shEkh.WdiScrn extends MovieClip
{
    var onRollOver, onRollOut, onRelease, alphaTo;
    function WdiScrn()
    {
        super();
        onRollOver = mx.utils.Delegate.create(this, OvrFnc);
        onRollOut = mx.utils.Delegate.create(this, OutFnc);
        onRelease = mx.utils.Delegate.create(this, PrsFnc);
    } // End of the function
    function OvrFnc()
    {
        this.alphaTo(60, 1, "easeOutExpo");
    } // End of the function
    function OutFnc()
    {
        this.alphaTo(100, 1, "easeOutExpo");
    } // End of the function
    function PrsFnc()
    {
        Stage.displayState = Stage.displayState == "normal" ? ("fullScreen") : ("normal");
    } // End of the function
} // End of Class
