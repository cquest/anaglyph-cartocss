// Anaglyph rendering with Z (depth) depending of object creation date (base on osm_id ranges)
// Written by Christian Quest - cquest@openstreetmap.fr

Map { background-color: black; }

.nodes [zoom>=13] {
  ::right {
  marker-width: 1;
  [zoom>=15] { marker-width: 3; }
  marker-line-width: 0;
  marker-allow-overlap: true;
  marker-ignore-placement: true;
  marker-fill: red;
  marker-opacity: 0.5;
//  [osm_id> 250000000] { marker-transform: "translate(-8)"; }
  [osm_id> 325000000] { marker-transform: "translate( +6)"; } // 2009
//  [osm_id> 602500000] { marker-transform: "translate(0)"; }
  [osm_id>1077000000] { marker-transform: "translate(+12)"; } // 2010
//  [osm_id>1572300000] { marker-transform: "translate(+8)"; }
  [osm_id>2090600000] { marker-transform: "translate(+18)";} // 2013
//  [osm_id>2604000000] { marker-transform: "translate(+16)";}
  }
  
  ::left {
  marker-width: 1;
  [zoom>=15] { marker-width: 3; }
  marker-line-width: 0;
  marker-allow-overlap: true;
  marker-ignore-placement: true;
  marker-fill: cyan;
  marker-opacity: 0.4;
//  [osm_id> 250000000] { marker-transform: "translate(+8)"; }
  [osm_id> 325000000] { marker-transform: "translate( -6)"; }
//  [osm_id> 602500000] { marker-transform: "translate(+)"; }
  [osm_id>1077000000] { marker-transform: "translate(-12)"; }
//  [osm_id>1572300000] { marker-transform: "translate(-8)"; }
  [osm_id>2090600000] { marker-transform: "translate(-18)"; }
//  [osm_id>2604000000] { marker-transform: "translate(-16)";}
   }
  
}

.ways [zoom>=10] {
  line-color: red;
  line-opacity: 0.25;
  [year=2007] { line-opacity: 0.15; }
}

.ways2 [zoom>=10] {
  line-color: cyan;
  line-opacity: 0.2;
  [year=2007] { line-opacity: 0.10; }
}

#place [zoom>=8] 
{
  [place='city'],
  [zoom>=11][place='town'],
  [zoom>=12]
  {
  text-face-name: "DejaVu Sans Bold";
  text-name: [name];
  text-fill: white;
  text-opacity: 0.7;
  text-allow-overlap: true;
  text-halo-fill: black;
  text-halo-radius: 2;
  }
}
