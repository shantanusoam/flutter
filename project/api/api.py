import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# Create some test data for our catalog in the form of a list of dictionaries.
Podcasts = [
    {'id': 0,
     'image': 'https://miro.medium.com/max/1000/1*c4KOwhSRiE53ril7PQg2ow.png',
     'intro': 'We are a few guys who’ve been professional programmers for years. As avid listeners of podcasts and consumers of many things code-related, we were frustrated by the lack of quality programming (pun) available in listenable formats. Given our years of experience and real-world problem-solving skills, we thought it might be worth getting into this world of podcasting and “giving back” a shot.',
     'name': 'Coding Blocks',
     'url': 'https://www.codingblocks.net/'
     },
    {'id': 1,
     'image': 'https://spec.fm/static/img/shows/developertea.jpg',
     'intro' : "In January 2015, two independent podcasts — Design Details and Developer Tea — were started by three individuals who wanted to talk about the work they do every day. After an amazing response from the web community, we’ve teamed up to create the Spec Network to help designers and developers to learn, find great resources and connect with one another.",
     'name': 'Developer Tea',
     'url': 'https://spec.fm/podcasts/developer-tea'
     },
    {'id': 2,
     'image': 'https://fullstackradio.com/podcast-cover.jpg',
     'intro': 'A podcast for developers interested in building great software products. Every episode, Adam Wathan is joined by a guest to talk about everything from product design and user experience to unit testing and system administration.',
     'name': 'Full Stack Radio',
     'url': 'https://fullstackradio.com/'
     },
    {
        'id': 4,
        'image':    'https://assets.libsyn.com/secure/item/12121229',
        'intro':'The official podcast of the freeCodeCamp open source community. Learn to code with free online courses, programming projects, and interview preparation for developer jobs.',
        'name': 'freeCodeCamp podcast',
        'url': "https://freecodecamp.libsyn.com/",
    },
    {
        'id': 5,
        'image':    'https://media.simplecast.com/episode/image/324092/thumb_1602263739-artwork.jpg',
        'intro':    'The Laracasts Snippet, each episode, offers a single thought on some aspect of web development. Nothing more, nothing less. Hosted by Jeffrey Way.',
        'name': 'the laracasts snippet',
        'url': 'https://laracasts.simplecast.fm/',
    },
]
Must_programmer = [
    {
        'id': 0,
        'image': 'https://github.blog/wp-content/uploads/2014/10/4b0317bc-4599-11e4-8bc3-0ca4dd5223e8.png?resize=2284%2C889',
        'intro':'There’s no substitute for hands-on experience, but for most students, real world tools can be cost prohibitive. That’s why github created the GitHub Student Developer Pack with some of there partners and friends: to give students free access to the best developer tools in one place so they can learn by doing',
        'name': 'GitHub Student Developer Pack',
        'url': 'https://education.github.com/'
    },
    {
        'id': 0,
        'image': 'https://149351115.v2.pressablecdn.com/wp-content/uploads/2017/02/college-degrees-1024x395.jpg',
        'intro':'Do developers need college degrees? Just a generation ago, it was a given that a college degree was the best way to maximize the likelihood of securing a high-paying job in the field of your choice. But the world has changed, and more and more you hear of successful developers who never earned a degree,',
        'name': 'Do Developers Need College Degrees?',
        'url': 'https://stackoverflow.blog/2016/10/07/do-developers-need-college-degrees/?fbclid=IwAR1H9tBaYd1zGUIam6nVQovHcJETHwoo11VHBlV8peR0JO8PJNgAHMsQqvw'
    },
    {
                'id':0,
        'image': 'https://online-learning.harvard.edu/sites/default/files/styles/social_share/public/course/cs50x-original.jpg?itok=kR_JV8DW',
        'intro': 'An entry-level course taught by David J. Malan, CS50x teaches students how to think algorithmically and solve problems efficiently.',
        'name': 'cs50',
        'Return': 'free certificate',
        'url':  'https://www.edx.org/course/cs50s-introduction-to-computer-science'
    }
]
game_development = [
    {

    },
    {
        'id': 0,
        'image': 'https://hackernoon.com/drafts/1k3j3zqp.png',
        'intro': '10 Reasons Why You Should Learn How To Develop Video Games',
        'url': 'https://hackernoon.com/10-reasons-why-you-should-keep-learning-game-development-hf3l3zmn'
    },
    {
        'id': 1,
        'image': 'https://blogs.unity3d.com/wp-content/uploads/2019/04/Unity-Learn-blog-header_1280x720.jpg',
        'intro': 'Unity Learn provides award-winning free tutorials, sample projects, and full courses for mastering real-time 3D development skills with Unity Learn',
        'name': 'Unity learn',
        'url':  'https://learn.unity.com/'
    },
    {
        'id':2,
        'image': 'https://cdn2.unrealengine.com/Unreal+Engine%2Fonlinelearning-courses%2FNews_UOLDec_fb_image-1200x630-520419d3e9c82ff29459b6844fb50ed0262e715c.jpg',
        'intro': 'Unreal Online Learning is a free learning platform that offers hands-on video courses and guided learning paths.',
        'name': 'unreal engine',
        'url':  'https://www.unrealengine.com/en-US/onlinelearning-courses'
    },
]
programming = [
    
    {   
        'type': "learn computer science in 6 months free",
        'stage': "biggners",
        "biggners": [
            {
                'id':0,
        'image': 'https://prod-discovery.edx-cdn.org/media/course/image/9e0d9bd0-8557-49bc-a949-4fc7ff7727ac-c1670bfffbc8.small.jpg',
        'intro': 'This is CS50’s introduction to technology for students who don’t (yet!) consider themselves computer persons. ',
        'name': "CS50's Understanding Technology",
        'Return': 'free certificate',
        'type': 'course + Assigments',
        'url':  'https://www.edx.org/course/cs50s-understanding-technology'
            },
            {
                'id':0,
        'image': 'https://online-learning.harvard.edu/sites/default/files/styles/social_share/public/course/cs50x-original.jpg?itok=kR_JV8DW',
        'intro': 'An entry-level course taught by David J. Malan, CS50x teaches students how to think algorithmically and solve problems efficiently.',
        'name': 'cs50',
        'Return': 'free certificate',
        'type': 'course + Assigments',
        'url':  'https://www.edx.org/course/cs50s-introduction-to-computer-science'
            }
            ,
            {
                'id':0,
        'image': 'https://automatetheboringstuff.com/images/cover_beyond_thumb.png',
        'intro': "In Automate the Boring Stuff with Python, you'll learn how to use Python to write programs that do in minutes what would take you hours to do by hand-no prior programming experience required",
        'name': 'cs50',
        'Return': 'free certificate',
        'type': 'book',
        'url':  'https://automatetheboringstuff.com/'
            }
        ]
    },
    {
        "type": "learning resources",
        "courses": 
        [
            {
                'id': 2,
'image': 'https://www.codecademy.com/webpack/e908164f059c81faded2866ab983e950.png',
'intro': 'Bring your apps and games to life with real-time animation. Rive is a powerful design and animation tool, which allows designers and developers to easily',
'name': 'rive 2',
'url':'https://www.2dimensions.com/',
'extra': 'animation',
'price': 'free'
            }
        ]
    }
]
web_programmer = [

]
web_designer = [

]
android_development = [

]
user_interface = [
    {
'id': 1,
'image':'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5c5957de3e262c46a81b4611_Artboard%2BCopy-p-1600.png',
'intro': 'Slick mockup movies and images for promo videos, presentations, portfolios, app store images.Showcasing like the big boys is no longer just for the big boys.',
'name': 'Rotato',
'url':'https://www.rotato.xyz/',
'extra': 'mockups',
'price': 'half free'
    },
    {
'id': 2,
'image': 'https://miro.medium.com/max/1600/1*oxxU6j6GXYODNT2is-KU6Q.gif',
'intro': 'Bring your apps and games to life with real-time animation. Rive is a powerful design and animation tool, which allows designers and developers to easily',
'name': 'rive 2',
'url':'https://www.2dimensions.com/',
'extra': 'animation',
'price': 'free'
    },
    {
        'id': 3,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5bf6e0c690b6c76a53804bdc_answers_calculator.png',
'intro': 'Understand how users are really experiencing your site without drowning in numbers Traditional web analytics tools help you analyze traffic data. But numbers alone can’t tell you what users really do on your site — Hotjar will.',
'name': 'hotjar',
'url':'https://www.hotjar.com/?utm_expid=.EinRyQaiRjGYjFEJFTUl4Q.0&utm_referrer=',
'extra': 'analytics',
'price': 'paid'
    },
    {
        'id': 4,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5be9b020d015a1f9ec9a5442_banner-2.png',
'intro': 'Are you working with design files? Start saving time today.In all plans you can present, comment, create screen flows, and inspect Sketch, Adobe XD, Photoshop, Illustrator, & Figma files - using our web, macOS, Windows, & Linux app',
'name': 'Avocode',
'url':'https://avocode.com/hand-off-and-inspect',
'extra': 'UI/UX designing',
'price': 'paid'
    },
    {
        'id': 5,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5bc453b95a68ee5fe21bc6b4_Screen%20Shot%202018-10-15%20at%2010.45.18%20AM.png',
'intro': 'Are you working with design files? Start saving time today.In all plans you can present, comment, create screen flows, and inspect Sketch, Adobe XD, Photoshop, Illustrator, & Figma files - using our web, macOS, Windows, & Linux app',
'name': 'micro',
'url':'https://realtimeboard.com/',
'extra': 'team collaboration for brainstroming + video call',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5ba39a9e805bfa74a4b08ddf_1_F19-hrmAQppP33zh1G2jgQ-p-1600.png',
'intro': 'To empower the work of design teams by facilitating a creative synergy through effortless collaboration.',
'name': 'plant',
'url':'https://plantapp.io/#about',
'extra': 'team collaboration for brainstroming + video call',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5b866b1515ad26e6cea79353_2017-character_personas.jpg',
'intro': 'Generate professional, customizable buyer persona documents with the help of this quick and intuitive generator.',
'name': 'Make my persona',
'url': 'https://www.hubspot.com/make-my-persona',
'extra': 'personal portfolio',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5b769ac79183f17ee9fe0942_by%20Norde.png',
'intro': 'Vaadin comes with a big set of web components that are fine-tuned for UX, performance, and accessibility.',
'name': 'vaadin',
'url':'https://vaadin.com/',
'extra': 'web apps => java',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5b583ac6fc79dd91ac4f68af_30134265966479.5b075bbf1b0a7.jpg',
'intro': 'Discover how real users interact with your prototype: define missions, collect actionable insights and analyze how your design performed, with 0 lines of code.',
'name': 'maze',
'url':'https://maze.design/',
'extra': 'ui/ux testing + analytics for prototypes',
'price': 'free 1 month trial'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5b3c86048d4e3381013434c0_color-tool-v2-4x3.gif',
'intro': 'The Material Theme Editor helps you make your own branded symbol library and apply global style changes to color, shape, and typography.',
'name': 'gallery',
'url':'https://gallery.io/apps',
'extra': 'matrial theme editor',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5afb0c4a5d83d9375a8d19d0_social_tout.png',
'intro': "By choosing a set of 50 colors, you'll train a neural network powered algorithm to generate colors you like and block ones you don’t, right in your browser.",
'name': 'khroma',
'url':'http://khroma.co/',
'extra': 'Design with colors you love. Khroma uses AI to learn which colors you like and creates limitless palettes for you to discover, search, and save.',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5ac3825ee45951aaec5936b0_homepage-bg-669c8ea95a9ede671933dffb254f493a23de2d7a039f90bfbbac9ecd09f78225.svg',
'intro': 'Share your ideas visually. Lightning fast.',
'name': 'gallery',
'url':'https://whimsical.co/',
'extra': 'brainstrming workspace',
'price': 'create 4 free boards '
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5a5dc7eb3e2b760001e215f4_Illustration%20by%20Iza%20Dudzik.jpg',
'intro': 'Piece hi-fi interactions together, build sensor-aided prototypes and share your amazing creations in a matter of minutes.',
'name': 'protopie',
'url':'https://www.protopie.io/',
'extra': 'prototyping tool',
'price': 'free for students'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5a312b470672a700015a499c_brics.gif',
'intro': 'Blocs Website Builder Fast, easy to use and powerful visual web design software, that lets you create responsive websites without writing code.',
'name': 'blocs',
'url':'https://blocsapp.com/',
'extra': 'websitebuilder',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e9cb80a71c7d00019122e2_lottie.png',
'intro': 'Lottie is an iOS, Android, and React Native library that renders After Effects animations in real time, allowing apps to use animations as easily as they use static images.',
'name': 'lottie',
'url':'https://lottiefiles.com/getting-started#',
'extra': 'animation maker',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e9c715775aae00019a177c_monotype-library-subscription_lead-image-p-1600.jpeg',
'intro': 'With more than 2,200 font families all in one location, you can easily find the perfect typeface for your project. Whether it’s for your own, a client’s or your company’s design, having complete access to a broad selection of high-quality, premium type is a must.',
'name': 'monotype library',
'url':'https://blocsapp.com/',
'extra': 'fonts',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e8a73a90983b000144f01e_webflow.png',
'intro': 'The modern way to build for the web Webflow empowers designers to build professional, custom websites in a completely visual canvas. View dashboard',

'name': 'webflows',
'url':'https://webflow.com/',
'extra': 'websitebuilder',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e215007032510001bb636f_home-screenshot.png',
'intro': "Online app that enables designers to customize their own typeface in a few clicks.",
'name': 'prototypo',
'url':'https://www.prototypo.io/',
'extra': 'fonts',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e218ae3f6bfa0001113de7_invision-logo.jpg',
'intro': "The world's leading prototyping, collaboration & workflow platform",
'name': 'invision',
'url':'https://www.invisionapp.com/',
'extra': 'prototyping + devlopment fro m design',
'price': 'free'
    },
    {
        'id': 6,
'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Adobe_XD_CC_icon.svg/1200px-Adobe_XD_CC_icon.svg.png',
'intro': "Share your story with designs that look and feel like the real thing. Wireframe, animate, prototype, collaborate and more — it’s all right here, all in one place.",
'name': 'Adobe xd',
'url':'https://www.adobe.com/in/products/xd.html',
'extra': 'ui/ux designing',
'price': 'free'
    },
    {
        "learning": [
            {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5be9af00cbd406ee1caaff15_expert-advice-unfurl.png',
'intro': "Build your design system like the pros",
'name': 'ui/ux',
'url':'https://www.invisionapp.com/design-system-manager/expert-advice',
'extra': 'ui/ux designing',
'price': 'free',
'type': 'learning+video'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5b311fa7cbd2eb17d660c209_ui-guide-Designing-search-for%20mobile-apps-p-1600.jpeg',
'intro': "Explore the various ways to implement search and the purpose behind each",
'name': 'ui/ux',
'url':'https://medium.muz.li/designing-search-for-mobile-apps-ab2593e9e413',
'extra': 'ui/ux designing',
'price': 'free',
'type': 'learning+text'
    }
    ,
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5ac380fbf1502e199b611d42_squarepegroundhole_final4.png',
'intro': "I have always believed that Psychology and Design comprise User Experience.",
'name': 'ui/ux',
'url':'https://uxdesign.cc/psychology-design-4-gestalt-principles-to-use-as-your-next-design-solution-fcdec423a6bf',
'extra': 'ui/ux designing',
'price': 'free',
'type': 'learning+text'
    }
    ,
    {
        'id': 6,
'image': 'https://miro.medium.com/max/700/1*3M9hkYLvrJ5xTR2_ZM0FAg.gif',
'intro': "7 Basic Rules for Button Design",
'name': 'ui',
'url':'https://uxplanet.org/7-basic-rules-for-button-design-63dcdf5676b4',
'extra': 'ui/ux designing',
'price': 'free',
'type': 'learning+text'
    }
    ,
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5a68617439ab7c00014d1d3a_170623_dropbox-ecosystem_v01.jpg',
'intro': "Laws of UX is a collection of the maxims and princples that designers can consider when building user interfaces.",
'name': 'ui',
'url':'https://lawsofux.com/',
'extra': 'ui/ux designing',
'price': 'free',
'type': 'learning+text'
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e9c297e87a4d000109e13d_1-t2L7WZC7hpZFexm47qzQSA-p-1600.jpeg',
        'into': 'Collection of articles, videos, and resources made by designers at Facebook.',
        'name': 'facebook design',
        'url': 'http://facebook.design/',
        'extra': 'Human illustrations',
        'price': 'free',
        'type': "learning",
    },
        ],
        "resource" : [
            
              {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5c59570b4abddd53b41de8a2_marginalia-productive-work.png',
'intro': "1000+ Pixel-perfect vector icons and Iconfont for your next project.",
'name': 'icons',
'url':'http://s.muz.li/ZTg1MWRhOTJk',
'extra': 'ui/ux designing',
'price': 'free',
'type': 'Resources'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5c33558eedb5fd1b94b42c45_pablo-delete-confirmation.png',
'intro': "Email copy from great companies. Brought to you by Front.",
'name': 'email copy',
'url':'https://www.goodemailcopy.com/',
'extra': 'all mail in one place',
'price': 'free',
'type': 'Resources'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5be9af7bd91668e74ade48ab_form-feature-copy-min-810x810.jpg',
'intro': "Meet Form, an intuitive wireframe kit that will help you hit the ground running with your next design project.",
'name': 'form',
'url':'https://www.invisionapp.com/inside-design/design-resources/free-wireframe-kit-form/',
'extra': 'form',
'price': 'free',
'type': 'Resources'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5b9f720f08470e3f35fac2cd_undraw_upload_87y9%20(1).svg',
'intro': "Browse to find the images that fit your needs and click to download. Take advantage of the on-the-fly color image generation to match your brand identity.",
'name': 'UnDraw',
'url':'https://undraw.co/illustrations',
'extra': 'Illustartions',
'price': 'free',
'type': 'Resources'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5ba399a0d65e6ec06564fe74_undraw_High_five_u364.svg',
'intro': "Are you looking for blend mode background images & beautiful background gradients for your User Interface?",
'name': 'Gradient guru',
'url':'http://gradientsguru.com/',
'extra': 'Gradients',
'price': 'free',
'type': 'Resources'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5ace6ff8507eccc0c1b1d2d6_solareclipse.gif',
'intro': "A total set of 14 color palettes and 280 colors for your designs, projects, presentations and other needs.",
'name': 'flat ui color',
'url':'https://flatuicolors.com/',
'extra': 'colors pallets',
'price': 'free',
'type': 'Resources'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5a13ef322d9bd30001824403_wallpaper_concert-2.png',
'intro': "Upload your design, adjust settings and download your individual mockup. Threed is for free and needs no extra Software",
'name': 'Threed',
'url':'http://threed.io/',
'extra': 'Generate 3d mockups in browser',
'price': 'free',
'type': 'Resources'
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5c05205a90375ebb9d52fad7_Image-p-1600.jpeg',
        'into': 'Mix-&-match illustrations of people with a design library',
        'name': 'Hummans',
        'url': 'https://www.humaaans.com/?ref=producthunt',
        'extra': 'Human illustrations',
        'price': 'free',
        'type': "Resource",
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5bf6e3d14ae3421f52814444_download.jpg',
        'into': 'Mobbin is a hand-picked collection of the latest mobile design patterns from apps that reflect the best in design. Get inspiration from over 150 iOS apps and 8,000 patterns (screenshots from iPhone X) available on the platform. Sign up to save your favorite patterns.',
        'name': 'mobbin',
        'url': 'https://mobbin.design/',
        'extra': 'ios design pattrens',
        'price': 'free',
        'type': "Resource",
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59fc7d4b605d4b0001f003e9_marriot_copy.jpg',
        'into': 'Take responsive screenshots with the click of button',
        'name': 'Responsive screenshorts',
        'url': 'https://responsive-screenshots.com/',
        'extra': 'Human illustrations',
        'price': 'free',
        'type': "Resource",
    },
    
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5c05205a90375ebb9d52fad7_Image-p-1600.jpeg',
        'into': 'Mix-&-match illustrations of people with a design library',
        'name': 'Hummans',
        'url': 'https://www.humaaans.com/?ref=producthunt',
        'extra': 'Human illustrations',
        'price': 'free',
        'type': "Resource",
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e9bea6e87a4d000109dbd1_jakub-dziubak-394720-(1).jpg',
        'into': 'Beautiful high quality free images and photos you can download and use for any project. No attribution required.',
        'name': 'unsplash',
        'url': 'https://unsplash.com/',
        'extra': 'Photos',
        'price': 'free',
        'type': "Resource",
    },
    
    {
        'id': 0,
        'image': 'https://www.logo-designer.co/wp-content/uploads/2013/09/iStock-logo-design-identity-getty-images-Build.jpg',
        'into': 'free photos',
        'name': 'istock',
        'url': 'https://www.istockphoto.com/collaboration/boards/L9m43WDlbUO8O94wqUFIIA',
        'extra': 'Human illustrations',
        'price': 'free',
        'type': "Resource",
    },
    {
        'id': 0,
        'image': 'https://cdn.joypixels.com/sections/coverphotos/6.0%20Release%20FINAL%20FINAL-02-min.png',
        'into': 'New for 2020! JoyPixels 6.0 includes 3,342 originally crafted icon designs and is 100% Unicode 13 compatible. We offer the largest selection of files ranging from png, svg, iconjar, sprites, and fonts.',
        'name': 'PIXELS',
        'url': 'https://www.joypixels.com/',
        'extra': 'Emoji',
        'price': 'free',
        'type': "Resource",
    },
    

            
        
        ],
        "inspiration" : [
            {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5bf6e3d14ae3421f52814444_download.jpg',
        'into': 'Mobbin is a hand-picked collection of the latest mobile design patterns from apps that reflect the best in design. Get inspiration from over 150 iOS apps and 8,000 patterns (screenshots from iPhone X) available on the platform. Sign up to save your favorite patterns.',
        'name': 'mobbin',
        'url': 'https://mobbin.design/',
        'extra': 'ios design pattrens',
        'price': 'free',
        'type': "ios + inspiration",
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e9c90cc3e5160001ed80f0_fb.png',
        'into': 'The best design inspiration - expertly curated for you. Muzli is a new-tab Chrome extension that instantly delivers relevant design stories and inspiration. Learn more',
        'name': 'Muzil',
        'url': 'https://muz.li/',
        'extra': 'inspiration',
        'price': 'free',
        'type': "Resource",
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e9c297e87a4d000109e13d_1-t2L7WZC7hpZFexm47qzQSA-p-1600.jpeg',
        'into': 'Collection of articles, videos, and resources made by designers at Facebook.',
        'name': 'facebook design',
        'url': 'http://facebook.design/',
        'extra': 'Human illustrations',
        'price': 'free',
        'type': "inspiration",
    },
    {
        'id': 0,
        'image': 'https://s3.amazonaws.com/www-inside-design/uploads/2015/06/Dribbble-InVision-feature.jpg',
        'into': 'Dribbble is where designers gain inspiration, feedback, community, and jobs and is your best resource to discover and connect with designers worldwide.',
        'name': 'Dribble',
        'url': 'https://dribbble.com/',
        'extra': 'Ui/Ux',
        'price': 'free',
        'type': "inspiration",
    },
    {
        'id': 0,
        'image': 'https://i.pinimg.com/280x280_RS/e9/f7/e1/e9f7e101e3b7484d53b2b4d5a6004740.jpg',
        'into': 'Behance is a social media platform owned by Adobe which claims "to showcase and discover creative work"',
        'name': 'Behance',
        'url': 'https://www.behance.net/',
        'extra': 'Ui / ux / animation / design 2d / 3d',
        'price': 'free',
        'type': "inspiration",
    },
    {
        'id': 0,
        'image': 'https://cdn-images-1.medium.com/max/1200/1*A0FnBy5FBoVQC02SZXLXPg.png',
        'into': 'One-stop resource for everything related to user experience"',
        'name': 'uxplanet',
        'url': 'https://uxplanet.org/',
        'extra': 'ux / animation / design 2d / 3d',
        'price': 'free',
        'type': "inspiration",
    }
        ]
    }

    




]
animation_images = [
    {
        'id': 0,
        'image': 'https://static.lottiefiles.com/images/og_img.jpg',
        'into': 'Lottie animations and the tools you need to test and perfect them. Simply edit and ship your animations in just a few clicks.',
        'name': 'lottie',
        'type': "aniamtion",
        'url': 'https://lottiefiles.com/featured'
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5c05205a90375ebb9d52fad7_Image-p-1600.jpeg',
        'into': 'Mix-&-match illustrations of people with a design library',
        'name': 'Hummans',
        'type': "Human illustrations",
        'url': 'https://www.humaaans.com/?ref=producthunt'
    },
    
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5b9f720f08470e3f35fac2cd_undraw_upload_87y9%20(1).svg',
'intro': "Browse to find the images that fit your needs and click to download. Take advantage of the on-the-fly color image generation to match your brand identity.",
'name': 'UnDraw',
'url':'https://undraw.co/illustrations',
'price': 'free',
'type': 'Illustartions'
    },
    {
        'id': 0,
        'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/59e9bea6e87a4d000109dbd1_jakub-dziubak-394720-(1).jpg',
        'into': 'Beautiful high quality free images and photos you can download and use for any project. No attribution required.',
        'name': 'unsplash',
        'url': 'https://unsplash.com/',
        'price': 'free',
        'type': "photos",
    },
    {
        'id': 0,
        'image': 'https://www.logo-designer.co/wp-content/uploads/2013/09/iStock-logo-design-identity-getty-images-Build.jpg',
        'into': 'free photos',
        'name': 'istock',
        'url': 'https://www.istockphoto.com/collaboration/boards/L9m43WDlbUO8O94wqUFIIA',
        'extra': 'Human illustrations',
        'price': 'price',
        'type': "Photos",
    },
    {
        'id': 0,
        'image': 'https://illlustrations.co/notebook.png',
        'into': 'Designed 100 awesome illustrations during 100 days of illustration challenge (Now added more than 120+ illustrations). You can download all illustrations completely free and use these to design awesome - landing pages, mobile app or presentations.',
        'name': 'illustration.co',
        'url': 'https://illlustrations.co/',
        'extra': 'Human illustrations',
        'price': 'free',
        'type': "Photos",
    },

] 
font = [
    {
'id': 0,
'image':'https://miro.medium.com/max/3620/1*zC9oF9BOxoV6acjfho1lPg.png',
'intro': 'A fancy cool ✅ font generator that helps create stylish text font styles with beautiful symbols and fancy characters for social networks & any other places.',
'name': 'cool fancy symbol',
'url':'https://coolsymbol.com/cool-fancy-text-generator.html',

    },
    {
'id': 1,
'image': 'https://www.dafont.com/img/charmap/m/o/moonbright0.png',
'intro':'Archive of freely downloadable fonts. Browse by alphabetical listing, by style, by author or by popularity.',
'name': 'dafront.com',
'url': 'https://www.dafont.com/base-02.font',

    }
    ,
    {
'id': 2,
'image': 'https://www.fontmirror.com/app_public/logo/fontmirror-promotional-cover-bg.png',
'intro': 'Free download digital fonts. Get TTF, OTF or ZIP. Free for commercial use fonts, and more.',
'name': 'font mirror',
'url': 'https://www.fontmirror.com',

    }
    ,
    {
'id': 3,
'image': 'https://il.static.1001fonts.net/g/i/gisbon-demo-font-2-big.jpeg',
'intro': '23232 free fonts in 12468 families · Free licenses for commercial use · Direct font downloads',
'name': '101 fonts',
'url': 'https://www.1001fonts.com/signature-fonts.html',

    }
    ,
    {
'id': 4,
'image': "https://fontspace.imgix.net/static/fontspace-logo-white-text.svg",
'intro': 'Free downloads of legally licensed fonts that are perfect for your design projects. The best place in the universe to search for amazing fonts.',
'name': 'fontspace',
'url': 'https://www.fontspace.com/category/shadow',

    }
    ,
    {
'id':5 ,
'image':'https://asistatic.azureedge.net/images/fontflipper.com.jpeg',
'intro': 'https://fontflipper.com/canvas-editor',
'name': 'font flipper',
'url': 'https://fontflipper.com/canvas-editor',

    }
]
colors = [
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5ba399a0d65e6ec06564fe74_undraw_High_five_u364.svg',
'intro': "Are you looking for blend mode background images & beautiful background gradients for your User Interface?",
'name': 'Gradient guru',
'url':'http://gradientsguru.com/',
'extra': 'Gradients',
'price': 'free',
'type': 'Resources'
    },
    {
        'id': 6,
'image': 'https://uploads-ssl.webflow.com/59e09526e2711e000116d446/5ace6ff8507eccc0c1b1d2d6_solareclipse.gif',
'intro': "A total set of 14 color palettes and 280 colors for your designs, projects, presentations and other needs.",
'name': 'flat ui color',
'url':'https://flatuicolors.com/',
'extra': 'colors pallet',
'price': 'free',
'type': 'Resources'
    },
]
music_asset = [
    {
        'id': 0,
        'image': 'https://ichef.bbci.co.uk/news/800/cpsprodpb/2E61/production/_110537811_ec96af27-c995-4ed0-b977-9fb4f1d05d3f.jpg',
        'intro': "The Spinner* is a service that enables you to subconsciously influence a specific person, by controlling the content on the websites he or she usually visits. The targeted person gets repetitively exposed to hundreds of items which are placed and disguised as editorial content.",
        'name': 'thespinner',
        'url': 'https://www.thespinner.net/',
    },
    {
        'id': 0,
        'image': 'https://i1.sndcdn.com/avatars-000042402560-fxpy9a-t500x500.jpg',
        'intro': "PaponeMusic is a music label dedicated to promoting FREE music for the sole purpose of providing creators with the best songs to enhance the creativity",
        'name': 'papone music',
        'url': 'https://www.youtube.com/user/PaponeMusic',
    },
    {
        'id': 0,
        'image': 'https://i1.sndcdn.com/artworks-000105267662-86i42r-t500x500.jpg',
        'intro': "music producer who makes music for everyone to enjoy and use for free. No charges! Please credit me in the description of your Youtube videos! If you ",
        'name': 'HolFix - Royalty Free Music',
        'url': 'https://www.youtube.com/user/holfix',
    },
    {
        'id': 0,
        'image': '  https://i1.sndcdn.com/artworks-000102769935-nkultb-t500x500.jpg',
        'intro': "NoCopyrightSounds is a copyright free / stream safe record label, providing free to use music to the content creator community. We work with artists from around the globe",
        'name': 'NoCopyrightSounds',
        'url': 'https://www.youtube.com/user/NoCopyrightSounds',
    },
    {
        'id': 0,
        'image': 'http://dig.ccmixter.org/images/logo.png',
        'intro': "NoCopyrightSounds is a copyright free / stream safe record label, providing free to use music to the content creator community. We work with artists from around the globe",
        'name': 'NoCopyrightSounds',
        'url': 'http://dig.ccmixter.org/',
    },
    {
        'id': 0,
        'image': 'https://incompetech.com/wordpress/wp-content/uploads/2015/02/2013janlogo.png',
        'intro': "royality free music",
        'name': 'incompetech',
        'url': 'hhttps://incompetech.com/',
    },
    {
        'id': 0,
        'image': 'https://offeo.com/learn/wp-content/uploads/2019/03/freeplay-music.jpg',
        'intro': "OVER 50,000 SONGS FREE FOR youtube AND MORE",
        'name': 'incompetech',
        'url': 'https://freeplaymusic.com/#/',
    },
]
chekout_tools = [
    {
        'id': 0,
        'image': 'https://ichef.bbci.co.uk/news/800/cpsprodpb/2E61/production/_110537811_ec96af27-c995-4ed0-b977-9fb4f1d05d3f.jpg',
        'intro': "The Spinner* is a service that enables you to subconsciously influence a specific person, by controlling the content on the websites he or she usually visits. The targeted person gets repetitively exposed to hundreds of items which are placed and disguised as editorial content.",
        'name': 'thespinner',
        'url': 'https://www.thespinner.net/',
    }
]
    
@app.route('/', methods=['GET'])
def home():
    return '''<h1>Distant Reading Archive</h1>
<p>A prototype API for distant reading of science fiction novels.</p>'''


# A route to return all of the available entries in our catalog.
@app.route('/books', methods=['GET'])
def api_all():
    return jsonify(user_interface)

app.run()
