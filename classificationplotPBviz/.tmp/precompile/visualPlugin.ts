import { Visual } from "../../src/visual";
var powerbiKey = "powerbi";
var powerbi = window[powerbiKey];

var classificationplotPBvizF2F9C2E80BE64DC887CF4448E82241C6 = {
    name: 'classificationplotPBvizF2F9C2E80BE64DC887CF4448E82241C6',
    displayName: 'classificationplotPBviz',
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
    powerbi.visuals.plugins["classificationplotPBvizF2F9C2E80BE64DC887CF4448E82241C6"] = classificationplotPBvizF2F9C2E80BE64DC887CF4448E82241C6;
}

export default classificationplotPBvizF2F9C2E80BE64DC887CF4448E82241C6;