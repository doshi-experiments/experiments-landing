import './site.css';
import '../node_modules/@doshi-experiments/design-system/dist/metadata.js';
import {mountSiteHeader} from '@doshi-experiments/design-system/site';

mountSiteHeader(document.getElementById('site-header'), {project: 'experiments', showProjectTitle: false});
// Preserve previously shared category URLs while making projects directly accessible.
const anchors = {'#E-01': 'calculators', '#E-03': 'visualizations', '#E-04': 'mr-shake'};
const destination = document.getElementById(anchors[location.hash]);
if (destination) destination.scrollIntoView({block: 'center'});
