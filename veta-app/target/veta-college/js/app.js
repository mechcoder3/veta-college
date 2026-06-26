/* kigomarvtsc — Frontend JavaScript for JSP pages */
'use strict';

// ── MODALS ────────────────────────────────────────────────────
function openModal(id) {
    const el = document.getElementById(id);
    if (el) { el.classList.add('open'); document.body.style.overflow = 'hidden'; }
}
function closeModal(id) {
    const el = document.getElementById(id);
    if (el) { el.classList.remove('open'); document.body.style.overflow = ''; }
}
document.addEventListener('keydown', e => {
    if (e.key === 'Escape') document.querySelectorAll('.modal-overlay.open').forEach(m => closeModal(m.id));
});

// ── PAYMENT TABS ─────────────────────────────────────────────
function showPayTab(tab, btn) {
    document.querySelectorAll('[id^="payTab-"]').forEach(el => el.classList.add('hidden'));
    document.querySelectorAll('.ptab').forEach(b => b.classList.remove('active'));
    const el = document.getElementById('payTab-' + tab);
    if (el) el.classList.remove('hidden');
    if (btn) btn.classList.add('active');
}

// ── PORTAL TABS ───────────────────────────────────────────────
function showPortalTab(tab, btn) {
    document.querySelectorAll('.ptbc').forEach(el => el.classList.remove('active'));
    document.querySelectorAll('.ptb').forEach(b => b.classList.remove('active'));
    const el = document.getElementById('ptab-' + tab);
    if (el) el.classList.add('active');
    if (btn) btn.classList.add('active');
}

// ── COPY TEXT ────────────────────────────────────────────────
function copyText(text) {
    if (navigator.clipboard) {
        navigator.clipboard.writeText(text).then(function() {
            showToast('Copied to clipboard!', 'success');
        }).catch(function(err) {
            console.error('Error:', err);
        });
    }
} 
// ── TOAST ────────────────────────────────────────────────────
function showToast(msg, type, ms) {
    
    if (type === undefined) type = 'info';
    if (ms === undefined) ms = 3000;

    var icons = { info: 'ℹ️', success: '✅', error: '❌', warning: '⚠️' };
    var c = document.getElementById('toastContainer');
    
    if (!c) {
        c = document.createElement('div');
        c.id = 'toastContainer';
        c.style.position = 'fixed';
        c.style.bottom = '18px';
        c.style.left = '50%';
        c.style.transform = 'translateX(-50%)';
        c.style.zIndex = '9999';
        c.style.display = 'flex';
        c.style.flexDirection = 'column';
        c.style.gap = '6px';
        c.style.alignItems = 'center';
        document.body.appendChild(c);
    }

    var t = document.createElement('div');
    
    // Line 10 Fix
    var bgColor = '#0A2463';
    if (type === 'success') bgColor = '#1B5E20';
    else if (type === 'error') bgColor = '#B71C1C';
    else if (type === 'warning') bgColor = '#C2410C';

    //  'rounded-corners' (999px)
    t.style.backgroundColor = bgColor;
    t.style.color = '#fff';
    t.style.padding = '10px 20px';
    t.style.borderRadius = '999px';
    t.style.fontSize = '.83rem';
    t.style.fontWeight = '600';
    t.style.boxShadow = '0 4px 20px rgba(0,0,0,.2)';
    t.style.whiteSpace = 'nowrap';
    t.style.display = 'flex';
    t.style.alignItems = 'center';
    t.style.gap = '8px';
    t.style.transition = 'all 0.3s ease';

    var iconHtml = (icons[type] || '');
    t.innerHTML = '<span>' + iconHtml + '</span><span>' + msg + '</span>';
    
    c.appendChild(t);

    // Timeout Fix: 
    setTimeout(function() {
        t.style.opacity = '0';
        t.style.transform = 'translateY(16px)';
        setTimeout(function() {
            if (t.parentNode) {
                t.parentNode.removeChild(t);
            }
        }, 300);
    }, ms);
}

// ── ANNOUNCEMENT BAR ROTATION (BILINGUAL SUPPORT) ───────────────────────────
document.addEventListener('DOMContentLoaded', () => {
    // 1. Dictionary 
    const translations = {
        en: [
            'JULY 2026 Intake Now Open — Apply Online Today! Deadline: 30 AUGUST 2026',
            'Pay Fees via M-Pesa, Tigo Pesa, Airtel Money or Bank using Government Control Number',
            'New Short Course: Solar Panel Installation — Starting July 2026',
            'Admissions Hotline: +255282804951 | Mon–Fri 7:30AM–4PM',
        ],
        sw: [
            'Nafasi za Masomo Julai 2026 Zipo Wazi — Omba Mtandaoni Leo! Mwisho: 30 Agosti 2026',
            'Lipa Ada kupitia M-Pesa, Tigo Pesa, Airtel Money au Benki ukitumia Namba ya Kumbukumbu ya Serikali (Control Number)',
            'Kozi Mpya: Ufungaji wa Mifumo ya Umeme wa Jua — Inaanza Julai 2026',
            'Huduma kwa Wateja (Admissions): +255282804951 | Jtatu–Ijumaa Saa 7:30 Asubuhi–10:00 Jioni',
        ]
    };
    const currentLang = document.documentElement.lang || 'en';
   
    const msgs = translations[currentLang] || translations['en'];

    let idx = 0;
    const el = document.getElementById('announceTxt');
    
    if (el) {
        el.textContent = msgs[0];
        
        setInterval(() => { 
            idx++;
            el.textContent = msgs[idx % msgs.length]; 
        }, 7000);
    }

    // ── AUTO-DISMISS ALERTS ──────────────────────────────────────────────────
    document.querySelectorAll('.alert-error').forEach(a => {
        setTimeout(() => { 
            a.style.transition = 'opacity 0.4s ease';
            a.style.opacity = '0'; 
            setTimeout(() => a.remove(), 400); 
        }, 6000);
    });
	document.addEventListener('contextmenu', function(e) {
		    e.preventDefault();
		});

		
		document.addEventListener('keydown', function(e) {
		    // Zuia F12
		    if (e.key === "F12") {
		        e.preventDefault();
		    }
		    // Zuia Ctrl + Shift + I (Inspect)
		    if (e.ctrlKey && e.shiftKey && e.key === "I") {
		        e.preventDefault();
		    }
		    // Zuia Ctrl + Shift + J (Console)
		    if (e.ctrlKey && e.shiftKey && e.key === "J") {
		        e.preventDefault();
		    }
		    // Zuia Ctrl + U (View Source)
		    if (e.ctrlKey && e.key === "u") {
		        e.preventDefault();
		    }
		});
	
});