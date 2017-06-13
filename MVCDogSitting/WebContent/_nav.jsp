<section class="navbar">
  <div class="grid-row row">
    <c:if test="${sessionScope.user.userName == null}">
      <div class="col">
      <p class="wagly">WAGLY</p>
      <img class ="doggy" src="https://tailwagphotography.com/images/tailwag-logo.png">
        <a class="button" href="viewSitters.do">Home</a>
      </div>
      <div class="col">
        <a class="button" href="loginPage.do">Login</a>
      </div>
      <div class="col">
        <a class="button" href="profilePage.do">Profile</a>
      </div>
    </c:if>
    <c:if test="${sessionScope.user.userName != null}">
      <div class="col">
        <p class="waglysession">WAGLY</p>
        <img class ="doggysession" src="https://tailwagphotography.com/images/tailwag-logo.png">
          <a class="button" href="viewSitters.do">Home</a>
      </div>
      <div class="col">
        <a class="button buttonlogout" href="logout.do">Logout</a> <img
          class="sad"
          src="https://s3-us-west-1.amazonaws.com/studyladder-prod/public/cdn/materials-library/sl-plus/800/r265q2634a2639.png" />
      </div>
      <div class="col"><div id="balance">Hi ${sessionScope.user.userName}!<br/>
        Your balance is :
        <fmt:formatNumber value="${sessionScope.user.balance}" type="currency" /></div>
      </div>
      <div class="col">
        <a class="button" href="profilePage.do">Profile</a>
      </div>
    </c:if>
  </div>
</section>