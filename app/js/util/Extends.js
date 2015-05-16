angular.module('grapes.utils').factory('Extends', [function() {
	return {
		extend: function(Child, Parent) {
			var F = function() {};
			F.prototype = Parent.prototype;
			Child.prototype = new F();
			Child.prototype.constructor = Child;
			Child.uber = Parent.prototype;
		},
		__default__: function(obj, defaults) {
			for (var p in defaults) {
				if (!(p in obj))
					obj[p] = defaults[p];
			}
			return obj;
		}
	}
}]);