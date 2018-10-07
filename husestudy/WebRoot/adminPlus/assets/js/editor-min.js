/**
 * @fileOverview \u7f16\u8f91\u5668\u547d\u540d\u7a7a\u95f4\u5165\u53e3
 * @ignore
 */
define("bui/editor", ["bui/common", "bui/form", "bui/editor/editor", "bui/editor/record", "bui/editor/dialog"], function(e) {
	var t = e("bui/common"),
		n = e("bui/form"),
		r = t.namespace("Editor");
	return t.mix(r, {
		Editor: e("bui/editor/editor"),
		RecordEditor: e("bui/editor/record"),
		DialogEditor: e("bui/editor/dialog")
	}), r
}), define("bui/editor/mixin", function(e) {
	function t(e) {
		var t = e,
			n = t.get("controlCfgField"),
			r = t.get(n),
			i = t.addChild(r);
		t.setInternal(n, i)
	}
	var n = function() {
		t(this)
	};
	return n.ATTRS = {
		acceptEvent: {
			value: "autohide"
		},
		preventHide: {
			value: !0
		},
		changeSourceEvent: {
			value: "show triggerchange"
		},
		ignoreInputFields: {
			value: !1
		},
		innerValueField: {},
		emptyValue: {},
		controlCfgField: {},
		autoUpdate: {
			value: !0
		},
		events: {
			value: {
				accept: !1,
				cancel: !1
			}
		}
	}, n.prototype = {
		__bindUI: function() {
			var e = this,
				t = e.get("acceptEvent"),
				n = e.get("changeSourceEvent");
			t && e.on(t, function() {
				if(e.accept()) return;
				if(e.get("preventHide")) return !1;
				e.cancel()
			}), n && e.on(n, function() {
				e.setValue(e.getSourceValue()), e.get("visible") && e.focus()
			})
		},
		getInnerControl: function() {
			var e = this,
				t = e.get("children");
			return t[0]
		},
		setValue: function(e) {
			var t = this,
				n = t.getInnerControl();
			t.set("editValue", e), t.clearControlValue(), n.set(t.get("innerValueField"), e), e || t.valid()
		},
		getValue: function() {
			var e = this,
				t = e.getInnerControl();
			return t.get(e.get("innerValueField"))
		},
		isValid: function() {
			var e = this,
				t = e.getInnerControl();
			return t.isValid ? t.isValid() : !0
		},
		valid: function() {
			var e = this,
				t = e.getInnerControl();
			t.valid && t.valid()
		},
		getErrors: function() {
			var e = this,
				t = e.getInnerControl();
			return t.getErrors ? t.getErrors() : []
		},
		isChange: function() {
			var e = this,
				t = e.get("editValue"),
				n = e.getValue();
			return t !== n
		},
		clearValue: function() {
			this.clearControlValue(), this.clearErrors()
		},
		clearControlValue: function() {
			var e = this,
				t = e.getInnerControl();
			t.set(e.get("innerValueField"), e.get("emptyValue"))
		},
		clearErrors: function() {
			var e = this,
				t = e.getInnerControl();
			t.clearErrors()
		},
		getSourceValue: function() {},
		updateSource: function() {},
		handleNavEsc: function() {
			this.cancel()
		},
		handleNavEnter: function(e) {
			var t = e.target;
			if(t.tagName === "TEXTAREA") return;
			t.tagName === "BUTTON" && $(t).trigger("click"), this.accept()
		},
		focus: function() {
			var e = this,
				t = e.getInnerControl();
			t.focus && t.focus()
		},
		accept: function() {
			var e = this,
				t;
			e.valid();
			if(!e.isValid()) return !1;
			t = e.getValue(), e.get("autoUpdate") && e.updateSource(t);
			if(e.fire("beforeaccept", {
					value: t
				}) == 0) return;
			return e.fire("accept", {
				value: t,
				editValue: e.get("editValue")
			}), e.hide(), !0
		},
		cancel: function() {
			this.fire("cancel"), this.clearValue(), this.hide()
		}
	}, n
}), define("bui/editor/editor", ["bui/common", "bui/overlay", "bui/editor/mixin"], function(e) {
	var t = e("bui/common"),
		n = e("bui/overlay").Overlay;
	CLS_TIPS = "x-editor-tips", Mixin = e("bui/editor/mixin");
	var r = n.extend([Mixin], {
		bindUI: function() {
			var e = this,
				t = e.getInnerControl();
			e.on("validchange", function(t) {
				!e.isValid() && e.get("visible") ? e._showError(e.getErrors()) : e._hideError()
			}), e.on("hide", function() {
				e._hideError()
			}), e.on("show", function() {
				e.isValid() || e._showError(e.getErrors())
			})
		},
		_initOverlay: function() {
			var e = this,
				t = new n({
					children: [{
						xclass: "simple-list",
						itemTpl: '<li><span class="x-icon x-icon-mini x-icon-error" title="{error}">!</span>&nbsp;<span>{error}</span></li>'
					}],
					elCls: CLS_TIPS,
					autoRender: !0
				});
			return e.set("overlay", t), t
		},
		_getErrorList: function() {
			var e = this,
				t = e.get("overlay");
			return t && t.get("children")[0]
		},
		_showError: function(e) {
			var n = this,
				r = n.get("overlay") || n._initOverlay(),
				i = n._getErrorList(),
				s = n.get("errorAlign"),
				o = t.Array.map(e, function(e) {
					return {
						error: e
					}
				});
			i.set("items", o), s.node = n.get("el"), r.set("align", s), r.show()
		},
		_hideError: function() {
			var e = this,
				t = e.get("overlay");
			t && t.hide()
		},
		getSourceValue: function() {
			var e = this,
				t = e.get("curTrigger");
			return t.text()
		},
		updateSource: function(e) {
			var t = this,
				n = t.get("curTrigger");
			n && n.length && n.text(e)
		},
		_uiSetWidth: function(e) {
			var t = this;
			if(e != null) {
				var n = t.getInnerControl();
				n.set && n.set("width", e)
			}
		}
	}, {
		ATTRS: {
			innerValueField: {
				value: "value"
			},
			emptyValue: {
				value: ""
			},
			autoHide: {
				value: !0
			},
			controlCfgField: {
				value: "field"
			},
			defaultChildCfg: {
				value: {
					tpl: "",
					forceFit: !0,
					errorTpl: ""
				}
			},
			defaultChildClass: {
				value: "form-field"
			},
			align: {
				value: {
					points: ["tl", "tl"]
				}
			},
			errorAlign: {
				value: {
					points: ["bl", "tl"],
					offset: [0, 10]
				}
			},
			overlay: {},
			field: {
				value: {}
			}
		}
	}, {
		xclass: "editor"
	});
	return r
}), define("bui/editor/record", ["bui/common", "bui/editor/editor"], function(e) {
	var t = e("bui/common"),
		n = e("bui/editor/editor"),
		r = n.extend({
			getSourceValue: function() {
				return this.get("record")
			},
			updateSource: function(e) {
				var n = this,
					r = n.get("record");
				t.mix(r, e)
			},
			_uiSetRecord: function(e) {
				this.setValue(e)
			}
		}, {
			ATTRS: {
				innerValueField: {
					value: "record"
				},
				acceptEvent: {
					value: ""
				},
				emptyValue: {
					value: {}
				},
				autoHide: {
					value: !1
				},
				record: {
					value: {}
				},
				controlCfgField: {
					value: "form"
				},
				form: {
					value: {}
				},
				errorAlign: {
					value: {
						points: ["tr", "tl"],
						offset: [10, 0]
					}
				},
				defaultChildCfg: {
					valueFn: function() {
						var e = this;
						return {
							xclass: "form",
							errorTpl: "",
							showError: !0,
							showChildError: !0,
							defaultChildCfg: {
								elCls: "bui-inline-block",
								tpl: "",
								forceFit: !0
							},
							buttons: [{
								btnCls: "button button-primary",
								text: "\u786e\u5b9a",
								handler: function() {
									e.accept()
								}
							}, {
								btnCls: "button",
								text: "\u53d6\u6d88",
								handler: function() {
									e.cancel()
								}
							}]
						}
					}
				}
			}
		}, {
			xclass: "record-editor"
		});
	return r
}), define("bui/editor/dialog", ["bui/overlay", "bui/editor/mixin"], function(e) {
	var t = e("bui/overlay").Dialog,
		n = e("bui/editor/mixin"),
		r = t.extend([n], {
			getSourceValue: function() {
				return this.get("record")
			},
			handleNavEnter: function(e) {
				var t = this,
					n = t.get("success"),
					r = e.target;
				if(r.tagName === "TEXTAREA") return;
				r.tagName === "BUTTON" && $(r).trigger("click"), n ? n.call(t) : this.accept()
			},
			updateSource: function(e) {
				var t = this,
					n = t.get("record");
				BUI.mix(n, e)
			},
			_uiSetRecord: function(e) {
				this.setValue(e)
			}
		}, {
			ATTRS: {
				innerValueField: {
					value: "record"
				},
				acceptEvent: {
					value: ""
				},
				record: {
					value: {}
				},
				emptyValue: {
					value: {}
				},
				controlCfgField: {
					value: "form"
				},
				changeSourceEvent: {
					value: ""
				},
				defaultChildCfg: {
					value: {
						xclass: "form-horizontal"
					}
				},
				focusable: {
					value: !0
				},
				success: {
					value: function() {
						this.accept()
					}
				},
				form: {
					value: {}
				}
			}
		}, {
			xclass: "dialog-editor"
		});
	return r
});