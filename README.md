<br />
<div align="center">
  <a href="https://github.com/Kiirocoin/kiiro-node-1-click-upgrade">
    <img src="https://avatars.githubusercontent.com/u/138875999?s=48&v=4" alt="Logo" width="80" height="80">
  </a>
  <h3 align="center">KIIROCOIN 1 CLICK MASTERNODE UPGRADE</h3>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

Kiirocoin is a privacy focused cryptocurrency that utilizes zero-knowledge proofs which allows users to destroy coins and then redeem them later for brand new ones with no transaction history.

Kiirocoin also utilises Dandelion++ to obscure the originating IP of transactions without relying on any external services such as Tor/i2P.

Kiirocoin uses KiiroPoW (a ProgPoW variant) as its Proof-of-Work GPU focused algorithm which is FPGA/ASIC resistant.

## What Is a Master Node?
Master nodes are part of the infrastructure that sustains Kiiro. Unlike regular nodes, master nodes do not add new blocks of transactions to the blockchain. Instead, they verify new blocks and perform special roles in governing the blockchain.

The one click Masternode upgrade was created to help with upgrading your Masternodes to the latest version so all may easily contribute to the security of the blockchain.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

If you used the kiiro-node-1-click-installer then use the following command to upgrade your node to v1.0.0.4:
<code>git clone https://github.com/Kiirocoin/kiiro-node-1-click-upgrade.git && sudo bash kiiro-node-1-click-upgrade/upgrade.sh</code>

