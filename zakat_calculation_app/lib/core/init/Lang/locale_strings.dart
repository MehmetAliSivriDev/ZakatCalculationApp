import 'package:get/get.dart';

class LocaleStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //English
        'en_US': {
          LocaleStringsName.yes.name: 'Yes',
          LocaleStringsName.no.name: 'No',
          LocaleStringsName.all.name: 'All',

          //Home View
          LocaleStringsName.fabButtonText.name: 'Change Language',
          LocaleStringsName.appBarText.name: 'Zakat Calculation',
          LocaleStringsName.hLTZakatText.name: 'Calculate Zakat Amount',
          LocaleStringsName.hLTHistoryText.name: 'Past Calculations',
          LocaleStringsName.hLTCRateText.name: 'View Current Rate',
          LocaleStringsName.hLTCHowText.name: 'How is it Calculated ?',
          LocaleStringsName.appBarZCBText.name: 'Zakat Conditions',
          LocaleStringsName.hzcTitle.name:
              'When does Zakat become obligatory for a Muslim?',
          LocaleStringsName.hzcSubTitle.name:
              'Conditions for zakat to be obligatory:',
          LocaleStringsName.hzcCondition1.name:
              '- In addition to the goods reaching the nisab, they must also be profitable (reproductive/increasing).',
          LocaleStringsName.hzcCondition2.name:
              '- One year has passed from the moment of possession',
          LocaleStringsName.hzcCondition3.name:
              "- It is more than one year's debt and basic needs. Essential necessities are things that people need to protect their life and freedom.",

          //Zakat Calculate History View
          LocaleStringsName.hwAppBarText.name: 'Past Zakat Calculations',
          LocaleStringsName.hwNoHistoryText.name: 'No Past Calculations Found.',
          LocaleStringsName.hwGoldValueText.name: 'Gold Gram Value',
          LocaleStringsName.hwDolarValueText.name: 'Dolar Value',
          LocaleStringsName.hwEuroValueText.name: 'Euro Value',
          LocaleStringsName.hwAmountUserText.name: "User's Amount",
          LocaleStringsName.hwZakatAmount.name: 'Amount of Zakat',
          LocaleStringsName.hwADaSure.name: 'Are You Sure ?',
          LocaleStringsName.hwADQuestion1.name:
              'Are you sure you want to delete this zakat calculation?',
          LocaleStringsName.hwADResultTitle.name: 'Delete Zakat',
          LocaleStringsName.hwADResult.name:
              'Zakat has been successfully deleted.',

          //Currency Rate View
          LocaleStringsName.crwAppBarText.name: 'Currency Rate',
          LocaleStringsName.turkLirasiText.name: 'Turkish Lira',
          LocaleStringsName.goldGram.name: 'Gram Gold',

          //Calculate View
          LocaleStringsName.cwAppBarText.name: 'Zakat Calculation Types',
          LocaleStringsName.cwGoldText.name: 'Gold',

          //Calculate-Gold View
          LocaleStringsName.cwgAppBarText.name: 'Calculating Zakat with Gold',
          LocaleStringsName.cwginfoText.name:
              'If you want to change the gram value of gold, click the button. Current Value: ',
          LocaleStringsName.cwgTFText.name: 'Enter the Amount of Gold Gr.',
          LocaleStringsName.cwgZCButtonText.name:
              'Calculate the Amount of Zakat',
          LocaleStringsName.cwgZResultText.name:
              'The Amount of Zakat You Should Give',
          LocaleStringsName.cwgWPEnterGGText.name:
              'Please enter your gold gram amount.',
          LocaleStringsName.cwgZCSuccessText.name:
              'Your zakat has been calculated successfully.',
          LocaleStringsName.cwgChangeGGTFText.name: 'Enter Gram Gold Value',
          LocaleStringsName.cwgChangeGGWarningText.name: 'Enter a Valid Value.',
          LocaleStringsName.cwgChangeGGResultText.name:
              'Adjusted Current Gold Gram Value',
          LocaleStringsName.cwgChangeGGADTitle.name: 'Changing Gram Value',
          LocaleStringsName.cwgChangeGGButtonText.name: 'Change',
          LocaleStringsName.cwgChangeGGWarning2Text.name:
              'The gram gold amount you enter must be at least 80.18 grams. ',

          //Calculate-Dolar View
          LocaleStringsName.cwdAppBarText.name:
              'Calculating Zakat with Dollars',
          LocaleStringsName.cwdinfoText.name:
              'If you want to change the value of the dollar, click the button. Current Value: ',
          LocaleStringsName.cwdLimitAmount.name:
              'Lower Limit Amount You Should Give :',
          LocaleStringsName.cwdLimitNote.name:
              'Note! : The limit varies depending on the value of gram gold.',
          LocaleStringsName.cwdGetDolarAmount.name: 'Enter Dollar Amount',
          LocaleStringsName.cwdEnterDolarValue.name: 'Enter Dollar Value',
          LocaleStringsName.cwdNewDolarValue.name: 'New Dollar Value :',
          LocaleStringsName.cwdADTitle.name: 'Changing Dollar Value',
          LocaleStringsName.cwdPleaseEDValue.name: 'Please Enter Dollar Amount',
          LocaleStringsName.cwdDolarAmount.name: 'Dolar Amount',
          LocaleStringsName.cwdLimitWarning.name:
              "You must have more than the Limit.",

          //Calculate-Euro View

          LocaleStringsName.cweAppBarText.name: 'Calculating Zakat with Euros',
          LocaleStringsName.cweinfoText.name:
              'If you want to change the value of the euro, click the button. Current Value: ',
          LocaleStringsName.cweGetEuroAmount.name: 'Enter Euro Amount',
          LocaleStringsName.cweEnterEuroValue.name: 'Enter Euro Value',
          LocaleStringsName.cweNewEuroValue.name: 'New Euro Value :',
          LocaleStringsName.cweADTitle.name: 'Changing Euro Value',
          LocaleStringsName.cwePleaseEDValue.name: 'Please Enter Euro Amount',
          LocaleStringsName.cweEuroAmount.name: 'Euro Amount',

          //Calculate How View

          LocaleStringsName.chvDetailHeader.name: 'Detail',
          LocaleStringsName.chvExplanationHeader.name: 'Explanation',
          LocaleStringsName.chvCGoldTitle.name: 'Giving Zakat with Gold',
          LocaleStringsName.chvCGoldDetail.name:
              'It is based on the current gram gold rate.',
          LocaleStringsName.chvCGoldInfo.name:
              "In order to calculate zakat, you must have at least 80.18 grams of gold and log in. The amount you enter is then converted to TL and 2.5% of the resulting amount is calculated to calculate zakat.",
          LocaleStringsName.chvCDolarTitle.name: 'Giving Zakat with Dollars',
          LocaleStringsName.chvCDolarDetail.name:
              'It is based on the current dollar exchange rate.',
          LocaleStringsName.chvCDolarInfo.name:
              "In order to calculate zakat, you must have at least 80.18 grams converted to TL and the TL amount of the dollar amount you have entered must exceed this limit.\nThe amount you have entered is then converted to TL and 2.5% of the resulting amount is taken to calculate zakat.",
          LocaleStringsName.chvCEuroTitle.name: 'Giving Zakat with Euro',
          LocaleStringsName.chvCEuroDetail.name:
              'It is based on the current euro exchange rate.',
          LocaleStringsName.chvCEuroInfo.name:
              "In order to calculate zakat, you must have at least 80.18 grams converted to TL and the TL amount of the euro amount you have entered must exceed this limit.\nThe amount you have entered is then converted to TL and 2.5% of the resulting amount is taken to calculate zakat.",
        },

        //Turkish
        'tr_TR': {
          LocaleStringsName.yes.name: 'Evet',
          LocaleStringsName.no.name: 'Hayır',
          LocaleStringsName.all.name: 'Tümü',

          //Home View
          LocaleStringsName.fabButtonText.name: "Dil Değiştir",
          LocaleStringsName.appBarText.name: 'Zekat Hesaplama',
          LocaleStringsName.hLTZakatText.name: 'Zekat Miktarını Hesapla',
          LocaleStringsName.hLTHistoryText.name: 'Geçmiş Hesaplamalar',
          LocaleStringsName.hLTCRateText.name: 'Güncel Kuru Görüntüle',
          LocaleStringsName.hLTCHowText.name: 'Nasıl Hesaplanıyor ?',
          LocaleStringsName.appBarZCBText.name: 'Zekat Şartları',
          LocaleStringsName.hzcTitle.name:
              'Bir Müslümana Zekat Ne Zaman Farz Olur ?',
          LocaleStringsName.hzcSubTitle.name:
              'Zekâtın farz olması için şartlar :',
          LocaleStringsName.hzcCondition1.name:
              '- Malların nisaba ulaşması yanında nâmî (üreyici/artıcı) olması',
          LocaleStringsName.hzcCondition2.name:
              '- Sahip olunduğu andan itibaren üzerinden bir yıl geçmesi',
          LocaleStringsName.hzcCondition3.name:
              '- Bir yıllık borcundan ve aslî ihtiyaçlardan fazla olmasıdır. Asli ihtiyaç maddeleri insanın hayat ve hürriyetini korumak için muhtaç olduğu şeylerdir.',

          //Zakat Calculation History view
          LocaleStringsName.hwAppBarText.name: 'Geçmiş Zekat Hesaplamaları',
          LocaleStringsName.hwNoHistoryText.name:
              'Herhangi Bir Geçmiş Hesaplama Bulunamadı.',
          LocaleStringsName.hwGoldValueText.name: 'Altın Gram Değeri',
          LocaleStringsName.hwDolarValueText.name: 'Dolar Değeri',
          LocaleStringsName.hwEuroValueText.name: 'Euro Değeri',
          LocaleStringsName.hwAmountUserText.name: 'Kullanıcının Miktarı',
          LocaleStringsName.hwZakatAmount.name: 'Zekat Miktarı',
          LocaleStringsName.hwADaSure.name: 'Emin Misiniz ?',
          LocaleStringsName.hwADQuestion1.name:
              'Bu zekat hesaplamasını silmek istediğinizden emin misiniz?',
          LocaleStringsName.hwADResultTitle.name: 'Zekatı Sil',
          LocaleStringsName.hwADResult.name: 'Zekat başarıyla silindi.',

          //Currency Rate View
          LocaleStringsName.crwAppBarText.name: 'Güncel Kur',
          LocaleStringsName.turkLirasiText.name: 'Türk Lirası',
          LocaleStringsName.goldGram.name: 'Gram Altın',

          //Calculate View
          LocaleStringsName.cwAppBarText.name: 'Zekat Hesaplama Çeşitleri',
          LocaleStringsName.cwGoldText.name: 'Altın',

          //Calculate-Gold View
          LocaleStringsName.cwgAppBarText.name: 'Altın ile Zekat Hesaplama',
          LocaleStringsName.cwginfoText.name:
              'Altının gram değerini değiştirmek istiyorsanız butona tıklayın. Mevcut Değer: ',
          LocaleStringsName.cwgTFText.name: 'Altın Gram Miktarını Giriniz',
          LocaleStringsName.cwgZCButtonText.name: 'Zekat Miktarını Hesapla',
          LocaleStringsName.cwgZResultText.name:
              'Vermeniz Gereken Zekat Miktarı',
          LocaleStringsName.cwgWPEnterGGText.name:
              'Lütfen altın gram miktarınızı giriniz.',
          LocaleStringsName.cwgZCSuccessText.name:
              'Zekatınız başarıyla hesaplandı.',
          LocaleStringsName.cwgChangeGGTFText.name: 'Gram Altın Değeri Giriniz',
          LocaleStringsName.cwgChangeGGWarningText.name:
              'Geçerli Bir Değer Giriniz.',
          LocaleStringsName.cwgChangeGGResultText.name:
              'Ayarlanan Güncel Altın Gram Değeri',
          LocaleStringsName.cwgChangeGGADTitle.name: 'Gram Değeri Değiştirme',
          LocaleStringsName.cwgChangeGGButtonText.name: 'Değiştir',
          LocaleStringsName.cwgChangeGGWarning2Text.name:
              'Girdiğiniz gram altın miktarı en az 80.18 gr. olmalı.',

          //Calculate-Dolar View

          LocaleStringsName.cwdAppBarText.name: 'Dolar ile Zekat Hesaplama',
          LocaleStringsName.cwdinfoText.name:
              'Doların değerini değiştirmek istiyorsanız butona tıklayın. Mevcut Değer: ',
          LocaleStringsName.cwdLimitAmount.name:
              'Vermeniz Gereken Alt Limit Miktari :',
          LocaleStringsName.cwdLimitNote.name:
              'Not! : Limit gram altının değerine göre değişmektedir.',
          LocaleStringsName.cwdGetDolarAmount.name: 'Dolar Miktarını Giriniz',
          LocaleStringsName.cwdEnterDolarValue.name: 'Dolar Değerini Giriniz',
          LocaleStringsName.cwdNewDolarValue.name: 'Yeni Dolar Değeri :',
          LocaleStringsName.cwdADTitle.name: 'Dolar Değeri Değiştirme',
          LocaleStringsName.cwdPleaseEDValue.name:
              'Lütfen Dolar Miktarı Giriniz',
          LocaleStringsName.cwdDolarAmount.name: 'Dolar Miktarı',
          LocaleStringsName.cwdLimitWarning.name:
              "Limit'ten fazla miktara sahip olmalısınız.",

          //Calculate-Euro View

          LocaleStringsName.cweAppBarText.name: 'Euro ile Zekat Hesaplama',
          LocaleStringsName.cweinfoText.name:
              'Euronun değerini değiştirmek istiyorsanız butona tıklayın. Mevcut Değer: ',
          LocaleStringsName.cweGetEuroAmount.name: 'Euro Miktarını Giriniz',
          LocaleStringsName.cweEnterEuroValue.name: 'Euro Değerini Giriniz',
          LocaleStringsName.cweNewEuroValue.name: 'Yeni Euro Değeri :',
          LocaleStringsName.cweADTitle.name: 'Euro Değeri Değiştirme',
          LocaleStringsName.cwePleaseEDValue.name:
              'Lütfen Euro Miktarı Giriniz',
          LocaleStringsName.cweEuroAmount.name: 'Euro Miktarı',

          //Calculate How View

          LocaleStringsName.chvDetailHeader.name: 'Detay',
          LocaleStringsName.chvExplanationHeader.name: 'Açıklama',
          LocaleStringsName.chvCGoldTitle.name: 'Altın ile Zekat Verme',
          LocaleStringsName.chvCGoldDetail.name:
              'Güncel gram altın kuru baz alınarak gerçekleştirilmektedir.',
          LocaleStringsName.chvCGoldInfo.name:
              "Zekat hesaplamasının yapılabilmesi için en az 80,18 gram altına sahip olmalı ve giriş yapmalısınız.Daha sonrasında girmiş olduğunuz miktar TL'ye çevirilir ve oluşan miktarın %2.5'i alınarak zekat hesaplaması gerçekleştirilir.",
          LocaleStringsName.chvCDolarTitle.name: 'Dolar ile Zekat Verme',
          LocaleStringsName.chvCDolarDetail.name:
              'Güncel dolar kuru baz alınarak gerçekleştirilmektedir.',
          LocaleStringsName.chvCDolarInfo.name:
              "Zekat hesaplamasının yapılabilmesi için en az 80,18 gramın TL miktarına çevirilmiş haline sahip olmalısınız ve girişmiş olduğunuz dolar miktarının TL miktarı bu limiti aşmış olmalı.\nDaha sonrasında girmiş olduğunuz miktar TL'ye çevirilir ve oluşan miktarın %2.5'i alınarak zekat hesaplaması gerçekleştirilir.",
          LocaleStringsName.chvCEuroTitle.name: 'Euro ile Zekat Verme',
          LocaleStringsName.chvCEuroDetail.name:
              'Güncel euro kuru baz alınarak gerçekleştirilmektedir.',
          LocaleStringsName.chvCEuroInfo.name:
              "Zekat hesaplamasının yapılabilmesi için en az 80,18 gramın TL miktarına çevirilmiş haline sahip olmalısınız ve girişmiş olduğunuz euro miktarının TL miktarı bu limiti aşmış olmalı.\nDaha sonrasında girmiş olduğunuz miktar TL'ye çevirilir ve oluşan miktarın %2.5'i alınarak zekat hesaplaması gerçekleştirilir.",
        }
      };
}

