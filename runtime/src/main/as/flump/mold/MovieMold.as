//
// Flump - Copyright 2012 Three Rings Design

package flump.mold {

public class MovieMold extends TopLevelMold
{
    public var libraryItem :String;
    public var symbol :String;
    public var layers :Vector.<LayerMold> = new Vector.<LayerMold>();

    // The hash of the XML file for this symbol in the library
    public var md5 :String;

    public function get frames () :int {
        var frames :int = 0;
        for each (var layer :LayerMold in layers) frames = Math.max(frames, layer.frames);
        return frames;
    }

    public function get flipbook () :Boolean { return layers[0].flipbook; }

    public function toJSON (_:*) :Object {
        return {
            symbol: symbol,
            layers: layers,
            md5: md5
        };
    }

    public function toXML () :XML {
        var xml :XML = <movie
            name={symbol}
            md5={md5}
        />;
        for each (var layer :LayerMold in layers) {
            xml.appendChild(layer.toXML());
        }
        return xml;
    }

}
}
