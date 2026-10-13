const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');

function element() {
  return { value: '', disabled: false, textContent: '', className: '',
    append() {}, replaceChildren() {}, addEventListener() {} };
}
const elements = new Map();
const requests = [];
const context = vm.createContext({
  Intl, AbortController, Date,
  document: {
    getElementById(id) {
      if (!elements.has(id)) elements.set(id, element());
      return elements.get(id);
    },
    createElement: element,
  },
  fetch: () => new Promise(resolve => requests.push(resolve)),
});
vm.runInContext(fs.readFileSync(require('node:path').join(__dirname, '../app.js'), 'utf8'), context);
const response = count => ({ ok: true, json: async () => ({
  apps: [], days: '30', generated_at: '2026-10-13T12:00:00Z', timezone: '+00:00', marker: count,
}) });

(async () => {
  const latest = vm.runInContext('refresh()', context);
  requests[0](response(1));
  await new Promise(resolve => setImmediate(resolve));
  assert.equal(elements.get('refresh').disabled, true, 'Old request must not enable the button');
  assert.equal(vm.runInContext('data', context), null, 'Old request must not update data');
  requests[1](response(2));
  await latest;
  assert.equal(vm.runInContext('data.marker', context), 2);
  assert.equal(elements.get('refresh').disabled, false);

  const old = vm.runInContext('refresh()', context);
  const current = vm.runInContext('refresh()', context);
  requests[3](response(4));
  await current;
  requests[2](response(3));
  await old;
  assert.equal(vm.runInContext('data.marker', context), 4, 'Late response must not overwrite newer data');
  console.log('Refresh race regression checks passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