<p>Whether you are hosting with a masternode provider or doing it on your own, ensure you have the latest <a href="https://github.com/Kiirocoin/kiiro/tree/main/" target="_blank">Kiiro wallet</a> and you have already obtained your <strong>1000 KIIRO</strong> (preferably just a bit more to cover fees when you’re transferring around). <strong>Steps 1 and 2 are still required</strong> even if you are going for a masternode provider.</p>
<h3 id="step-1-encrypt-and-backup-your-wallet-on-your-desktop-wallet">Step 1: Encrypt and Backup your wallet on your Desktop wallet</h3>
<p>If you haven’t done so already, make sure you encrypt your wallet on your <strong>local desktop wallet</strong> (PC/Mac/Linux).</p>
<p>Go to <strong>Settings &gt; Encrypt Wallet.</strong></p>
<p>After you have encrypted your wallet, it is also recommended to do a backup via <strong>File &gt; Backup Wallet</strong>. It is recommended to store this wallet on a separate physical drive or pen drive. The wallet.dat is encrypted so even if the wallet.dat is exposed, if your password is long enough, it will be secure.</p>
<p><strong>Please don’t forget your password! No one can help you if you lose your password.</strong></p>
<h3 id="step-2-collateral-your-1000-kiiro-on-your-desktop-wallet">Step 2: collateral your 1000 KIIRO on your Desktop wallet</h3>
<p>Your collateral address is where you will be storing your 1000 KIIRO.</p>
<p>You can create the collateral address in two ways: using the Receive tab, OR in the Debug Window</p>
<h4 id="receive-tab">Receive tab:</h4>
<p>Click on the Receive tab. Enter a label for your collateral address in the Label field and click on Request Payment. A window should pop up with a Kiiro address.</p>
<h4 id="debug-window">Debug Window:</h4>
<p>Go to Help &gt; Debug Window &gt; Console and type in</p>
<p><code class="language-plaintext highlighter-rouge">getnewaddress</code></p>
<p>In one single transaction, send <strong>exactly 1000 KIIRO</strong> into the masternode collateral address that you created. Do not send 500 and then another 500. <strong>It has to be in one single transaction. Do not tick subtract fee from amount.</strong></p>
<p>It is not recommended to send it direct from an exchange as they might deduct certain withdrawal fees resulting in less than 1000 KIIRO in that transfer.</p>
<p>Wait <strong>1 confirmation</strong> for this transaction to be valid as your masternode collateral. When done correctly, the transaction id and transaction index will appear when you execute this command in the Debug Console:</p>
<p><code class="language-plaintext highlighter-rouge">evoznode outputs</code></p>
<h4 id="special-notes-only-for-those-who-are-creating-more-than-one-masternode">Special Notes only for those who are creating more than one masternode:</h4>
<p>If you are doing more than one masternode, special care is required to ensure that you are creating collaterals properly. You do not want to break the previous 1000 KIIRO collateral you just made by taking funds from that collateral.</p>
<p>To do this, on your <strong>local desktop wallet</strong> turn on coin control by going to <strong>Settings &gt; Options &gt; Wallet</strong> and click on <strong>Enable coin control features.</strong> This will enable control of which funds you are using when making your next 1000 KIIRO collateral.</p>
<p>Then go to your Send tab, and you will see <strong>Coin Control Features</strong>. Click on <strong>Inputs</strong>. You should see your 1000 KIIRO collateral there. Right click and click <strong>Lock Unspent</strong>. This means that when making your new collateral, your wallet will not touch these funds.</p>
<p>Once you have done this, you can make the next 1000 KIIRO collateral for your next masternode. Repeat this everytime you have made a new masternode.</p>
<p>You can always verify you’re doing this correctly by going into <strong>Help &gt; Debug Window</strong> and typing <strong>evoznode outputs</strong> which would display all masternode capable collaterals.</p>
<h3 id="step-3-creating-owneraddress-payoutaddress-feesourceaddress-and-operatorkeyoperatorpubkey">Step 3: Creating ownerAddress, payoutAddress, feeSourceAddress and operatorKey/operatorPubKey</h3>
<p><em>a, b, and c can be generated through Receive tab or the Debug Window, just like the collateral address above.</em></p>
<h4 id="a-owneraddress">a. ownerAddress</h4>
<p>Proof that you own the masternode. Must be in the same wallet as collateral. <strong>DO NOT USE THE COLLATERAL ADDRESS AS OWNER ADDRESS.</strong></p>
<p><strong>DO NOT SEND COINS TO THE OWNER ADDRESS. DO NOT USE IT AS PAYOUT ADDRESS. DO NOT USE THIS ADDRESS FOR ANY OTHER PURPOSE.</strong></p>
<h4 id="b-payoutaddress">b. payoutAddress</h4>
<p>Address the masternode will pay out to. Can be inside the same wallet or an external address.</p>
<h4 id="c-feesourceaddress">c. feeSourceAddress</h4>
<p>An address with funds to pay the transaction fee for registering your masternode. To get a list of addresses with funds, enter the following command in the Debug Window:</p>
<p><code class="language-plaintext highlighter-rouge">listaddressbalances 0.01</code></p>
<p>If you do not have any, you can create an address and send some Kiiros there. You can then use the address as feeSourceAddress.</p>
<h4 id="d-operatorkeyoperatorpubkey">d. operatorKey/operatorPubKey</h4>
<p>In Debug Console, enter bls generate. The output will be similar to this:</p>
<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>{
    "secret": "2e551176c4cd5a2e26f3a1c61f151487e013f7095ffbc0f62b5c2b251e7bd84c",
    "public": "89d395bc75e99527e80d3bbd408a5b41bbf37e7e1e26c5924da734008d1aa4a3f5e42a968bef541cb1c9a0899280d29b"
}
</code></pre></div></div>
<p><strong>secret</strong>: This is your operatorKey (for protx) and also the znodeblsprivkey for use in Step 6.</p>
<p><strong>public</strong>: This is your operatorPubKey (for protx)</p>
<p>You cannot <strong>regenerate the same pair of keys,</strong> but you can generate the public key from the secret key if you lose the public key.</p>
<h3 id="step-4-get-a-vps">Step 4: Get a VPS</h3>
<p>There are many providers to choose out there.</p>
<p> <a href="https://hetzner.cloud/?ref=mPIIBRuHJtB4" target="_blank">Hetzner "start from 4.2 euro"</a></p>
<p>  <a href="https://www.vpsag.com/?aff=36435" target="_blank">Vpsag "start from 3.66euro"</a></b>
<p>Select a VPS package that meets the minimum requirements:</p>
<ul>
  <li>1.5 GB of RAM (2 GB with swap on recommended)</li>
  <li>25 GB of disk space </li>
</ul>
<p><strong>Note:</strong> With KiiroPoW, the blockchain grows at a rate of about 1 GB per year. Please make sure you pick a VPS with sufficient disk space.</p>
<p>When choosing a server, please remember reliability is more important than price. If your masternode goes offline, you will potentially miss out on payouts which would be more than your VPS cost.</p>
<p>Pick <strong>Ubuntu 20.04 64-bit</strong> and install it.</p>
<p>Once it is done, the VPS provider should give you a username (usually root) and a password. Use a SSH client like <a href="https://www.putty.org/">Putty</a> or if the VPS provider provides, it open up a console window.</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- USAGE EXAMPLES -->
## Usage

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.md` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Project Link: [https://github.com/Kiirocoin](https://github.com/Kiirocoin)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
