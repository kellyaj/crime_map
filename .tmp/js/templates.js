this["JST"] = this["JST"] || {};

this["JST"]["js/templates/info_view.ejs"] = function(obj) {
obj || (obj = {});
var __t, __p = '', __e = _.escape;
with (obj) {
__p += '<h1> ' +
((__t = ( primary_type )) == null ? '' : __t) +
'</h1>\n<h2> ' +
((__t = ( description )) == null ? '' : __t) +
'</h2>\n<h3> ' +
((__t = ( location_description )) == null ? '' : __t) +
' ' +
((__t = ( arrest_status )) == null ? '' : __t) +
'</h3>\n<img src=' +
((__t = ( streetviewUrl )) == null ? '' : __t) +
'>\n\n';

}
return __p
};