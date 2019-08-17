import { Visual } from "../../src/visual";
var powerbiKey = "powerbi";
var powerbi = window[powerbiKey];

var spectrumplotPBviz7DEA5CA2058841A9BE801C6417758871 = {
    name: 'spectrumplotPBviz7DEA5CA2058841A9BE801C6417758871',
    displayName: 'spectrumplotPBviz',
    class: 'Visual',
    version: '1.0.0',
    apiVersion: '2.6.0',
    create: (options) => {
        if (Visual) {
            return new Visual(options);
        }

        console.error('Visual instance not found');
    },
    custom: true
};

if (typeof powerbi !== "undefined") {
    powerbi.visuals = powerbi.visuals || {};
    powerbi.visuals.plugins = powerbi.visuals.plugins || {};
    powerbi.visuals.plugins["spectrumplotPBviz7DEA5CA2058841A9BE801C6417758871"] = spectrumplotPBviz7DEA5CA2058841A9BE801C6417758871;
}

export default spectrumplotPBviz7DEA5CA2058841A9BE801C6417758871;