const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const axios = require("axios");
const jwt = require("jsonwebtoken");

app.use(bodyParser.json());

app.post("/login-user", (req, res) => {
  const input = req.body.input;

  const query = `query GetUserInfo($username: String!, $password: String!) {
    users(where: {username: {_eq: $username}, password: {_eq: $password}}) {
      id
      role
    }
  }`;

  postToHasura(query, { username: input.username, password: input.password })
    .then((response) => {
      console.log(response.data);
      var user = response.data.data.users[0];
      return signJwt(user.id, user.role);
    })
    .then((accessToken) => {
      res.json({ accessToken });
    })
    .catch((error) => {
      res.status(400).json({ message: error.message });
    });
});

app.listen(3000, () => {
  console.log("API listens to http://localhost:3000");
});

function postToHasura(query, variables) {
  return axios.post(
    "http://host.docker.internal:8080/v1/graphql",
    {
      query,
      variables,
    },
    {
      headers: {
        "x-hasura-admin-secret": "secret",
      },
    }
  );
}

function signJwt(userId, role) {
  const jwtSecret =
    "b88be4a82e11ffa8b2e7f670539ba2e0cd5e5888ed20630dbf28c3ff531bc8e00064cc6fd6bd68deb49c2fe2305ed625de42e91587ce7e241e39dcd8cad0d063";

  var payload = {
    "https://hasura.io/jwt/claims": {
      "x-hasura-user-id": userId.toString(),
      "x-hasura-default-role": role,
      "x-hasura-allowed-roles": [role],
    },
  };
  return jwt.sign(payload, jwtSecret, { expiresIn: "365d" });
}
