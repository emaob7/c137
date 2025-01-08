import GoogleMobileAds
import SwiftUI

class Interstitial: NSObject, GADFullScreenContentDelegate {
    private var interstitial: GADInterstitialAd?
    private var adUnitID: String
    var didDismissAd: (() -> Void)?

    init(adUnitID: String) {
        self.adUnitID = adUnitID
        super.init()
        loadInterstitial()
    }

    private func loadInterstitial() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: adUnitID, request: request) { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        }
    }

    func showAd(from rootViewController: UIViewController) {
        if let interstitial = interstitial {
            interstitial.present(fromRootViewController: rootViewController)
        } else {
            print("Ad wasn't ready")
            didDismissAd?() // Ejecutar la callback si el anuncio no está listo
        }
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
        didDismissAd?()
        loadInterstitial() // Cargar un nuevo anuncio
    }
}




/*import SwiftUI
import GoogleMobileAds

class Interstitial: NSObject, GADFullScreenContentDelegate {
    private var interstitial: GADInterstitialAd?
    var adUnitID: String

    init(adUnitID: String) {
        self.adUnitID = adUnitID
        super.init()
        loadAd()
    }

    private func loadAd() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: adUnitID,
                               request: request,
                               completionHandler: { [self] ad, error in
                                   if let error = error {
                                       print("Failed to load interstitial ad: \(error.localizedDescription)")
                                       return
                                   }
                                   interstitial = ad
                                   interstitial?.fullScreenContentDelegate = self
                               })
    }

    func showAd(from rootViewController: UIViewController) {
        if let interstitial = interstitial {
            interstitial.present(fromRootViewController: rootViewController)
        } else {
            print("Ad wasn't ready")
        }
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        loadAd()
    }
 }*/
