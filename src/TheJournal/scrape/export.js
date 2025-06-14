;(function scrapeDungeonBosses(){
    // 1) collect all boss‐rows
    const rows = document.querySelectorAll('tbody.clickable tr')
    const bosses = []
    rows.forEach(row => {
      const bossDiv = row.querySelector('td:first-child div.icon-boss-padded')
      if(!bossDiv) return
      const a = bossDiv.querySelector('a[href*="?npc="]')
      if(!a) return
      const m = a.getAttribute('href').match(/npc=(\d+)/)
      if(!m) return
  
      const bossID = m[1]
      const name   = a.textContent.trim()
      const lvlTd  = row.children[1]
      const rare   = /Rare/.test(lvlTd.textContent)
  
      bosses.push({ bossID, name, rare })
    })
  
    // 2) rares first
    bosses.sort((a,b) => (b.rare === a.rare ? 0 : b.rare ? 1 : -1))
  
    // 3) grab dungeon name and build icon path
    const zoneLink = document.querySelector(
      'tbody.clickable tr td:nth-child(3) a.q1[href*="zone"]'
    )
    const dungeonName = zoneLink ? zoneLink.textContent.trim() : 'Unknown'
    const iconName    = dungeonName.replace(/\s+/g, '')
    const category    = 'CLASSIC'     // change if TBC/WOTLK/etc
    const iconPath    =
      `Interface\\\\Addons\\\\TheJournal\\\\Assets\\\\Buttons\\\\UI-EJ-DUNGEONBUTTON-` +
      `${iconName}.blp`
  
    // 4) output
    console.log('table.insert(Journal.djDungeons, {')
    console.log(`    name = "${dungeonName}",`)
    console.log(`    category = "${category}",`)
    console.log(`    icon = "${iconPath}",`)
    console.log('    bosses = {')
    bosses.forEach(b => {
      console.log('        {')
      console.log(`            bossID = ${b.bossID},`)
      console.log(`            name   = "${b.name}",`)
      console.log(`            rare   = ${b.rare},`)
      console.log('            flat   = itemdir,')
      console.log('            spells = {},')
      console.log('        },')
    })
    console.log('    },')
    console.log('});')
  })()