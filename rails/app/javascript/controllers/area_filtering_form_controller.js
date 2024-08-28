import { Controller } from "@hotwired/stimulus";

export default class AreaFilteringFormController extends Controller {
    static targets = ["prefectureId", "cityId", "submitButton"];

    updateCities(){
        const prefectureId = this.prefectureIdTarget.value;
        const cityIdTarget = this.cityIdTarget;

        // まず "全ての市区町村" オプションを追加
        const allCitiesOption = document.createElement("option");
        allCitiesOption.value = 0;
        allCitiesOption.textContent = "全ての市区町村";
        cityIdTarget.innerHTML = "";
        cityIdTarget.appendChild(allCitiesOption);

        if (prefectureId) {
            fetch(`/api/area_filtering/${prefectureId}/cities`)
                .then(response => response.json())
                .then(data => {
                    // 取得した市区町村を選択肢に追加
                    data.forEach(city => {
                        const option = document.createElement("option");
                        option.value = city.id;
                        option.textContent = city.name;
                        cityIdTarget.appendChild(option);
                    });
                    cityIdTarget = 0
                });
        }
    }
}
