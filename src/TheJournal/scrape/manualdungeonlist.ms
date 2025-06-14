// ==UserScript==
// @name         WoWHead Dungeon Boss Scraper
// @namespace    http://your.home/
// @version      1.2
// @description  Scrape dungeon bosses & copy Journal.djDungeons entry
// @match        https://www.wowhead.com/wotlk/npcs*
// @match        https://www.wowhead.com/wotlk/zone=*
// @grant        GM_setClipboard
// @run-at       document-end
// ==/UserScript==

(function () {
  'use strict';

  // wait until at least one row shows up (or timeout after ~5s)
  async function waitForRows() {
    for (let i = 0; i < 10; i++) {
      const rows = document.querySelectorAll('tbody.clickable tr');
      if (rows.length) return rows;
      await new Promise((r) => setTimeout(r, 500));
    }
    return document.querySelectorAll('tbody.clickable tr');
  }

  function scrapeDungeonBosses(rows) {
    const bosses = [];
    rows.forEach((row) => {
      // match any link whose href contains "npc="
      const link = row.querySelector(
        'td.icon-boss-padded a[href*="npc="]'
      );
      if (!link) return;

      const m = link.href.match(/npc=(\d+)/);
      if (!m) return;

      const bossID = m[1];
      const name = link.textContent.trim().replace(/"/g, '\\"');
      const lvlTd = row.children[1];
      const rare = /Rare/.test(lvlTd.textContent);

      bosses.push({ bossID, name, rare });
    });

    // sort rares first
    bosses.sort((a, b) => (b.rare === a.rare ? 0 : b.rare ? 1 : -1));
    return bosses;
  }

  function buildLua(bosses) {
    // find the dungeon name from the Location column
    const zoneLink = document.querySelector(
      'tbody.clickable tr td:nth-child(3) a.q1[href*="zone"]'
    );
    const dungeonName = zoneLink
      ? zoneLink.textContent.trim()
      : 'Unknown';
    const iconName = dungeonName.replace(/\s+/g, '');
    const category = 'CLASSIC';
    const iconPath =
      'Interface\\\\Addons\\\\TheJournal\\\\Assets\\\\Buttons\\\\' +
      `UI-EJ-DUNGEONBUTTON-${iconName}.blp`;

    let out = '';
    out += 'table.insert(Journal.djDungeons, {\n';
    out += `    name     = "${dungeonName}",\n`;
    out += `    category = "${category}",\n`;
    out += `    icon     = "${iconPath}",\n`;
    out += '    bosses   = {\n';
    bosses.forEach((b) => {
      out += '        {\n';
      out += `            bossID = ${b.bossID},\n`;
      out += `            name   = "${b.name}",\n`;
      out += `            rare   = ${b.rare},\n`;
      out += '            flat   = itemdir,\n';
      out += '            spells = {},\n';
      out += '        },\n';
    });
    out += '    },\n';
    out += '});\n';
    return out;
  }

  function copyToClipboard(text) {
    if (typeof GM_setClipboard === 'function') {
      GM_setClipboard(text);
    } else if (
      navigator.clipboard &&
      typeof navigator.clipboard.writeText === 'function'
    ) {
      navigator.clipboard.writeText(text);
    } else {
      throw new Error('No clipboard API available');
    }
  }

  // create our button
  const btn = document.createElement('button');
  btn.textContent = 'Copy Dungeon Data';
  Object.assign(btn.style, {
    position: 'fixed',
    top: '12px',
    right: '12px',
    padding: '6px 12px',
    zIndex: 9999,
    background: '#0477c1',
    color: '#fff',
    border: 'none',
    borderRadius: '3px',
    cursor: 'pointer',
  });

  btn.addEventListener('click', async () => {
    try {
      const rows = await waitForRows();
      if (!rows.length) {
        alert('No NPC rows found. Are you on the NPCs tab?');
        return;
      }

      const bosses = scrapeDungeonBosses(rows);
      if (!bosses.length) {
        alert(
          'No bosses found. Make sure each boss row has ' +
            'class "icon-boss-padded" and a link with "npc=" in its href.'
        );
        return;
      }

      const lua = buildLua(bosses);
      copyToClipboard(lua);
      alert(`Copied ${bosses.length} bosses to clipboard!`);
    } catch (e) {
      alert('Error: ' + e.message);
      console.error(e);
    }
  });

  document.body.appendChild(btn);
})();