Pod::Spec.new do |s|
  s.name	= "proj4"
  s.version	= "4.9.2"
  s.summary	= "Proj4 is a catographic projections library."
  s.description = <<-DESC
PROJ.4 is in active use by  GRASS GIS,  MapServer,  PostGIS,  Thuban,  OGDI,  Mapnik,  TopoCad, and  OGRCoordinateTransformation as well as various other projects.

Since work started on the PROJ.4.4.x series of releases, various bug fixes have been incorporated, and the build system has been overhauled to use autoconf/libtool. Support has also been added for 3 and 7 parameter datum shifts, the PJ* structure now also carries datum information and PJ* can be considered a full coordinate system (geographic coordinate systems are also now supported with the +proj=latlong pseudo-projection). The new cs2cs program performs a similar function to the proj program, but transforming from any one coordinate system to another. The new pj_transform() is used to access the extended coordinate system to coordinate system transformation with datum shifting. Work is underway to improve ThreadSafety.

A mapping file (epsg) has also been introduced mapping most EPSG ( http://www.epsg.org/) coordinate systems to PROJ.4 format.

As of May 2008 PROJ.4 has become part of the  MetaCRS project, a confederation of coordinate systems related projects and it is hoped MetaCRS will enter incubation as an  OSGeo project.
  DESC
  s.homepage	= "https://github.com/OSGeo/proj.4"
  s.license	= { :type => "MIT",
		    :file => "COPYING" }
  s.author	= { "Frank Warmerdam" => "warmerdam@pobox.com",
		    "Gerald Evenden" => "noreply@usgs.gov" }
  s.source	= { :git => "https://github.com/OSGeo/proj.4.git", :tag => s.version }

  # gross hack to make this work with AFNetworking
  s.compiler_flags = '-D_SYSTEMCONFIGURATION_H -D__MOBILECORESERVICES__ -D__CORESERVICES__'

  s.ios.deployment_target = "4.0"
  s.osx.deployment_target = "10.6"

  s.prepare_command = <<-CMD
    ./configure
  CMD

  s.public_header_files = 'src/proj_api.h'
  s.source_files = "src/*.{c,h}"
  s.exclude_files = "**/proj.c", "**/nad2bin.c", "**/multistresstest.c", "**/geod.c", "**/cs2cs.c", "**/org_proj4_PJ.h", "**/jniproj.c"
  s.requires_arc = false
end
