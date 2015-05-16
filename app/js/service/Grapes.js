angular.module('grapes.services').factory('GrapesServ', ['HTTPProxy', 'Formator',
	function(HTTPProxy, Formator) {
		var factory = {};
		var way = 'ajax'; // jsonp/server

		factory.getUser = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'user',
				user: params.user,
				res: 'json'
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: false,
				transformResponse: transform,
				way: way
			};

			factory.userResource = factory.userResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.userResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.userResource.request(request.params, callback);
			}
		};

		factory.getActivityMembers = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'act_members',
				act: params.act,
				res: 'json'
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: true,
				transformResponse: transform,
				way: way
			};

			factory.activityMembersResource = factory.activityMembersResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.activityMembersResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.activityMembersResource.request(request.params, callback);
			}
		};

		factory.getUserActivities = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'user_acts',
				user: params.user,
				res: 'json'
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: true,
				transformResponse: transform,
				way: way
			};

			factory.userActivitiesResource = factory.userActivitiesResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.userActivitiesResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.userActivitiesResource.request(request.params, callback);
			}
		};

		factory.getPublicActivities = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'public_acts',
				count: params.count,
				res: 'json'
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: true,
				transformResponse: transform,
				way: way
			};

			factory.publicActivitiesResource = factory.publicActivitiesResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.publicActivitiesResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.publicActivitiesResource.request(request.params, callback);
			}
		};

		factory.getActivityDetail = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'act_detail',
				act: params.act,
				res: 'json'
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: false,
				transformResponse: transform,
				way: way
			};

			factory.activityDetailResource = factory.activityDetailResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.activityDetailResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.activityDetailResource.request(request.params, callback);
			}
		};

		factory.doLogin = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'check_user',
				user: params.username,
				password: params.userpass,
				res: 'json'
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: false,
				transformResponse: transform,
				way: way
			};

			factory.doLoginResource = factory.doLoginResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.doLoginResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.doLoginResource.request(request.params, callback);
			}
		};

		factory.doRegister = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'add_user',
				user: params.username,
				password: params.userpass,
				nickname: params.nickname,
				sex: params.sex,
				mail: params.email,
				phone: params.phone,
				address: params.address,
				headicon: params.headicon,
				res: 'json'
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: false,
				transformResponse: transform,
				way: way
			};

			factory.doRegisterResource = factory.doRegisterResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.doRegisterResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.doRegisterResource.request(request.params, callback);
			}
		};

		factory.joinActivity = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'join_act',
				act: params.act,
				user: params.user,
				res: 'json'
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: false,
				transformResponse: transform,
				way: way
			};

			factory.joinActivityResource = factory.joinActivityResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.joinActivityResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.joinActivityResource.request(request.params, callback);
			}
		};

		factory.addActivity = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'add_act',
				title: params.title || '',
				category: params.category || 0,
				planner: params.planner || '',
				time: params.time || '',
				address: params.address || '',
				fee: params.fee || '',
				content: params.content || '',
				comment: params.comment || '',
				image_urls: params.image_urls || '',
				scope: params.scope || 0
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: false,
				transformResponse: transform,
				way: way
			};

			factory.addActivityResource = factory.addActivityResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.addActivityResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.addActivityResource.request(request.params, callback);
			}
		};

		factory.addActivityItems = function(params, callback) {
			var defaultParams = {
				_id: 1,
				api: 'add_act_items',
				act: params.act,
				items: JSON.stringify(params.items)
					// title: params.title,
					// category: params.category || 0,
					// place: params.place || '',
					// lasting: params.lasting || '',
					// content: params.content || '',
					// image_urls: params.image_urls || ''
			};

			var transform = function(result) {
				if (typeof result === 'string') {
					result = JSON.parse(result);
				}
				return result.data;
			};

			var request = {
				url: 'http://happymuslim.net/wx/db.php',
				params: defaultParams,
				postData: {},
				headers: {
					'X-Contract': true
				}
			};

			var config = {
				uri: request.url,
				format: 'json',
				isArray: false,
				transformResponse: transform,
				way: way
			};

			factory.addActivityItemsResource = factory.addActivityItemsResource || HTTPProxy.init(config);
			if (way === 'jsonp' || way === 'server') {
				return factory.addActivityItemsResource.request(Formator.encodeJsonpRequest(request), callback);
			} else {
				return factory.addActivityItemsResource.request(request.params, callback);
			}
		};

		return factory;
	}
]);