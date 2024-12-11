function showSection(sectionId) {
	// On masquer toutes les sections
	const sections = document.querySelectorAll('.section');
	sections.forEach(section => section.classList.add('hidden'));

	// On affiche la section sélectionnée
	document.getElementById(sectionId).classList.remove('hidden');

	// On met en surbrillance le menu actif
	const menuItems = document.querySelectorAll('.side-menu li');
	menuItems.forEach(item => item.classList.remove('active'));
	event.target.closest('li').classList.add('active');
}

document.addEventListener("DOMContentLoaded", function () {
    console.log("DOM fully loaded and parsed.");
    const iconToggler = document.getElementById("icon-toggler");
    const resizingLink = document.getElementById("resizing");

    iconToggler.addEventListener("click", function () {
        console.log("Icon clicked");
        if (resizingLink.textContent === "Agrandir") {
            resizingLink.textContent = "Rétrécir";
        } else {
            resizingLink.textContent = "Agrandir";
        }
    });
});
