(function () {
	if (document.querySelector(".iu-site-header")) {
		return;
	}

	function ready(callback) {
		if (document.body) {
			callback();
			return;
		}

		document.addEventListener("DOMContentLoaded", callback, { once: true });
	}

	function archiveBase() {
		var script = document.currentScript;
		var src = script && script.src ? script.src : "";
		var marker = "/iu/site-nav.js";
		var markerIndex = src.indexOf(marker);

		if (markerIndex >= 0) {
			return src.slice(0, markerIndex) + "/iu/";
		}

		return "/iu/";
	}

	function appendLink(nav, href, label) {
		var link = document.createElement("a");
		link.href = href;
		link.appendChild(document.createTextNode(label));
		nav.appendChild(link);
	}

	function ensureStyles() {
		if (document.getElementById("iu-site-header-styles")) {
			return;
		}

		var hasSiteCss = document.querySelector('link[href*="/iu/site.css"], link[href*="site.css"]');
		if (hasSiteCss) {
			return;
		}

		var style = document.createElement("style");
		style.id = "iu-site-header-styles";
		style.textContent = [
			".iu-skip-link{position:absolute;top:8px;left:8px;z-index:10000;padding:8px 10px;background:#f6d24a;color:#080808;font:700 14px/1 Arial,Helvetica,sans-serif;text-decoration:none;transform:translateY(-160%);}",
			".iu-skip-link:focus{transform:translateY(0);}",
			".iu-site-header{position:sticky;top:0;z-index:9999;border-bottom:2px solid #c43903;background:#070707;box-shadow:0 8px 22px rgba(0,0,0,.4);color:#f6d24a;font-family:Arial,Helvetica,sans-serif;font-size:14px;line-height:1.2;}",
			".iu-site-header__inner{display:flex;align-items:center;gap:14px;max-width:1120px;margin:0 auto;padding:8px 12px;}",
			".iu-site-header__brand{flex:0 0 auto;color:#f6d24a;font-weight:700;text-decoration:none;text-transform:uppercase;letter-spacing:0;}",
			".iu-site-header__nav{display:flex;flex:1 1 auto;flex-wrap:wrap;align-items:center;gap:4px;justify-content:flex-end;}",
			".iu-site-header__nav a{display:inline-flex;align-items:center;min-height:32px;padding:6px 9px;border:1px solid rgba(246,210,74,.32);background:#111;color:#f3f3f3;font-weight:700;text-decoration:none;}",
			".iu-site-header__brand:focus,.iu-site-header__brand:hover,.iu-site-header__nav a:focus,.iu-site-header__nav a:hover{background:#c43903;color:#fff;outline:2px solid #f6d24a;outline-offset:1px;}",
			".iu-content-anchor{display:block;position:relative;top:-56px;visibility:hidden;}",
			"@media (max-width:760px){.iu-site-header{position:static}.iu-site-header__inner{align-items:stretch;flex-direction:column;gap:8px}.iu-site-header__nav{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));justify-content:stretch}.iu-site-header__nav a{justify-content:center;text-align:center}}"
		].join("");

		document.head.appendChild(style);
	}

	ready(function () {
		ensureStyles();
		var base = archiveBase();
		var fragment = document.createDocumentFragment();
		var skip = document.createElement("a");
		var header = document.createElement("header");
		var inner = document.createElement("div");
		var brand = document.createElement("a");
		var nav = document.createElement("nav");
		var anchor = document.createElement("span");

		skip.className = "iu-skip-link";
		skip.href = "#iu-content";
		skip.appendChild(document.createTextNode("Skip to content"));

		header.className = "iu-site-header";
		header.setAttribute("role", "banner");

		inner.className = "iu-site-header__inner";

		brand.className = "iu-site-header__brand";
		brand.href = base;
		brand.appendChild(document.createTextNode("Internet Underground"));

		nav.className = "iu-site-header__nav";
		nav.setAttribute("aria-label", "Site navigation");

		appendLink(nav, base + "home.htm", "Home");
		appendLink(nav, base + "current/", "Current");
		appendLink(nav, base + "archive/", "Archives");
		appendLink(nav, base + "online/", "Online");
		appendLink(nav, base + "webguide/", "WebGuide");
		appendLink(nav, base + "search/", "Search");
		appendLink(nav, base + "contact/", "Contact");

		anchor.className = "iu-content-anchor";
		anchor.id = "iu-content";
		anchor.setAttribute("aria-hidden", "true");

		inner.appendChild(brand);
		inner.appendChild(nav);
		header.appendChild(inner);
		fragment.appendChild(skip);
		fragment.appendChild(header);
		fragment.appendChild(anchor);
		document.body.insertBefore(fragment, document.body.firstChild);
	});
}());
