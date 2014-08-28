// Anaglyph rendering with Z (depth) depending of object creation date (based on osm_id ranges)
// Written by Christian Quest - cquest@openstreetmap.fr

Map { background-color: black; }

// cyan/red ratio is 75% to compensate usual blueish displays and lower eye response to red
@red_level: #f00;
@cyan_level: #0cc;

.nodes [zoom>=15] {
  ::right {
  marker-width: 2;
  marker-line-width: 0;
  marker-allow-overlap: true;
  marker-ignore-placement: true;
  marker-fill: @red_level;
  marker-opacity: 0.5;
  [osm_id> 325000000] { marker-transform: "translate( +6)"; marker-width: 2.33; } // 2009
  [osm_id>1077000000] { marker-transform: "translate(+12)"; marker-width: 2.66; } // 2011
  [osm_id>2090600000] { marker-transform: "translate(+18)"; marker-width: 3; } // 2013
  }
  
  ::left {
  marker-width: 2;
  marker-line-width: 0;
  marker-allow-overlap: true;
  marker-ignore-placement: true;
  marker-fill: @cyan_level;
  marker-opacity: 0.5;
  [osm_id> 325000000] { marker-transform: "translate( -6)"; marker-width: 2.33; } // 2009
  [osm_id>1077000000] { marker-transform: "translate(-12)"; marker-width: 2.66; } // 2011
  [osm_id>2090600000] { marker-transform: "translate(-18)"; marker-width: 3; } // 2013
   }
  
}

.ways [zoom>=10] {
  line-color: @red_level;
  line-opacity: 0.33;
  line-width: 1;
  // adjust line opacity/width to make "close" ones more visible
  [year=2007]  { line-opacity: 0.25; line-width: 1; }
  [year>=2009] { line-opacity: 0.30; line-width: 1.05; }
  [year>=2011] { line-opacity: 0.35; line-width: 1.1; }
  [year>=2013] { line-opacity: 0.40; line-width: 1.15; }
}

.ways2 [zoom>=10] {
  line-color: @cyan_level;
  line-opacity: 0.33;
  line-width: 1;
  // adjust line opacity/width to make "close" ones more visible
  [year=2007]  { line-opacity: 0.25; line-width: 1; }
  [year>=2009] { line-opacity: 0.30; line-width: 1.05; }
  [year>=2011] { line-opacity: 0.35; line-width: 1.1; }
  [year>=2013] { line-opacity: 0.40; line-width: 1.15; }
  // render oldest main roads ref/name (on main plane)
  [zoom>=15][name!='']
    {
      text-face-name: "DejaVu Sans Mono Oblique";
      [year=2007] { text-face-name: "DejaVu Sans Mono Bold"; }
      text-name: '    '+[name]+'    ';
      text-fill: #888;
      text-placement: line;
      text-halo-fill: black;
      text-halo-radius: 2;
    }
}

.area [zoom>=16] {
  line-color: @red_level;
  line-opacity: 0.2;
  polygon-fill: @red_level;
  polygon-opacity: 0.15;
  [year=2007]  { polygon-opacity: 0.15; line-opacity: 0.18; line-width: 1; }
  [year>=2009] { polygon-opacity: 0.17; line-opacity: 0.20; line-width: 1.05; }
  [year>=2011] { polygon-opacity: 0.19; line-opacity: 0.22; line-width: 1.1; }
  [year>=2013] { polygon-opacity: 0.21; line-opacity: 0.24; line-width: 1.15; }
}

.area2 [zoom>=16] {
  line-color: @cyan_level;
  line-opacity: 0.2;
  polygon-fill: @cyan_level;
  polygon-opacity: 0.15;
  [year=2007]  { polygon-opacity: 0.15; line-opacity: 0.18; line-width: 1; }
  [year>=2009] { polygon-opacity: 0.17; line-opacity: 0.20; line-width: 1.05; }
  [year>=2011] { polygon-opacity: 0.19; line-opacity: 0.22; line-width: 1.1; }
  [year>=2013] { polygon-opacity: 0.21; line-opacity: 0.24; line-width: 1.15; }
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

#admin [zoom>=8] {
  [zoom>=8][admin_level='4'],
  [zoom>=10][admin_level='6'],
  [zoom>=12][admin_level='8']
    {
      [admin_level!='8'] { text-face-name: "DejaVu Sans Book"; }
      text-face-name: "DejaVu Sans ExtraLight";
      text-name: '    '+[name]+'    ';
      text-fill: #ccc;
      text-placement: line;
      text-spacing: 200;
      text-halo-fill: black;
      text-halo-radius: 2;
    }
}