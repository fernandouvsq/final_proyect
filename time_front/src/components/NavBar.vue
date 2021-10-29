<template>
<div>
        <b-navbar toggleable="lg" type="dark" variant="dark">
        <b-navbar-brand href="#">                        
            <b-button v-b-toggle.sidebar-variant>
                <img alt="Vue logo" style="width: 35px;" src="../assets/logo.png">
            </b-button>
        </b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
<!--         <b-navbar-nav>
            <b-nav-item href="#">Link</b-nav-item>
            <b-nav-item href="#" disabled>Disabled</b-nav-item>
        </b-navbar-nav> -->

        <!-- Right aligned nav items -->
        <b-navbar-nav style="margin-right: 100px;">
<!--             <b-nav-form>
            <b-form-input size="sm" class="mr-sm-2" placeholder="Search"></b-form-input>
            <b-button size="sm" class="my-2 my-sm-0" type="submit">Search</b-button>
            </b-nav-form> -->

<!--             <b-nav-item-dropdown text="Lang" right>
            <b-dropdown-item href="#">EN</b-dropdown-item>
            <b-dropdown-item href="#">ES</b-dropdown-item>
            <b-dropdown-item href="#">RU</b-dropdown-item>
            <b-dropdown-item href="#">FA</b-dropdown-item>
            </b-nav-item-dropdown> -->

            <b-nav-item-dropdown >
            <!-- Using 'button-content' slot -->
                <template #button-content>
                    <b-avatar src="https://dummyimage.com/360x360/fff/aaa"></b-avatar>
                </template>
                <b-dropdown-item href="#">Profile</b-dropdown-item>
                <b-dropdown-item href="#">Sign Out</b-dropdown-item>
            </b-nav-item-dropdown>
        </b-navbar-nav>
        </b-collapse>
    </b-navbar>
    <b-sidebar id="sidebar-variant" title="Sidebar" bg-variant="dark" text-variant="light" shadow>
      <div class="px-3 py-2">
            <b-list-group>
                <b-list-group-item variant="dark" button>Working Times</b-list-group-item>
                <b-list-group-item variant="dark" button>Charts</b-list-group-item>
            </b-list-group>
      </div>
    </b-sidebar>
</div>
</template>


<style scoped>
.navbar-brand {
    margin-right: 85% !important;
    margin-left: 1% !important;
}
.bi-x.b-icon.bi {
    color: black !important;
}
</style>
