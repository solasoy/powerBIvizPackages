import { Visual } from "../../src/visual";
var powerbiKey = "powerbi";
var powerbi = window[powerbiKey];

var plot3D3100C93429A94D70A01A50AA8406BE88 = {
    name: 'plot3D3100C93429A94D70A01A50AA8406BE88',
    displayName: 'plot3D',
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
    powerbi.visuals.plugins["plot3D3100C93429A94D70A01A50AA8406BE88"] = plot3D3100C93429A94D70A01A50AA8406BE88;
}

export default plot3D3100C93429A94D70A01A50AA8406BE88;