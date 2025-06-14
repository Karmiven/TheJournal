// Minimal WoW SpellData extractor – prints only the Lua snippet you want
(function() {
    // helper: find a row in #spelldetails by its TH text
    function getFieldText(label) {
      const tbl = document.getElementById('spelldetails');
      if (!tbl) return '';
      const row = Array.from(tbl.querySelectorAll('tr')).find(r =>
        r.querySelector('th')?.textContent.toLowerCase().includes(label)
      );
      return row ? row.querySelector('td')?.textContent.trim() || '' : '';
    }
    function getFieldNumber(label, rx) {
      const txt = getFieldText(label);
      const m = txt.match(rx);
      return m ? parseFloat(m[1]) : 0;
    }
  
    // 1) icon
    let iconSrc = '';
    const ins = document.querySelector('ins[style*="url("]');
    if (ins) {
      iconSrc = getComputedStyle(ins).backgroundImage;
    } else {
      iconSrc = document.querySelector('img[src*="icons"]')?.src || '';
    }
    iconSrc = iconSrc.replace(/^url\(['"]?/, '').replace(/['"]?\)$/, '');
    const mi = iconSrc.match(/\/([^\/]+)\.(?:jpg|png)$/i);
    const icon = mi
      ? `Interface\\\\Icons\\\\${mi[1]}`
      : 'Interface\\\\Icons\\\\spell_nature_healingtouch';
  
    // 2) name
    const h1 = document.querySelector('h1.h1-icon');
    const name = h1
      ? h1.textContent.replace(/\s+/g, ' ').replace(/★/g, '').trim()
      : (document.querySelector('h1')?.textContent.trim() || 'Unknown Spell');
  
    // 3) description
    const description = (
      document.querySelector('.wowhead-tooltip .q') ||
      document.querySelector('.tooltip-content .q') ||
      document.querySelector('[class*="tooltip"] .q')
    )?.textContent.trim() || 'No description available.';
  
    // 4) numeric fields
    const duration = getFieldNumber('duration', /(\d+)\s*seconds?/i);
    const casttime = getFieldNumber('cast time', /(\d+(?:\.\d+)?)\s*seconds?/i);
    const cooldown = getFieldNumber('cooldown', /(\d+(?:\.\d+)?)\s*seconds?/i);
  
    // 5) build the Lua snippet
    const lua = `{
      icon        = "${icon}",
      name        = "${name.replace(/"/g, '\\"')}",
      description = "${description.replace(/"/g, '\\"')}",
      duration    = ${duration},
      casttime    = ${casttime},
      cooldown    = ${cooldown},
  },`;
  
    // 6) clear and output only that snippet
    console.clear();
    console.log(lua);
  
    // 7) silently copy to clipboard
    if (typeof copy === 'function') {
      copy(lua);
    } else if (navigator.clipboard?.writeText) {
      navigator.clipboard.writeText(lua).catch(()=>{});
    } else {
      const ta = document.createElement('textarea');
      ta.value = lua;
      ta.style.position = 'fixed';
      ta.style.opacity = '0';
      document.body.appendChild(ta);
      ta.select();
      document.execCommand('copy');
      document.body.removeChild(ta);
    }
  })();