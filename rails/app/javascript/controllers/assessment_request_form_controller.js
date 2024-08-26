import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="assessment-request-form"
export default class AssessmentRequestFormController extends Controller {
  // 静的プロパティにしないとエラー
  // Failed to register controller:
  // TypeError: Cannot read properties of undefined (reading 'charAt')
  static inputTargets = [
    "userLastName",
    "userFirstName",
    "userLastNameKana",
    "userFirstNameKana",
    "userTel",
    "userEmail",
    "propertyPrefectureId",
    "propertyCityId",
    "propertyAddress",
    // "propertyType",
    "propertyExclusiveArea",
    "propertyLandArea",
    "propertyBuildingArea",
    // "propertyBuildingAreaUnit",
    "propertyFloorArea",
    // "propertyRoomPlan",
    "propertyConstructedYear"
  ]

  static errorMessageTargets = [
    "userLastNameErrorMessage",
    "userFirstNameErrorMessage",
    "userLastNameKanaErrorMessage",
    "userFirstNameKanaErrorMessage",
    "userTelErrorMessage",
    "userEmailErrorMessage",
    // "propertyCityErrorMessage",
    "propertyAddressErrorMessage",
    // "propertyTypeErrorMessage",
    "propertyExclusiveAreaErrorMessage",
    "propertyLandAreaErrorMessage",
    "propertyBuildingAreaErrorMessage",
    // "propertyBuildingAreaUnitErrorMessage",
    "propertyFloorAreaErrorMessage",
    // "propertyRoomPlanErrorMessage",
    "propertyConstructedYearErrorMessage"
  ]

  static targets = ['submitButton'].concat(this.inputTargets, this.errorMessageTargets)

