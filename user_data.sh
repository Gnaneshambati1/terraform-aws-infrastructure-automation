
#!/bin/bash
set -euxo pipefail

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

cat > /var/www/html/index.html <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Enterprise AWS Infrastructure</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    background: #080d1c;
    color: #ffffff;
    line-height: 1.6;
}

nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 22px 8%;
    background: #0d1428;
    border-bottom: 1px solid #263354;
}

.logo {
    font-size: 21px;
    font-weight: bold;
    color: #ffffff;
}

.logo span {
    color: #38bdf8;
}

.nav-tag {
    color: #86efac;
    font-size: 13px;
    border: 1px solid #166534;
    padding: 7px 14px;
    border-radius: 20px;
}

.hero {
    text-align: center;
    padding: 90px 20px 75px;
    background:
      radial-gradient(ellipse at top, #243b80 0%, #111b3a 38%, #080d1c 75%);
}

.tag {
    display: inline-block;
    padding: 8px 17px;
    border: 1px solid #4361ee;
    border-radius: 30px;
    color: #93c5fd;
    font-size: 13px;
    margin-bottom: 25px;
}

.hero h1 {
    font-size: clamp(34px, 6vw, 58px);
    line-height: 1.15;
    margin-bottom: 20px;
}

.hero h1 span {
    background: linear-gradient(90deg, #38bdf8, #a78bfa, #f472b6);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

.hero p {
    color: #b8c4df;
    max-width: 700px;
    margin: auto;
    font-size: 17px;
}

.status {
    display: inline-flex;
    align-items: center;
    gap: 9px;
    margin-top: 30px;
    background: #123326;
    color: #86efac;
    padding: 12px 20px;
    border-radius: 30px;
    border: 1px solid #23764b;
    font-size: 14px;
}

.dot {
    width: 9px;
    height: 9px;
    border-radius: 50%;
    background: #4ade80;
    box-shadow: 0 0 12px #4ade80;
}

.container {
    max-width: 1120px;
    margin: auto;
    padding: 65px 22px;
}

.section-title {
    text-align: center;
    font-size: 30px;
    margin-bottom: 12px;
}

.section-subtitle {
    text-align: center;
    color: #94a3b8;
    margin-bottom: 38px;
}

.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
}

.card {
    background: linear-gradient(145deg, #172442, #10192e);
    border: 1px solid #29395d;
    border-radius: 16px;
    padding: 27px;
    transition: transform .25s, border-color .25s;
}

.card:hover {
    transform: translateY(-6px);
    border-color: #60a5fa;
}

.card .icon {
    font-size: 32px;
    margin-bottom: 16px;
}

.card h3 {
    font-size: 19px;
    margin-bottom: 9px;
}

.card p {
    color: #aab8d1;
    font-size: 14px;
}

.aws { border-top: 3px solid #f59e0b; }
.terraform { border-top: 3px solid #a78bfa; }
.nginx { border-top: 3px solid #4ade80; }
.ubuntu { border-top: 3px solid #fb7185; }

.architecture {
    background: #101a32;
    border: 1px solid #29395d;
    border-radius: 18px;
    padding: 35px 20px;
    text-align: center;
}

.flow {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
    margin-top: 28px;
}

.node {
    background: #1d3158;
    border: 1px solid #4774bd;
    border-radius: 10px;
    padding: 14px 18px;
    font-weight: bold;
    font-size: 14px;
}

.arrow {
    color: #38bdf8;
    font-size: 23px;
}

.info {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 16px;
    margin-top: 25px;
}

.info-box {
    background: #121e38;
    border: 1px solid #29395d;
    border-radius: 12px;
    padding: 20px;
}

.info-box small {
    color: #94a3b8;
}

.info-box h3 {
    color: #7dd3fc;
    margin-top: 7px;
    font-size: 17px;
}

.cta {
    text-align: center;
    padding: 55px 20px;
    background: linear-gradient(100deg, #172d60, #39256a);
    border-radius: 18px;
}

.cta h2 {
    font-size: 27px;
    margin-bottom: 12px;
}

.cta p {
    color: #d0d9ef;
    margin-bottom: 23px;
}

.button {
    display: inline-block;
    background: linear-gradient(90deg, #38bdf8, #818cf8);
    color: #071126;
    text-decoration: none;
    font-weight: bold;
    padding: 13px 25px;
    border-radius: 9px;
}

footer {
    text-align: center;
    padding: 25px;
    color: #8190aa;
    border-top: 1px solid #263354;
    font-size: 13px;
}

@media(max-width: 600px) {
    nav { padding: 18px 5%; }
    .logo { font-size: 17px; }
    .hero { padding: 65px 18px; }
    .container { padding: 45px 18px; }
    .flow { flex-direction: column; }
    .arrow { transform: rotate(90deg); }
}
</style>
</head>

<body>

<nav>
    <div class="logo">CLOUD<span>ENGINEER</span></div>
    <div class="nav-tag">● Infrastructure Deployed</div>
</nav>

<section class="hero">
    <div class="tag">☁ AWS CLOUD AUTOMATION PROJECT</div>

    <h1>
        Enterprise AWS<br>
        <span>Infrastructure Automation</span>
    </h1>

    <p>
        Designing and deploying scalable cloud infrastructure
        using Terraform Infrastructure as Code, Amazon Web Services
        and automated Nginx web server provisioning.
    </p>

    <div class="status">
        <span class="dot"></span>
        Deployment Successful
    </div>
</section>

<section class="container">
    <h2 class="section-title">Technology Stack</h2>
    <p class="section-subtitle">
        Technologies powering this cloud infrastructure
    </p>

    <div class="cards">
        <div class="card aws">
            <div class="icon">☁️</div>
            <h3>Amazon Web Services</h3>
            <p>Cloud platform hosting the complete infrastructure using VPC, subnet, networking and EC2.</p>
        </div>

        <div class="card terraform">
            <div class="icon">⚙️</div>
            <h3>Terraform</h3>
            <p>Infrastructure as Code to provision and manage AWS resources through reusable configurations.</p>
        </div>

        <div class="card nginx">
            <div class="icon">🌐</div>
            <h3>Nginx</h3>
            <p>High-performance web server automatically installed and configured during EC2 provisioning.</p>
        </div>

        <div class="card ubuntu">
            <div class="icon">🐧</div>
            <h3>Ubuntu 24.04</h3>
            <p>Linux operating system running the EC2 instance and hosting this website.</p>
        </div>
    </div>
</section>

<section class="container">
    <h2 class="section-title">Infrastructure Architecture</h2>
    <p class="section-subtitle">
        How traffic reaches the application
    </p>

    <div class="architecture">
        <p>Cloud infrastructure deployment flow</p>

        <div class="flow">
            <div class="node">🌍 Internet</div>
            <div class="arrow">→</div>
            <div class="node">AWS Internet Gateway</div>
            <div class="arrow">→</div>
            <div class="node">Public Subnet</div>
            <div class="arrow">→</div>
            <div class="node">EC2 Instance</div>
            <div class="arrow">→</div>
            <div class="node">Nginx Web Server</div>
        </div>
    </div>
</section>

<section class="container">
    <h2 class="section-title">Deployment Overview</h2>
    <p class="section-subtitle">
        Key components provisioned through Terraform
    </p>

    <div class="info">
        <div class="info-box">
            <small>Cloud Provider</small>
            <h3>Amazon AWS</h3>
        </div>
        <div class="info-box">
            <small>Infrastructure Tool</small>
            <h3>Terraform</h3>
        </div>
        <div class="info-box">
            <small>Compute Service</small>
            <h3>Amazon EC2</h3>
        </div>
        <div class="info-box">
            <small>Operating System</small>
            <h3>Ubuntu 24.04 LTS</h3>
        </div>
        <div class="info-box">
            <small>Web Server</small>
            <h3>Nginx</h3>
        </div>
        <div class="info-box">
            <small>Deployment Region</small>
            <h3>Asia Pacific (Mumbai)</h3>
        </div>
    </div>
</section>

<section class="container">
    <div class="cta">
        <h2>Infrastructure as Code. Cloud Automation.</h2>
        <p>
            A hands-on project demonstrating AWS networking,
            Terraform modules, remote state management and automated deployment.
        </p>
        <a class="button" href="#top"
           onclick="window.scrollTo({top:0,behavior:'smooth'});return false;">
           Back to Top ↑
        </a>
    </div>
</section>

<footer>
    Enterprise AWS Infrastructure Automation · Built with Terraform & AWS
    <br>
    Cloud Engineering Portfolio Project
</footer>

</body>
</html>
HTML

systemctl reload nginx
systemctl is-active nginx
</CODEBlock>

**Important:** The code above is your new `user_data.sh` content. Replace the existing file with it; don't paste it into `main.tf`.

## Step 2 — Save and verify

After saving `user_data.sh`, run:

```powershell
terraform fmt -recursive
terraform validate
```

<badge color="success">Expected</badge> `Success! The configuration is valid.`

**Stop here and share the output.** Once validation succeeds, we'll create a new Terraform plan, inspect the EC2 replacement, and deploy the upgraded design. Then we'll test the new website and take your state backup.

