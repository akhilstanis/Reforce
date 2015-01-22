# Reforce
Control your favourite HTML5 based presentations using the volume buttons of your iPhone. Just upload the presentations to Reforce using the upload feature via Wi-Fi and you are ready to go.

<img width="24%" src="https://cloud.githubusercontent.com/assets/955760/5863546/52d61b7e-a2a0-11e4-897f-abe404d2e52b.png" />
<img width="24%" src="https://cloud.githubusercontent.com/assets/955760/5863543/527a850c-a2a0-11e4-89f7-61182d9691a8.PNG" />
<img width="24%" src="https://cloud.githubusercontent.com/assets/955760/5863544/5284d12e-a2a0-11e4-9d9f-763ceca64693.PNG" />
<img width="24%" src="https://cloud.githubusercontent.com/assets/955760/5863545/52c7e78e-a2a0-11e4-86b3-228825241262.PNG" />
<img width="98%" src="https://cloud.githubusercontent.com/assets/955760/5863547/52f811de-a2a0-11e4-8bb3-1760a150f455.png" />


## How it works?
When an HTML5 presentation is uploaded and selected in the app, a web server starts run at port 5000 serving the selected presentation. The app also injects some javascript in to the the presentation's index file, which basically sets up a connection between the app and presentation using websockets. Now when a volume button is pressed, the app sends a 'next/previous' message to the presentation via websocket and the injected javascript handles this message and uses the presentation tool's javascript API to control the slide. Simple and easy, right?

## Installation
Not yet available on the AppStore as I am in the middle of implementing few more nifty features. So to try out Reforce, you will have to clone and build it. :)

## Usage
1. Open the app and tap settings icon on top right. Turn on the upload option.
2. Go back and you will see the IP address of your phone. Open `http://your.ip:5000/upload` in a web browser to upload your presentation to app.
3. Currently the app supports Reveal.js and Impress.js presentations. Zip the presentation so that the index.html is in the root of the zip archive along with other required files. Now to upload simply drag and drop the zip archive to the upload page.
4. You will see the presentation in app once the upload is over. You can then select the presentation in the app and you presentation will start running at `http://your.ip:5000`.
5. Use volume up to go to the next slide and volume down to go to the previous slide.

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Reforce is available under the MIT license. See the LICENSE file for more info.
