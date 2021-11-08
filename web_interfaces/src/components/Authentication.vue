<template>
  <v-content>
    <v-container fluid fill-height>
      <v-layout align-center justify-center>
          <v-flex xs12 sm8 md4>
            <v-card class="elevation-12">
                <v-toolbar dark color="primary">
                  <v-toolbar-title>Log in</v-toolbar-title>
                </v-toolbar>
                <v-card-text>
                  <v-form>
                      <v-text-field
                        name="login"
                        label="Login"
                        type="text"
                      ></v-text-field>
                      <v-text-field
                        id="password"
                        name="password"
                        label="Password"
                        type="password"
                      ></v-text-field>
                  </v-form>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-card-text>
                    No account yet ?
                    <router-link to="/sign_up">Signup</router-link>
                  </v-card-text>
                  <v-btn color="primary" to="/">Login</v-btn>
                </v-card-actions>
            </v-card>
          </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>

<script>
</script>

<style>
</style>