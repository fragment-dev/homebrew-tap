require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-2-darwin-x64.tar.gz"
    sha256 "522b1f344708a788e8d3e660dea2a77f98550c5732be615242ecd3156349aed4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-2-darwin-arm64.tar.gz"
      sha256 "9c96267ff3e3297c09fe78cb3bee1623104df4e28c79e087b04fea20a71d102e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-2-linux-x64.tar.gz"
    sha256 "3b451138e0c72880caff76cbb246da5b1b2cba44618cd33bcd2bf832d26130a6"
  end
  version "2023.4.25-2"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
