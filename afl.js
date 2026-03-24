document.addEventListener("DOMContentLoaded", function() {

var DEPT_REGION = {
  "01": "Auvergne-Rhône-Alpes",
  "02": "Hauts-de-France",
  "03": "Auvergne-Rhône-Alpes",
  "04": "Provence-Alpes-Côte d'Azur",
  "05": "Provence-Alpes-Côte d'Azur",
  "06": "Provence-Alpes-Côte d'Azur",
  "07": "Auvergne-Rhône-Alpes",
  "08": "Grand Est",
  "09": "Occitanie",
  "10": "Grand Est",
  "11": "Occitanie",
  "12": "Occitanie",
  "13": "Provence-Alpes-Côte d'Azur",
  "14": "Normandie",
  "15": "Auvergne-Rhône-Alpes",
  "16": "Nouvelle-Aquitaine",
  "17": "Nouvelle-Aquitaine",
  "18": "Centre-Val de Loire",
  "19": "Nouvelle-Aquitaine",
  "2A": "Corse",
  "2B": "Corse",
  "21": "Bourgogne-Franche-Comté",
  "22": "Bretagne",
  "23": "Nouvelle-Aquitaine",
  "24": "Nouvelle-Aquitaine",
  "25": "Bourgogne-Franche-Comté",
  "26": "Auvergne-Rhône-Alpes",
  "27": "Normandie",
  "28": "Centre-Val de Loire",
  "29": "Bretagne",
  "30": "Occitanie",
  "31": "Occitanie",
  "32": "Occitanie",
  "33": "Nouvelle-Aquitaine",
  "34": "Occitanie",
  "35": "Bretagne",
  "36": "Centre-Val de Loire",
  "37": "Centre-Val de Loire",
  "38": "Auvergne-Rhône-Alpes",
  "39": "Bourgogne-Franche-Comté",
  "40": "Nouvelle-Aquitaine",
  "41": "Centre-Val de Loire",
  "42": "Auvergne-Rhône-Alpes",
  "43": "Auvergne-Rhône-Alpes",
  "44": "Pays de la Loire",
  "45": "Centre-Val de Loire",
  "46": "Occitanie",
  "47": "Nouvelle-Aquitaine",
  "48": "Occitanie",
  "49": "Pays de la Loire",
  "50": "Normandie",
  "51": "Grand Est",
  "52": "Grand Est",
  "53": "Pays de la Loire",
  "54": "Grand Est",
  "55": "Grand Est",
  "56": "Bretagne",
  "57": "Grand Est",
  "58": "Bourgogne-Franche-Comté",
  "59": "Hauts-de-France",
  "60": "Hauts-de-France",
  "61": "Normandie",
  "62": "Hauts-de-France",
  "63": "Auvergne-Rhône-Alpes",
  "64": "Nouvelle-Aquitaine",
  "65": "Occitanie",
  "66": "Occitanie",
  "67": "Grand Est",
  "68": "Grand Est",
  "69": "Auvergne-Rhône-Alpes",
  "70": "Bourgogne-Franche-Comté",
  "71": "Bourgogne-Franche-Comté",
  "72": "Pays de la Loire",
  "73": "Auvergne-Rhône-Alpes",
  "74": "Auvergne-Rhône-Alpes",
  "75": "Île-de-France",
  "76": "Normandie",
  "77": "Île-de-France",
  "78": "Île-de-France",
  "79": "Nouvelle-Aquitaine",
  "80": "Hauts-de-France",
  "81": "Occitanie",
  "82": "Occitanie",
  "83": "Provence-Alpes-Côte d'Azur",
  "84": "Provence-Alpes-Côte d'Azur",
  "85": "Pays de la Loire",
  "86": "Nouvelle-Aquitaine",
  "87": "Nouvelle-Aquitaine",
  "88": "Grand Est",
  "89": "Bourgogne-Franche-Comté",
  "90": "Bourgogne-Franche-Comté",
  "91": "Île-de-France",
  "92": "Île-de-France",
  "93": "Île-de-France",
  "94": "Île-de-France",
  "95": "Île-de-France",
  "971": "DOM-TOM",
  "972": "DOM-TOM",
  "973": "DOM-TOM",
  "974": "DOM-TOM",
  "976": "DOM-TOM",
};

function autofillRegion(deptId, displayId) {
  var code = document.getElementById(deptId).value;
  var display = document.getElementById(displayId);
  var hidden = document.getElementById(displayId + '-val');
  var region = DEPT_REGION[code] || '';
  if (region) {
    display.textContent = region;
    display.className = 'region-display filled';
    if (hidden) hidden.value = region;
  } else {
    display.textContent = '—';
    display.className = 'region-display';
    if (hidden) hidden.value = '';
  }
var DEPT_OPT_JS = '<option value="">— Dépt —</option><option value="01">01 – Ain</option><option value="02">02 – Aisne</option><option value="03">03 – Allier</option><option value="04">04 – Alpes-de-Haute-Prov.</option><option value="05">05 – Hautes-Alpes</option><option value="06">06 – Alpes-Maritimes</option><option value="07">07 – Ardèche</option><option value="08">08 – Ardennes</option><option value="09">09 – Ariège</option><option value="10">10 – Aube</option><option value="11">11 – Aude</option><option value="12">12 – Aveyron</option><option value="13">13 – Bouches-du-Rhône</option><option value="14">14 – Calvados</option><option value="15">15 – Cantal</option><option value="16">16 – Charente</option><option value="17">17 – Charente-Maritime</option><option value="18">18 – Cher</option><option value="19">19 – Corrèze</option><option value="2A">2A – Corse-du-Sud</option><option value="2B">2B – Haute-Corse</option><option value="21">21 – Côte-d\'Or</option><option value="22">22 – Côtes-d\'Armor</option><option value="23">23 – Creuse</option><option value="24">24 – Dordogne</option><option value="25">25 – Doubs</option><option value="26">26 – Drôme</option><option value="27">27 – Eure</option><option value="28">28 – Eure-et-Loir</option><option value="29">29 – Finistère</option><option value="30">30 – Gard</option><option value="31">31 – Haute-Garonne</option><option value="32">32 – Gers</option><option value="33">33 – Gironde</option><option value="34">34 – Hérault</option><option value="35">35 – Ille-et-Vilaine</option><option value="36">36 – Indre</option><option value="37">37 – Indre-et-Loire</option><option value="38">38 – Isère</option><option value="39">39 – Jura</option><option value="40">40 – Landes</option><option value="41">41 – Loir-et-Cher</option><option value="42">42 – Loire</option><option value="43">43 – Haute-Loire</option><option value="44">44 – Loire-Atlantique</option><option value="45">45 – Loiret</option><option value="46">46 – Lot</option><option value="47">47 – Lot-et-Garonne</option><option value="48">48 – Lozère</option><option value="49">49 – Maine-et-Loire</option><option value="50">50 – Manche</option><option value="51">51 – Marne</option><option value="52">52 – Haute-Marne</option><option value="53">53 – Mayenne</option><option value="54">54 – Meurthe-et-Moselle</option><option value="55">55 – Meuse</option><option value="56">56 – Morbihan</option><option value="57">57 – Moselle</option><option value="58">58 – Nièvre</option><option value="59">59 – Nord</option><option value="60">60 – Oise</option><option value="61">61 – Orne</option><option value="62">62 – Pas-de-Calais</option><option value="63">63 – Puy-de-Dôme</option><option value="64">64 – Pyrénées-Atl.</option><option value="65">65 – Hautes-Pyrénées</option><option value="66">66 – Pyrénées-Or.</option><option value="67">67 – Bas-Rhin</option><option value="68">68 – Haut-Rhin</option><option value="69">69 – Rhône</option><option value="70">70 – Haute-Saône</option><option value="71">71 – Saône-et-Loire</option><option value="72">72 – Sarthe</option><option value="73">73 – Savoie</option><option value="74">74 – Haute-Savoie</option><option value="75">75 – Paris</option><option value="76">76 – Seine-Maritime</option><option value="77">77 – Seine-et-Marne</option><option value="78">78 – Yvelines</option><option value="79">79 – Deux-Sèvres</option><option value="80">80 – Somme</option><option value="81">81 – Tarn</option><option value="82">82 – Tarn-et-Garonne</option><option value="83">83 – Var</option><option value="84">84 – Vaucluse</option><option value="85">85 – Vendée</option><option value="86">86 – Vienne</option><option value="87">87 – Haute-Vienne</option><option value="88">88 – Vosges</option><option value="89">89 – Yonne</option><option value="90">90 – Terr. de Belfort</option><option value="91">91 – Essonne</option><option value="92">92 – Hauts-de-Seine</option><option value="93">93 – Seine-St-Denis</option><option value="94">94 – Val-de-Marne</option><option value="95">95 – Val-d\'Oise</option><option value="971">971 – Guadeloupe</option><option value="972">972 – Martinique</option><option value="973">973 – Guyane</option><option value="974">974 – La Réunion</option><option value="976">976 – Mayotte</option>';
}

function goTo(id) {
  document.querySelectorAll('.screen').forEach(function(s){
    s.style.display='none'; s.classList.remove('active');
  });
  var el = document.getElementById(id);
  if (el) { el.style.display='block'; el.classList.add('active'); window.scrollTo({top:0,behavior:'smooth'}); }
  if (id === 'screen-multi' && siteCount === 0) { addSite(); }
}

var siteCount = 0;
var MAX_SITES = 5;

function addSite() {
  if (siteCount >= MAX_SITES) return;
  siteCount++;
  var n = siteCount;
  var c = document.getElementById('sites-container');
  var d = document.createElement('div');
  d.style.cssText = 'border:1.5px solid #dde3ee;border-radius:12px;padding:20px;margin-bottom:16px;background:#fff;';

  var caps = [['5-6 kg','m5'],['7-8 kg','m7'],['9-10 kg','m10'],['12-14 kg','m14'],['16-20 kg','m16']];
  var machineRows = caps.map(function(cap) {
    return '<div style="display:grid;grid-template-columns:2fr 1fr 1fr;gap:7px;align-items:center;margin-bottom:5px;">'
      + '<span style="font-size:13px;font-weight:500;color:#1B3A6B;">' + cap[0] + '</span>'
      + '<input type="number" name="s' + n + '_nb_' + cap[1] + '" min="0" max="20" placeholder="0" style="text-align:center;">'
      + '<input type="number" name="s' + n + '_tarif_' + cap[1] + '" min="0" max="35" step="0.1" placeholder="€" style="text-align:center;">'
      + '</div>';
  }).join('');

  var html = [
    '<div style="font-size:14px;font-weight:600;color:#1B3A6B;margin-bottom:16px;display:flex;align-items:center;gap:8px;">',
    '<span style="background:#1B3A6B;color:#fff;border-radius:50%;width:24px;height:24px;display:inline-flex;align-items:center;justify-content:center;font-size:11px;font-weight:700;">' + n + '</span>',
    ' Laverie n\u00b0' + n + '</div>',

    '<div class="grid-2" style="margin-bottom:12px;">',
    '<div class="field"><label>D\u00e9partement</label>',
    '<div class="sel-wrap"><select name="s' + n + '_dept" id="s' + n + '_dept">',
    DEPT_OPT_JS,
    '</select></div></div>',
    '<div class="field"><label>R\u00e9gion <span class="opt">auto</span></label>',
    '<div class="region-display" id="s' + n + '_region">\u2014</div>',
    '<input type="hidden" name="s' + n + '_region" id="s' + n + '_region-val">',
    '</div></div>',

    '<div class="grid-2" style="margin-bottom:12px;">',
    '<div class="field"><label>Zone</label>',
    '<div class="sel-wrap"><select name="s' + n + '_zone">',
    '<option value="">\u2014</option>',
    '<option>Centre dense</option><option>P\u00e9riurbain</option>',
    '<option>Zone commerciale</option><option>R\u00e9sidentiel</option><option>Rural</option>',
    '</select></div></div>',
    '<div class="field"><label>Cycles moy. / machine / jour</label>',
    '<input type="number" name="s' + n + '_cyc" min="0" max="20" step="0.5" placeholder="ex. 4">',
    '</div></div>',

    '<div style="background:#F5F0E8;border-radius:8px;padding:14px 16px;margin-bottom:12px;">',
    '<div style="font-size:12px;font-weight:600;color:#6b5a3e;text-transform:uppercase;letter-spacing:.8px;margin-bottom:10px;">Laveuses \u2014 nb et tarif</div>',
    '<div style="display:grid;grid-template-columns:2fr 1fr 1fr;gap:7px;margin-bottom:4px;">',
    '<span style="font-size:11px;color:#8a7560;">Capacit\u00e9</span>',
    '<span style="font-size:11px;color:#8a7560;text-align:center;">Nb</span>',
    '<span style="font-size:11px;color:#8a7560;text-align:center;">\u20ac/cycle</span>',
    '</div>',
    machineRows,
    '</div>',

    '<div class="grid-2">',
    '<div class="field"><label>Taux d\u2019immobilisation</label>',
    '<div class="sel-wrap"><select name="s' + n + '_immo">',
    '<option value="">\u2014</option>',
    '<option>Moins de 5\u00a0%</option><option>5 \u00e0 10\u00a0%</option>',
    '<option>10 \u00e0 20\u00a0%</option><option>Plus de 20\u00a0%</option>',
    '</select></div></div>',
    '<div class="field"><label>Mode de paiement</label>',
    '<div class="sel-wrap"><select name="s' + n + '_paiement">',
    '<option value="">\u2014</option>',
    '<option>Pi\u00e8ces uniquement</option><option>CB / sans contact</option>',
    '<option>Application mobile</option><option>Mixte</option>',
    '</select></div></div>',
    '</div>'
  ].join('');

  d.innerHTML = html;

  // Attach onchange for dept autofill after inserting
  c.appendChild(d);
  var deptSel = document.getElementById('s' + n + '_dept');
  if (deptSel) {
    deptSel.addEventListener('change', function() {
      autofillRegion('s' + n + '_dept', 's' + n + '_region');
    });
  }

  if (siteCount >= MAX_SITES) {
    var btn = document.getElementById('btn-add-site');
    if (btn) btn.style.display = 'none';
  }
}

function updateProgress() {
  var checks = [
    document.querySelector('#dept-solo') && document.querySelector('#dept-solo').value,
    document.querySelector('#form-solo select[name="zone"]') && document.querySelector('#form-solo select[name="zone"]').value,
    (function(){ var ns=['nb_m5','nb_m7','nb_m10','nb_m14','nb_m16']; return ns.some(function(n){ var e=document.querySelector('#form-solo input[name="'+n+'"]'); return e&&parseInt(e.value)>0; }); })(),
    document.querySelector('#form-solo input[name="cycles_global"]') && document.querySelector('#form-solo input[name="cycles_global"]').value,
    document.querySelector('#form-solo input[name="rep"]:checked'),
    document.querySelector('#form-solo input[name="immo"]:checked'),
    document.querySelector('#form-solo select[name="presence"]') && document.querySelector('#form-solo select[name="presence"]').value,
    document.querySelector('#form-solo input[name="anc_met"]:checked')
  ].filter(Boolean).length;
  document.getElementById('pf-solo').style.width = Math.round(checks/8*100)+'%';
}
document.querySelectorAll('#screen-solo input,#screen-solo select').forEach(function(f){
  f.addEventListener('change',updateProgress);
  f.addEventListener('input',updateProgress);
});

['form-solo','form-multi'].forEach(function(id){
  var form=document.getElementById(id);
  if(form){ form.addEventListener('submit',function(e){
    e.preventDefault();
    document.querySelectorAll('.screen').forEach(function(s){s.style.display='none';s.classList.remove('active');});
    document.getElementById('success').style.display='block';
    window.scrollTo({top:0,behavior:'smooth'});
  });}
});
// Bind choice cards
  var cards = document.querySelectorAll('.choice-card');
  cards.forEach(function(card) {
    var target = card.getAttribute('data-target');
    if (target) {
      card.addEventListener('click', function() { goTo(target); });
    }
  });
  // Bind back buttons
  document.querySelectorAll('[data-back]').forEach(function(btn) {
    btn.addEventListener('click', function() { goTo(btn.getAttribute('data-back')); });
  });
  // Bind add site button
  var addBtn = document.getElementById('btn-add-site');
  if (addBtn) addBtn.addEventListener('click', addSite);

// Init on DOM ready
  document.querySelectorAll('.screen').forEach(function(s){s.style.display='none';s.classList.remove('active');});
  var gate=document.getElementById('screen-gate');
  if(gate){gate.style.display='block';gate.classList.add('active');}

});