angular.module('grapes.services').factory('HTTPProxy', ['$resource', 'Extends',
	function($resource, Extends) {
		return {
			init: function(config){
				var url, resource, config = config || {};
				switch(config.way){
					case 'jsonp':
						Extends.__default__(config, {
							method: 'JSONP',
							params: {callback:'JSON_CALLBACK'}
						});
						url = 'http://happymuslim.net/jsonpproxy.php';
						break;
					case 'ajax':
						Extends.__default__(config, {method: 'GET'});
						url = config.uri;
						break;
					case 'server':
					default:
						Extends.__default__(config, {method: 'GET'});
						url = './php/jsonpproxy.php';
				}
				resource = $resource(url, {}, {
					request: config
				});
				return resource;
			}
		}
	}
]);