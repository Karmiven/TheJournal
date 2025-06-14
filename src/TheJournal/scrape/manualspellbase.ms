// ==UserScript==
// @name         WoWHead SpellData Extractor + Favorite & Copy
// @namespace    http://tampermonkey.net/
// @version      0.2-es5
// @description  Adds a favorite star and a Copy Data button on Wowhead
// @match        https://www.wowhead.com/*spell=*
// @grant        GM_addStyle
// @grant        GM_setValue
// @grant        GM_getValue
// @grant        GM_registerMenuCommand
// @run-at       document-end
// ==/UserScript==

(function() {
  'use strict';

  // ——— Helpers —————————————————————————————————

  function getFieldText(label) {
    var tbl = document.getElementById('spelldetails');
    if (!tbl) return '';
    var rows = tbl.getElementsByTagName('tr');
    for (var i = 0; i < rows.length; i++) {
      var th = rows[i].getElementsByTagName('th')[0];
      if (th && th.textContent.toLowerCase()
        .indexOf(label.toLowerCase()) !== -1) {
        var td = rows[i].getElementsByTagName('td')[0];
        return td ? td.textContent.trim() : '';
      }
    }
    return '';
  }

  function getFieldNumber(label, rx) {
    var txt = getFieldText(label);
    var m = txt.match(rx);
    return m ? parseFloat(m[1]) : 0;
  }

  // ——— Core extractor ————————————————————————

  function extractSpellData() {
    // 1) icon
    var spellId = (window.location.href.match(/spell=(\d+)/)||[])[1];
    var ins = document.querySelector('#ic' + spellId +
      ' ins[style*="url("]');
    var iconSrc = '';
    if (ins) {
      iconSrc = getComputedStyle(ins).backgroundImage;
    } else {
      var img = document.querySelector('img[src*="icons"]');
      iconSrc = img ? img.src : '';
    }
    iconSrc = iconSrc.replace(/^url\(['"]?/, '')
                     .replace(/['"]?\)$/, '');
    var mi = iconSrc.match(/\/([^\/]+)\.(?:jpg|png)$/i);
    var icon = mi
      ? 'Interface\\\\Icons\\\\' + mi[1]
      : 'Interface\\\\Icons\\\\spell_nature_healingtouch';

    // 2) name
    var h1 = document.querySelector('h1.heading-size-1');
    var rawName = h1.textContent.replace(/\s+/g, ' ')
                    .replace(/★|☆/, '').trim();
    var name = rawName.replace(/"/g, '\\"');

    // 3) description
    var descEl = document.querySelector('#tt' + spellId + ' .q');
    var description = descEl
      ? descEl.textContent.trim().replace(/"/g, '\\"')
      : 'No description available.';

    // 4) numeric
    var duration = getFieldNumber('Duration', /(\d+)\s*seconds?/i);
    var casttime = getFieldNumber(
      'Cast time',
      /(\d+(?:\.\d+)?)\s*seconds?/i
    );
    var cooldown = getFieldNumber(
      'Cooldown',
      /(\d+(?:\.\d+)?)\s*seconds?/i
    );

    // 5) Lua
    var lua = '{\n'        +
      '  icon        = "' + icon        + '",\n' +
      '  name        = "' + name        + '",\n' +
      '  description = "' + description + '",\n' +
      '  duration    = '  + duration    + ',\n' +
      '  casttime    = '  + casttime    + ',\n' +
      '  cooldown    = '  + cooldown    + ',\n' +
      '},';

    // 6) copy
    console.clear();
    console.log(lua);
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(lua).catch(function(){});
    } else {
      var ta = document.createElement('textarea');
      ta.value = lua;
      ta.style.position = 'fixed';
      ta.style.opacity = '0';
      document.body.appendChild(ta);
      ta.select();
      document.execCommand('copy');
      document.body.removeChild(ta);
    }
  }

  // ——— Styles —————————————————————————————————

  GM_addStyle('\n'                     +
    '.fav-star {\n'                   +
    '  margin-left: 8px;\n'           +
    '  cursor: pointer;\n'            +
    '  color: gold;\n'                +
    '  font-size: 1.2em;\n'           +
    '}\n'
  );

  // ——— Init: wait for Wowhead to finish injecting —————

  function initWhenReady() {
    var h1 = document.querySelector('h1.heading-size-1');
    var openLinksBtn = document.getElementById('open-links-button');
    if (!h1 || !openLinksBtn) {
      return setTimeout(initWhenReady, 300);
    }
    initFavorite(h1);
    initCopyButton(openLinksBtn);
  }
  initWhenReady();

  // ——— Favorite star ——————————————————————————————

  function initFavorite(h1) {
    var m = window.location.href.match(/spell=(\d+)/);
    if (!m) return;
    var spellId = m[1];
    var favKey = 'favspell_' + spellId;
    var isFav = GM_getValue(favKey, false);

    var star = h1.querySelector('.fav-star');
    if (!star) {
      star = document.createElement('span');
      star.className = 'fa fav-star';
      star.title = 'Toggle favorite';
      h1.appendChild(star);
    }
    star.classList.toggle('fa-star', isFav);
    star.classList.toggle('fa-star-o', !isFav);

    star.addEventListener('click', function() {
      isFav = !isFav;
      GM_setValue(favKey, isFav);
      star.classList.toggle('fa-star', isFav);
      star.classList.toggle('fa-star-o', !isFav);
    });
  }

  // ——— Copy-data button ——————————————————————————————

  function initCopyButton(openLinksBtn) {
    var copyBtn = openLinksBtn.cloneNode(true);
    copyBtn.id = 'copy-spelldata-button';
    copyBtn.classList.remove('fa-link');
    copyBtn.classList.add('fa-copy');
    copyBtn.textContent = 'Copy Data';
    copyBtn.style.marginLeft = '4px';
    copyBtn.addEventListener('click', extractSpellData);

    openLinksBtn.parentNode.insertBefore(
      copyBtn, openLinksBtn.nextSibling
    );

    GM_registerMenuCommand('Copy SpellData', extractSpellData);
  }

})();