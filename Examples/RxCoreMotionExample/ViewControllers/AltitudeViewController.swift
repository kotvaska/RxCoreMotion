//
// Created by Anastasia Zolotykh on 23.04.2018.
// Copyright (c) 2018 RxSwiftCommunity - https://github.com/RxSwiftCommunity. All rights reserved.
//

import Foundation
import RxSwift
import CoreMotion
import RxCoreMotion

class AltitudeViewController: UIViewController {

    let disposeBag = DisposeBag()
    let altimeter = CMAltimeter.rx.manager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        altimeter.
                .flatMapLatest { manager in
                    manager.altimeterData ?? Observable.empty()
                }
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { altimeterData in
                    print(altimeterData)
                })
                .disposed(by: disposeBag)

    }

}
