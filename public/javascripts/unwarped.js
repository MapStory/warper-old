var un_bounds;

function uinit(){
  delete umap;
  delete unwarped_image;
  un_bounds = new OpenLayers.Bounds(0,0, unwarped_image_width, unwarped_image_height);
  unwarped_init();
}

function unwarped_init() {
  if (typeof(umap) == 'undefined') {
    umap = new OpenLayers.Map('unmap',  
         { controls: [new OpenLayers.Control.PanZoomBar()],     maxExtent: un_bounds,   maxResolution: 10.496, numZoomLevels: 8});
    umap.events.register("addlayer", umap, function(e){umap.zoomToMaxExtent();}); 
    var unwarped_image = new OpenLayers.Layer.WMS( title, wms_url, { format: 'image/png', status: 'unwarped' } );
    umap.addLayer(unwarped_image);
  }

  if (!umap.getCenter()){
    umap.zoomToExtent(un_bounds);
  }

  //umap.zoomToExtent(un_bounds);
  umap.zoomToMaxExtent();

  // Disable mousewheel zoom to prevent overloading server with too
  // many requests. This version of open street map supports
  // cumulative scroll, but not interval scrolling. Must upgrade
  // OSM to get proper functionality.
  // http://openlayers.org/dev/examples/mousewheel-interval.html
  var i, l, c = umap.getControlsBy( "zoomWheelEnabled", true );
  for ( i = 0, l = c.length; i < l; i++ ) {
      c[i].disableZoomWheel();
  }
}