enum LocaleStringsName {
  yes,
  no,
  all,

  //Home View
  fabButtonText,
  appBarText,
  appBarZCBText,
  hLTZakatText,
  hLTHistoryText,
  hLTCRateText,
  hLTCHowText,
  hzcTitle,
  hzcSubTitle,
  hzcCondition1,
  hzcCondition2,
  hzcCondition3,

  //Zakat Calculate History View
  hwAppBarText,
  hwNoHistoryText,
  hwGoldValueText,
  hwDolarValueText,
  hwEuroValueText,
  hwAmountUserText,
  hwZakatAmount,
  hwADaSure,
  hwADQuestion1,
  hwADResultTitle,
  hwADResult,

  //Currency Rate View
  crwAppBarText,
  turkLirasiText,
  goldGram,

  //Calculate View
  cwAppBarText,
  cwGoldText,

  //Calculate-Gold View
  cwgAppBarText,
  cwginfoText,
  cwgTFText,
  cwgZCButtonText,
  cwgZResultText,
  cwgWPEnterGGText,
  cwgZCSuccessText,
  cwgChangeGGTFText,
  cwgChangeGGWarningText,
  cwgChangeGGResultText,
  cwgChangeGGADTitle,
  cwgChangeGGButtonText,
  cwgChangeGGWarning2Text,

  //Calculate-Dolar View
  cwdAppBarText,
  cwdinfoText,
  cwdLimitAmount,
  cwdLimitNote,
  cwdGetDolarAmount,
  cwdEnterDolarValue,
  cwdNewDolarValue,
  cwdADTitle,
  cwdPleaseEDValue,
  cwdDolarAmount,
  cwdLimitWarning,

  //Calculate-Euro View
  cweAppBarText,
  cweinfoText,
  cweGetEuroAmount,
  cweEnterEuroValue,
  cweNewEuroValue,
  cweADTitle,
  cwePleaseEDValue,
  cweEuroAmount,

  //Calculate How View
  chvDetailHeader,
  chvExplanationHeader,
  chvCGoldTitle,
  chvCGoldDetail,
  chvCGoldInfo,
  chvCDolarTitle,
  chvCDolarDetail,
  chvCDolarInfo,
  chvCEuroTitle,
  chvCEuroDetail,
  chvCEuroInfo,
}