  validateUserLastName() {
    const userLastNameTarget = this.userLastNameTarget
    const errorMessageTarget = this.userLastNameErrorMessageTarget

    userLastNameTarget.className = "border border-danger border-2"

    const userLastName = userLastNameTarget.value
    if (userLastName === "") {
      errorMessageTarget.textContent = "名字を入力してください"
    } else if (userLastName.length > 15) {
      errorMessageTarget.textContent = "名字は15文字以下にしてください"
    } else {
      userLastNameTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validateUserFirstName() {
    const userFirstNameTarget = this.userFirstNameTarget
    const errorMessageTarget = this.userFirstNameErrorMessageTarget

    userFirstNameTarget.className = "border border-danger border-2"

    const userFirstName = userFirstNameTarget.value
    if (userFirstName === "") {
      errorMessageTarget.textContent = "名前を入力してください"
    } else if (userFirstName.length > 15) {
      errorMessageTarget.textContent = "名前は15文字以下にしてください"
    } else {
      userFirstNameTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validateUserLastNameKana() {
    const userLastNameKanaTarget = this.userLastNameKanaTarget
    const errorMessageTarget = this.userLastNameKanaErrorMessageTarget

    userLastNameKanaTarget.className = "border border-danger border-2"

    const userLastNameKana = userLastNameKanaTarget.value
    if (userLastNameKana === "") {
      errorMessageTarget.textContent = "名字のフリガナを入力してください"
    } else if (userLastNameKana.length > 30) {
      errorMessageTarget.textContent = "名字のフリガナは30文字以内で入力してください"
    } else {
      userLastNameKanaTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validateUserFirstNameKana() {
    const userFirstNameKanaTarget = this.userFirstNameKanaTarget
    const errorMessageTarget = this.userFirstNameKanaErrorMessageTarget

    userFirstNameKanaTarget.className = "border border-danger border-2"

    const userFirstNameKana = userFirstNameKanaTarget.value
    if (userFirstNameKana === "") {
      errorMessageTarget.textContent = "名前のフリガナを入力してください"
    } else if (userFirstNameKana.length > 30) {
      errorMessageTarget.textContent = "名前のフリガナは30文字以内で入力してください"
    } else {
      userFirstNameKanaTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validateUserTel() {
    const userTelTarget = this.userTelTarget
    const errorMessageTarget = this.userTelErrorMessageTarget

    userTelTarget.className = "border border-danger border-2"

    const userTel = userTelTarget.value
    const telRegex = /^0\d{9,10}$/
    if (userTel === "") {
      errorMessageTarget.textContent = "電話番号を入力してください。"
    } else if (!telRegex.test(userTel)) {
      errorMessageTarget.textContent = "電話番号は0始まりかつ10〜11桁の数字で入力してください"
    } else {
      userTelTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validateUserEmail() {
    const userEmailTarget = this.userEmailTarget
    const errorMessageTarget = this.userEmailErrorMessageTarget

    userEmailTarget.className = "border border-danger border-2"

    const userEmail = userEmailTarget.value
    const emailRegex = /^[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+$/i
    if (userEmail === "") {
      errorMessageTarget.textContent = "メールアドレスを入力してください"
    } else if (userEmail.length > 100) {
      errorMessageTarget.textContent = "メールアドレスは100文字以内で入力してください"
    } else if (!emailRegex.test(userEmail)) {
      errorMessageTarget.textContent = "メールアドレスの形式が正しくありません"
    } else {
      userEmailTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validatePropertyAddress() {
    const propertyAddressTarget = this.propertyAddressTarget
    const errorMessageTarget = this.propertyAddressErrorMessageTarget

    propertyAddressTarget.className = "border border-danger border-2"

    if (propertyAddressTarget.value === "") {
      errorMessageTarget.textContent = "住所を入力してください"
    } else {
      propertyAddressTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validatePropertyExclusiveArea() {
    const propertyExclusiveAreaTarget = this.propertyExclusiveAreaTarget
    const errorMessageTarget = this.propertyExclusiveAreaErrorMessageTarget

    propertyExclusiveAreaTarget.className = "border border-danger border-2"

    const propertyExclusiveArea = propertyExclusiveAreaTarget.value
    if (propertyExclusiveArea === "") {
      errorMessageTarget.textContent = "専有面積を入力してください"
    } else if(isNaN(propertyExclusiveArea)) {
      errorMessageTarget.textContent = "数値を入力してください"
    } else if (propertyExclusiveArea <= 0) {
      errorMessageTarget.textContent = "正の数を入力してください"
    } else {
      propertyExclusiveAreaTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validatePropertyLandArea() {
    const propertyLandAreaTarget = this.propertyLandAreaTarget
    const errorMessageTarget = this.propertyLandAreaErrorMessageTarget

    propertyLandAreaTarget.className = "border border-danger border-2"

    const propertyLandArea = propertyLandAreaTarget.value
    if (propertyLandArea === "") {
      errorMessageTarget.textContent = "土地面積を入力してください"
    } else if (isNaN(propertyLandArea)) {
      errorMessageTarget.textContent = "数値を入力してください"
    } else if (propertyLandArea <= 0) {
      errorMessageTarget.textContent = "正の数を入力してください"
    } else {
      propertyLandAreaTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validatePropertyBuildingArea() {
    const propertyBuildingAreaTarget = this.propertyBuildingAreaTarget
    const errorMessageTarget = this.propertyBuildingAreaErrorMessageTarget

    propertyBuildingAreaTarget.className = "border border-danger border-2"

    const propertyBuildingArea = propertyBuildingAreaTarget.value
    if (propertyBuildingArea === "") {
      errorMessageTarget.textContent = "建物面積を入力してください"
    } else if (isNaN(propertyBuildingArea)) {
      errorMessageTarget.textContent = "数値を入力してください"
    } else if (propertyBuildingArea <= 0) {
      errorMessageTarget.textContent = "正の数を入力してください"
    } else {
      propertyBuildingAreaTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validatePropertyFloorArea() {
    const propertyFloorAreaTarget = this.propertyFloorAreaTarget
    const errorMessageTarget = this.propertyFloorAreaErrorMessageTarget

    propertyFloorAreaTarget.className = "border border-danger border-2"

    const propertyFloorArea = propertyFloorAreaTarget.value
    if (propertyFloorArea === "") {
      errorMessageTarget.textContent = "延床面積を入力してください"
    } else if (isNaN(propertyFloorArea)) {
      errorMessageTarget.textContent = "数値を入力してください"
    } else if (propertyFloorArea < 0) {
      errorMessageTarget.textContent = "正の数を入力してください"
    } else {
      propertyFloorAreaTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  validatePropertyConstructedYear() {
    const propertyConstructedYearTarget = this.propertyConstructedYearTarget
    const errorMessageTarget = this.propertyConstructedYearErrorMessageTarget

    propertyConstructedYearTarget.className = "border border-danger border-2"

    const propertyConstructedYear = propertyConstructedYearTarget.value
    if (propertyConstructedYear === "") {
      errorMessageTarget.textContent = "築年数を入力してください"
    } else if(isNaN(propertyConstructedYear)) {
      errorMessageTarget.textContent = "数値を入力してください"
    } else if(propertyConstructedYear < 1925 || 2016 < propertyConstructedYear){
      errorMessageTarget.textContent = "1925〜2016年築の物件のみ査定を受け付けております"
    } else {
      propertyConstructedYearTarget.className = ""
      errorMessageTarget.textContent = ""
    }
  }

  switchSubmitButtonState() {
    if (this.isAllFormFilled() && this.isAllFormValid()) {
      this.submitButtonTarget.disabled = false
    } else {
      this.submitButtonTarget.disabled = true
    }
  }

  isAllFormFilled(){
    for (const targetName of AssessmentRequestFormController.inputTargets) {
      const target = this[targetName + "Target"]
      if (target.value === "") {
        return false
      }
    }
    return true
  }

  isAllFormValid(){
    for (const targetName of AssessmentRequestFormController.errorMessageTargets) {
      const errorTarget = this[targetName + "Target"]
      if (errorTarget.textContent !== "") {
        return false
      }
    }
    return true
  }

  updateCities(){
    const prefectureId = this.propertyPrefectureIdTarget.value
    if(prefectureId){
      const propertyCityIdTarget = this.propertyCityIdTarget

      fetch(`/assessment_requests/${prefectureId}/cities`)
        .then(response => response.json())
        .then(data => {
          // 選択肢を初期化
          propertyCityIdTarget.innerHTML = "";
          // 取得した市区町村を選択肢に追加
          data.forEach(city => {
            const option = document.createElement("option");
            option.value = city.id;
            option.textContent = city.name;
            propertyCityIdTarget.appendChild(option);
          });
        });
    }
  }
}